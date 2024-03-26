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

  int _counter = 0;

  @override
  void initState() {
    super.initState();
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

  void _incrementCounter() {
    getBanners();
    // _doLogin();
    setState(() {
      _counter++;
    });
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
          HomeContent(),
          BottomBar(
            currentIndex: _currentIndex,
            onItemSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
      drawer: const SlideDrawer(),
    );
  }
}
