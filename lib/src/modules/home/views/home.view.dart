import 'package:guide_selective_process/src/core/models/charts.model.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.price_card.widget.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.query_result.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.symbol_search_field.widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Variação do Ativo", style: AppStyles.caption1),
          centerTitle: true,
          actions: [
            Obx(() => controller.isSearch.value
                ? Container()
                : IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {
                      controller.chart = ChartsModel();
                      controller.isSearch.value = true;
                    },
                  ))
          ],
        ),
        key: controller.homeScaffoldKey,
        body: SafeArea(
            bottom: false,
            child: Padding(
                padding: EdgeInsets.all(media.width * 0.05),
                child: Stack(alignment: Alignment.center, children: [
                  Obx(() => (!controller.isSearch.value)
                      ? const HomePriceCard()
                      : AnimatedPadding(
                          padding: MediaQuery.of(context).viewInsets,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.decelerate,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [const SymbolSearchField(), Obx(() => (controller.term.isEmpty) ? Container() : const QueryResult())]))),
                ]))));
  }
}
