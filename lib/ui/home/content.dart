import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  const HomeContent(
      {super.key, required this.controller, required this.onPageChanged});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: PageView(
      controller: widget.controller,
      onPageChanged: widget.onPageChanged,
      children: const [
        Center(
          child: Text('首页'),
        ),
        Center(
          child: Text('广场'),
        ),
        Center(
          child: Text('我的'),
        ),
      ],
    ));
  }
}
