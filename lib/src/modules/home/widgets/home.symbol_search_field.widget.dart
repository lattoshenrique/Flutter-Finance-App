import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:get/get.dart';

class SymbolSearchFieldWidget extends GetView<HomeController> {
  const SymbolSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(horizontal: media.width * 0.05, vertical: media.width * 0.1),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(color: AppColors.PRIMARY.withOpacity(0.5), blurRadius: 10.0, spreadRadius: 0.5, offset: const Offset(1.0, 5.5)),
            ],
            color: AppColors.PRIMARY),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Pesquisar Ativo", style: AppStyles.head1.copyWith(color: Colors.white, fontSize: media.width * 0.06)),
              SizedBox(height: media.width * 0.05),
              TextField(
                  controller: controller.searchController,
                  focusNode: controller.searchFocus,
                  onChanged: (query) {
                    if (query.length > 2) controller.onChangeHandler(query);
                  },
                  decoration: InputDecoration(
                    hintText: "Símbolo, nome...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Obx(() => controller.term.isNotEmpty
                        ? IconButton(
                            onPressed: (() {
                              controller.searchFocus.unfocus();
                              controller.searchController.clear();
                              controller.term = '';
                            }),
                            icon: const Icon(Icons.clear),
                          )
                        : const Icon(Icons.abc, color: Colors.transparent)),
                  ))
            ]));
  }
}
