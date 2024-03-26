import 'package:flutter/material.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:wan/net/request.dart';
import 'package:wan/ui/auth/data/entity/login_entity.dart';
import 'package:wan/ui/home/bottom_bar.dart';
import 'package:wan/ui/home/content.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';
import 'package:wan/ui/home/drawer.dart';

import '../../net/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getBanners() async {
    final result = await get<List<BannerEntity>>("/banner/json");
    result.when(
      onSuccess: (banners) {
        if (banners != null && banners.isNotEmpty) {
          debugPrint('ccc=${banners[0].desc}');
        }
      },
      onFailure: (e) {
        debugPrint(e.message);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeContent(controller: _controller,onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });
          },),
          BottomBar(
            currentIndex: _currentIndex,
            onItemSelected: (index) {
              _currentIndex = index;
              _controller.jumpToPage(index);
            },
          ),
        ],
      ),
      drawer: const SlideDrawer(),
    );
  }
}
