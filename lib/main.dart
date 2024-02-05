import 'package:catbreeds/cat_breeds_page.dart';
import 'package:catbreeds/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cat Breeds',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

