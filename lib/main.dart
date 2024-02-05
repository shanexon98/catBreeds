import 'package:catbreeds/presentation/components/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Cat Breeds',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      
    );
  }
}

