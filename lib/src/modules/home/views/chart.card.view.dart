import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/widgets/chart.price_card.widget.dart';

class ChartCardView extends GetView<HomeController> {
  const ChartCardView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Obx(() => Text(controller.isLoading ? "Carregando..." : controller.chart.meta!.symbol!, style: AppStyles.caption1)),
          centerTitle: true,
        ),
        key: controller.chartCardScaffoldKey,
        body: SafeArea(
            bottom: false,
            child: Padding(
                padding: EdgeInsets.all(media.width * 0.05), child: const Align(alignment: Alignment.center, child: ChartPriceCardWidget()))));
  }
}
