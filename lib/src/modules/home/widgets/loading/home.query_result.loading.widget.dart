import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/widgets/loading_box.widget.dart';
import 'package:flutter/material.dart';

class LoadingQueryResult extends StatelessWidget {
  const LoadingQueryResult({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            width: media.width,
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                LoadingBox(media.width * 0.5, media.width * 0.07),
                SizedBox(height: media.width * 0.01),
                LoadingBox(media.width * 0.8, media.width * 0.07),
              ]),
            ]));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.03),
            child: const Divider(thickness: 1, height: 0, color: AppColors.GRAYD0));
      },
    );
  }
}
