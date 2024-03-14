import 'package:flutter/material.dart';
import 'package:fluttery_timber/debug_tree.dart';
import 'package:fluttery_timber/fluttery_timber.dart';
import 'package:provider/provider.dart';
import 'package:wan/global/global.dart';
import 'package:wan/global/provider/model/auth.dart';
import 'package:wan/log/tree.dart';
import 'package:wan/ui/auth/login.dart';
import 'package:wan/ui/home/home.dart';
import 'package:wan/ui/routes.dart';

void main() async {
  // if (Platform.isAndroid) {
  //   SystemChrome.setSystemUIOverlayStyle(
  //       const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
  // }

  final global = Global.get();
  await global.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authed: global.authed),
        ),
      ],
      child: const WanApp(),
    ),
  );
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
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black87,
        ),
        useMaterial3: true,
      ),
      initialRoute: Routes.root,
      routes: {
        Routes.root: (_) => const HomePage(title: 'Wan'),
        Routes.login: (_) => const LoginPage(),
      },
    );
  }
}
