import 'package:flutter/material.dart';
import 'package:flutter_crud/app/modules/home/home.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      title: "Weather Prediction",
    );
  }
}
