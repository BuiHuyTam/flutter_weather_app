// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_crud/app/routes/app_pages.dart';
import 'package:flutter_crud/app/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  runApp(GetMaterialApp(
    title: "Weather Application",
    getPages: AppPages.pages,
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.HOURLY,
  ));
}
