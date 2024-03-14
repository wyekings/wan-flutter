import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan/global/provider/model/auth.dart';
import 'package:wan/ui/routes.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({super.key});

  @override
  State<SlideDrawer> createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer> {
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
        const SizedBox(
          height: 182,
          child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundImage:
                        AssetImage('assets/images/ic_flutter_dark.png'),
                    radius: 36,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'wan',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
        const ListTile(
          leading: Icon(Icons.score),
          title: Text('我的积分'),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('系统设置'),
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('退出登录'),
        ),
      ];
}
