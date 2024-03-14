import 'package:flutter/material.dart';

class WanAppBar extends AppBar {
  WanAppBar({
    super.key,
    required String title,
    void Function()? onBack,
  }) : super(
          title: Text(title),
          backgroundColor: Colors.black87,
          leading: onBack != null
              ? IconButton(
                  onPressed: () => onBack(),
                  icon: const Icon(Icons.arrow_back),
                )
              : null,
        );
}
