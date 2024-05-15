import 'package:flutter/material.dart';
import 'package:flutter_crud/app/global_widgets/header.dart';
import 'package:get/get.dart';

import './controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Controller controller = Get.put(Controller(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(() => controller.loading().isTrue
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Header(),
                      // CurrentWeather(),
                    ],
                  ))));
  }
}
