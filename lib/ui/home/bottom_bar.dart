import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;

  final ValueChanged<int> onItemSelected;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black38,
        backgroundColor: Colors.white,
        onTap: widget.onItemSelected,
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: '广场',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
