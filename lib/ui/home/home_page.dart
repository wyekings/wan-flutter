import 'package:flutter/material.dart';
import 'package:wan/net/request.dart';
import 'package:wan/ui/home/data/entity/banner_entity.dart';
import 'package:wan/ui/home/slide_drawer.dart';

import '../../net/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  void getBanners() async {
    final result = await get<List<BannerEntity>,BannerEntity>(
        "/banner/json", (json) => BannerEntity.fromJson(json));
    result.when(
      onSuccess: (banners) {
        if (banners != null && banners.isNotEmpty) {
          debugPrint(banners[0].desc);
        }
      },
      onFailure: (e) {
        debugPrint(e.message);
      },
    );
  }

  void _incrementCounter() {
    setState(() {
      getBanners();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      drawer: const SlideDrawer(),
    );
  }
}
