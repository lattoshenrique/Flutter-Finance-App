import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
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
        ),
        key: controller.homeScaffoldKey,
        body: SafeArea(
            bottom: false,
            child: Padding(
                padding: EdgeInsets.all(media.width * 0.05),
                child: Obx(() => AnimatedAlign(
                    alignment: (controller.searchFocus.hasFocus || controller.term.isNotEmpty) ? Alignment.topCenter : Alignment.center,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [const SymbolSearchFieldWidget(), controller.term.isEmpty ? Container() : const QueryResultWidget()]))))));
  }
}
