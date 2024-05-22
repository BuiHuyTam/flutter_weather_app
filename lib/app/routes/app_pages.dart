import 'package:flutter_crud/app/modules/chart/chart_page.dart';
import 'package:flutter_crud/app/modules/favorite/favourite.dart';
import 'package:flutter_crud/app/modules/home/home.dart';
import 'package:get/get.dart';
import './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.HOME, page: () => const Home()),
    GetPage(name: AppRoutes.FAVOURITES, page: () => const Favourite()),
    GetPage(name: AppRoutes.HOURLY, page: () => WeatherChart())
  ];
}
