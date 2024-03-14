import 'package:flutter/material.dart';
import 'package:wan/widget/appbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: WanAppBar(
          title: '登录',
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(),
        ),
      ),
    );
  }
}
