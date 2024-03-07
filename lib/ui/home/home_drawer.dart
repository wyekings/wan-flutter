import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan/global/provider/model/auth.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({super.key});

  @override
  State<SlideDrawer> createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer> {
  @override
  Widget build(BuildContext context) {
    bool authed = context.watch<AuthProvider>().authed;
    String name = authed == true? '已登录' : '未登录';

    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
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
                        name,
                        style: const TextStyle(
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
        ],
      ),
    );
  }
}
