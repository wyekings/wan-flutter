import 'package:flutter/material.dart';

class WanAppBar extends AppBar {
  WanAppBar({super.key, super.leading, required String title})
      : super(title: Text(title));
}
