import 'package:flutter/material.dart';
import 'package:wan/net/client_options.dart';
import 'package:wan/net/response_decoder.dart';
import 'package:wan/ui/home/home_page.dart';

void main() {
  // if (Platform.isAndroid) {
  //   SystemChrome.setSystemUIOverlayStyle(
  //       const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
  // }
  ClientOptions.builder()
      .baseUrl('https://www.wanandroid.com')
      .decoder(BaseResponseDecoder.getInstance())
      .build()
      .apply();
  runApp(const WanApp());
}

class WanApp extends StatelessWidget {
  const WanApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: SystemUiOverlayStyle(),
    //   child: Scaffold(),
    // );
    return MaterialApp(
      title: 'Wan',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          elevation: 0,
          centerTitle: true,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   statusBarColor: Colors.transparent,
          //   statusBarBrightness: Brightness.light,
          // ),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Wan'),
    );
  }
}
