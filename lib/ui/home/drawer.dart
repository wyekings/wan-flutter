import 'package:flutter/material.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:provider/provider.dart';
import 'package:wan/global/global.dart';
import 'package:wan/global/provider/model/auth.dart';
import 'package:wan/net/request.dart';
import 'package:wan/net/result.dart';
import 'package:wan/ui/home/data/entity/user_info_entity.dart';
import 'package:wan/ui/home/domain/model/user_info.dart';
import 'package:wan/ui/routes.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({super.key});

  @override
  State<SlideDrawer> createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer> {
  var userInfo = UserInfo('', 0);

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    final result = await get<UserInfoEntity>('/lg/coin/userinfo/json');
    result.when(
      onSuccess: (value) {
        setState(() {
          userInfo = UserInfo(value.username ?? '', value.coinCount ?? 0);
        });
      },
      onFailure: (e) {
        Timber.d('getUserInfo error=${e.message}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool authed = context.watch<AuthProvider>().authed;
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: authed ? _authedDrawerContent() : _unauthedDrawerContent(),
      ),
    );
  }

  List<Widget> _unauthedDrawerContent() {
    return [
      SizedBox(
        height: 182,
        child: DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black87),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage:
                      AssetImage('assets/images/ic_flutter_dark.png'),
                  radius: 36,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    child: const Text(
                      '登录',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.login);
                    },
                  ),
                )
              ],
            )),
      ),
    ];
  }

  List<Widget> _authedDrawerContent() => [
         SizedBox(
          height: 182,
          child: DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black87),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundImage:
                        AssetImage('assets/images/ic_flutter_dark.png'),
                    radius: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      userInfo.userName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
        ListTile(
          leading: const Icon(Icons.score),
          title: Text('我的积分 ${userInfo.coinCount}'),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('系统设置'),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('退出登录'),
          onTap: () {
            context.read<AuthProvider>().logout();
            Global.get().clear();
          },
        ),
      ];
}
