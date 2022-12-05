import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/widgets/chart.price_variation.card.widget.dart';
import 'package:intl/intl.dart';

class ChartPriceVariationView extends GetView<HomeController> {
  const ChartPriceVariationView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("${controller.chart.meta!.symbol!}: Últimos 30 Pregões", style: AppStyles.caption1),
          centerTitle: true,
        ),
        key: controller.priceVariationScaffoldKey,
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(children: [
              Column(children: [
                Padding(
                    padding: EdgeInsets.all(media.width * 0.05),
                    child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: controller.chart.timestamp!.length,
                        separatorBuilder: (context, index) => const Divider(color: Colors.transparent),
                        itemBuilder: ((context, index) {
                          //
                          //vars
                          var item = controller.chart;
                          var firstValue = item.indicators?.quote?[0].open?[0] ?? 0.0;
                          var itemValue = item.indicators?.quote?[0].open?[index] ?? 0.0;

                          return PriceVariationCardWidget(
                              day: "${index + 1}",
                              date: DateFormat("dd/MM/yyyy").format(DateTime.fromMillisecondsSinceEpoch(item.timestamp![index] * 1000)),
                              type: (index == 0 || itemValue == 0.0 || item.indicators?.quote?[0].open?[index - 1] == null)
                                  ? 0
                                  : (itemValue > item.indicators!.quote![0].open![index - 1]!)
                                      ? 1
                                      : 2,
                              value: itemValue == 0.0 ? " - " : 'R\$ ${NumberFormat('#,##0.00', 'pt_BR').format(double.parse('$itemValue'))}',
                              d1Variation: (index == 0 || itemValue == 0.0 || item.indicators?.quote?[0].open?[index - 1] == null)
                                  ? ' - '
                                  : (itemValue > item.indicators!.quote![0].open![index - 1]!)
                                      ? '+${(((itemValue - item.indicators!.quote![0].open![index - 1]!) / itemValue) * 100).toStringAsFixed(2)}%'
                                      : '-${(((item.indicators!.quote![0].open![index - 1]! - itemValue) / item.indicators!.quote![0].open![index - 1]!) * 100).toStringAsFixed(2)}%',
                              firstDateVariation: (index == 0 || firstValue == 0.0 || itemValue == 0.0)
                                  ? ' - '
                                  : (itemValue > firstValue)
                                      ? '+${(((itemValue - firstValue) / itemValue) * 100).toStringAsFixed(2)}%'
                                      : '-${(((firstValue - itemValue) / firstValue) * 100).toStringAsFixed(2)}%');
                        }))),
              ])
            ])));
  }
}
