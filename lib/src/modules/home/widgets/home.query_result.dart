import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:get/get.dart';

class QueryResultWidget extends GetView<HomeController> {
  const QueryResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: media.width * 0.05),
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(() => controller.isLoading
                    ? Padding(padding: EdgeInsets.all(media.width * 0.01), child: const CircularProgressIndicator(color: AppColors.PRIMARY))
                    : controller.queryResult.isNotEmpty
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: controller.queryResult.length,
                            separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.03),
                                child: const Divider(thickness: 1, height: 0, color: AppColors.GRAYD0)),
                            itemBuilder: ((context, index) {
                              var item = controller.queryResult;
                              return InkWell(
                                  onTap: () {
                                    controller.searchFocus.unfocus();
                                    controller.loadChart(item[index].symbol!);
                                  },
                                  child: Container(
                                      width: media.width,
                                      padding: EdgeInsets.symmetric(horizontal: media.width * 0.05),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        SizedBox(
                                            width: media.width * 0.7,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(item[index].symbol!, style: AppStyles.head1),
                                                  Text(item[index].name!, style: AppStyles.caption2.copyWith(fontWeight: FontWeight.normal)),
                                                ])),
                                        SizedBox(
                                            width: media.width * 0.1,
                                            child: Icon(Icons.arrow_forward_ios, color: AppColors.PRIMARY, size: media.width * 0.05))
                                      ])));
                            }))
                        : Column(children: [
                            Text("Nenhum resultado para o termo:", style: AppStyles.head2),
                            Text('"${controller.searchController.text}"', style: AppStyles.caption2)
                          ])))));
  }
}
