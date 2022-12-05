import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/routes/app.routes.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/widgets/home.card_button.widget.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class HomePriceCardWidget extends GetView<HomeController> {
  const HomePriceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Obx(() => Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.1),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Flexible(
                      child: Text(
                    controller.chart.meta!.symbol!,
                    style: AppStyles.head1.copyWith(fontSize: media.width * 0.1),
                  )),
                  SizedBox(width: media.width * 0.05),
                  Icon((controller.cardView.isPositive!) ? Icons.trending_up : Icons.trending_down,
                      size: media.width * 0.1, color: (controller.cardView.isPositive!) ? Colors.green : Colors.red),
                ]),
                Text(DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(controller.chart.timestamp!.last * 1000)),
                    style: AppStyles.subtitle1),
                SizedBox(height: media.width * 0.05),
                Row(children: [
                  Flexible(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.1),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(
                              children: [
                                Flexible(
                                    child: Text(NumberFormat('#,##0.00', 'pt_BR').format(controller.chart.indicators?.quote?[0].open?.last ?? 0.0),
                                        style: AppStyles.head1
                                            .copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: media.width * 0.12))),
                                SizedBox(width: media.width * 0.02),
                                Text("BRL", style: AppStyles.body1.copyWith(fontSize: media.width * 0.05)),
                              ],
                            ),
                            Text(
                                (controller.cardView.isPositive!)
                                    ? "+${NumberFormat('#,##0.00', 'pt_BR').format(controller.cardView.diff!)} (+${controller.cardView.percentage!.toStringAsFixed(2)}%)"
                                    : "-${NumberFormat('#,##0.00', 'pt_BR').format(controller.cardView.diff!)} (-${controller.cardView.percentage!.toStringAsFixed(2)}%)",
                                style: AppStyles.body1.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: media.width * 0.06,
                                    color: (controller.cardView.isPositive!) ? Colors.green : Colors.red)),
                            SizedBox(height: media.width * 0.02),
                            Text('Baseado na abertura do último pregão', style: AppStyles.subtitle1)
                          ]))),
                ]),
                SizedBox(height: media.width * 0.05),
                InkWell(
                    onTap: () => Get.toNamed(AppRoutes.PRICE_VARIATION),
                    child: const HomeCardButtonWidget(
                      icon: Icons.analytics,
                      text: "Variação do Preço",
                    )),
                SizedBox(height: media.width * 0.03),
                InkWell(
                    onTap: () => Get.toNamed(AppRoutes.CHART),
                    child: const HomeCardButtonWidget(
                      icon: Icons.bar_chart,
                      text: "Gráfico",
                    ))
              ]))
        ]));
  }
}
