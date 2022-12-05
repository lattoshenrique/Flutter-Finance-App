import 'package:guide_selective_process/src/core/widgets/loading_box.widget.dart';
import 'package:flutter/material.dart';

class LoadingChartPriceCardWidget extends StatelessWidget {
  const LoadingChartPriceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.1),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            LoadingBox(media.width * 0.7, media.width * 0.12),
            SizedBox(height: media.width * 0.02),
            LoadingBox(media.width * 0.5, media.width * 0.07),
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
                        LoadingBox(media.width * 0.7, media.width * 0.14),
                        SizedBox(height: media.width * 0.02),
                        LoadingBox(media.width * 0.5, media.width * 0.08),
                      ]))),
            ]),
            SizedBox(height: media.width * 0.05),
            LoadingBox(media.width * 0.8, media.width * 0.14),
            SizedBox(height: media.width * 0.03),
            LoadingBox(media.width * 0.8, media.width * 0.14),
          ]))
    ]);
  }
}
