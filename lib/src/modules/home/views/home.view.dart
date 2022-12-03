import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.price_card.widget.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.symbol_search_field.widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: controller.homeScaffoldKey,
        backgroundColor: Colors.white,
        body: SizedBox(
            height: media.height,
            width: media.width,
            child: Column(children: [
              Container(
                height: media.height * 0.3,
                padding: EdgeInsets.fromLTRB(media.width * 0.05, media.width * 0.15, media.width * 0.05, media.width * 0.1),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 8.0, spreadRadius: 2.0, offset: const Offset(1.0, 0.5)),
                    ],
                    // borderRadius: const BorderRadius.only(
                    //     bottomLeft: Radius.circular(10.0),
                    //     bottomRight: Radius.circular(10.0)),
                    color: AppColors.PRIMARY),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Variação do Ativo", style: AppStyles.head1.copyWith(color: Colors.white, fontSize: media.width * 0.07)),
                    SizedBox(height: media.width * 0.05),
                    const SymbolSearchField(),
                  ],
                ),
              ),
              SizedBox(
                  height: media.height * 0.7,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Obx(() => Column(children: [
                            Padding(
                                padding: EdgeInsets.all(media.width * 0.05),
                                child: (controller.chart.meta == null && !controller.isLoading)
                                    ? Icon(Icons.query_stats, size: media.width * 0.3, color: Colors.grey.withOpacity(0.5))
                                    : (controller.isLoading)
                                        ? const Center(child: CircularProgressIndicator(color: AppColors.PRIMARY))
                                        : const HomePriceCard()),
                          ]))))
            ])));
  }
}
