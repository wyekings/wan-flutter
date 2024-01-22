import 'package:flutter/material.dart';

class SlideDrawer extends StatefulWidget {
  const SlideDrawer({super.key});

  @override
  State<SlideDrawer> createState() => _SlideDrawerState();
}

class _SlideDrawerState extends State<SlideDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          SizedBox(
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
                        'Wan',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          ),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('我的积分'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('系统设置'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('退出登录'),
          ),
        ],
      ),
    );
  }
}
