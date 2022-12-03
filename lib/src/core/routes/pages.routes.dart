// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/views/chart.view.dart';
import 'package:guide_selective_process/src/modules/home/views/price_variation.view.dart';
import 'package:guide_selective_process/src/modules/home/views/home.view.dart';
import 'app.routes.dart';

class PagesRoutes {
  //Initial Route
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(name: AppRoutes.HOME, page: () => const HomeView()),
    GetPage(name: AppRoutes.PRICE_VARIATION, page: () => const PriceVariationView()),
    GetPage(name: AppRoutes.CHART, page: () => const ChartView()),
  ];
}
