import 'package:flutter/material.dart';
import 'package:wan/ui/home/home_page.dart';

void main() {
  runApp(const WanApp());
}

class WanApp extends StatelessWidget {
  const WanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Wan'),
    );
  }
}

