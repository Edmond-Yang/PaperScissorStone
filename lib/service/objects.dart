import 'dart:math';

import 'package:flutter/material.dart';

class Objects {
  int value;
  String url;
  Random _random = Random();

  Objects({required this.value, required this.url});

  Widget createObjects() {
    return IconButton(
      icon: Image.asset('images/$url'),
      onPressed: () {
        
      },
    );
  }
}
