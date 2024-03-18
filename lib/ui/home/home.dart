import 'package:flutter/material.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:wan/net/request.dart';
import 'package:wan/ui/auth/data/entity/login_entity.dart';
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
  int _counter = 0;

  @override
  void initState() {
    getBanners();
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

  void _doLogin() async {
    final params = {'username': 'wptdxii', 'password': '72762922'};
    final result =
    await post<LoginEntity>('/user/login', queryParameters: params);
    result.when(
      onSuccess: (value) {
        Timber.d('onSuccess=$value');
      },
      onFailure: (e) {
        Timber.e(e.message);
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
