import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:get/get.dart';

class HomeCardButton extends GetView {
  final String text;
  final IconData icon;
  final String? subtitle;

  const HomeCardButton({this.subtitle, required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.all(media.width * 0.05),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.BUTTON,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(text, style: AppStyles.head1.copyWith(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.normal)),
            (subtitle != null) ? Text(subtitle!, style: AppStyles.subtitle1.copyWith(fontSize: 13.0)) : Container()
          ]),
          SizedBox(width: media.width * 0.03),
          Icon(icon, size: 25.0, color: Colors.white),
        ]));
  }
}
