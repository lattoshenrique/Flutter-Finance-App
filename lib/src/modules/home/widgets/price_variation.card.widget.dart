import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:get/get.dart';

class PriceVariationCard extends GetView {
  final String day;
  final String date;
  final int type;
  final String value;
  final String d1Variation;
  final String firstDateVariation;

  const PriceVariationCard(
      {required this.day,
      required this.date,
      required this.type,
      required this.value,
      required this.d1Variation,
      required this.firstDateVariation,
      super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.all(media.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Dia $day", style: AppStyles.head2.copyWith(fontSize: media.width * 0.05)),
              Text(date, style: AppStyles.head2.copyWith(color: Colors.grey, fontSize: media.width * 0.04, fontWeight: FontWeight.normal))
            ]),
            Container(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.04, vertical: media.width * 0.02),
              decoration: BoxDecoration(
                color: type == 0
                    ? Colors.grey.withOpacity(0.3)
                    : type == 1
                        ? Colors.green.withOpacity(0.3)
                        : Colors.red.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(value, style: AppStyles.body1.copyWith(fontSize: media.width * 0.04, color: Colors.black, fontWeight: FontWeight.bold)),
            )
          ]),
          SizedBox(height: media.height * 0.01),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(children: [
                Container(
                    padding: EdgeInsets.all(media.width * 0.02),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Flexible(child: Text("Variação em relação a D-1:", style: AppStyles.body1.copyWith(fontSize: media.width * 0.035))),
                      Text(d1Variation, style: AppStyles.body1.copyWith(fontSize: media.width * 0.035, fontWeight: FontWeight.bold)),
                    ])),
                Container(
                    padding: EdgeInsets.all(media.width * 0.02),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Flexible(child: Text("Variação em relação a primeira data:", style: AppStyles.body1.copyWith(fontSize: media.width * 0.035))),
                      Text(firstDateVariation, style: AppStyles.body1.copyWith(fontSize: media.width * 0.035, fontWeight: FontWeight.bold)),
                    ]))
              ])),
        ]));
  }
}
