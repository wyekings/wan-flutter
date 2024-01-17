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
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
              child: Column(
            children: [
              CircleAvatar(
                radius: 40,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Wan',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ))
        ],
      ),
    );
  }
}
