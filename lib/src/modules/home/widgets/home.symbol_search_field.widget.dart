import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/models/search.model.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/core/styles/appstyles.style.dart';
import 'package:guide_selective_process/src/core/widgets/search_field.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';

import 'package:get/get.dart';

class SymbolSearchField extends GetView<HomeController> {
  const SymbolSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Obx(() => SearchField<SearchModel>(
        emptyWidget: (controller.queryResult.isEmpty && controller.searchController.text.isNotEmpty)
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.6), blurRadius: 8.0, spreadRadius: 2.0, offset: const Offset(1.0, 0.5)),
                  ],
                ),
                child: Padding(
                    padding: EdgeInsets.all(media.width * 0.05), child: const Center(child: CircularProgressIndicator(color: AppColors.PRIMARY))))
            : Container(),
        hint: "Pesquisar...",
        suggestionAction: SuggestionAction.next,
        itemHeight: media.width * 0.2195,
        maxSuggestionsInViewPort: 5,
        controller: controller.searchController,
        onChanged: (query) {
          if (query.length > 2) controller.loadSymbol();
        },
        onSuggestionTap: (i) {
          controller.loadChart(i.item!.symbol!);
          FocusScope.of(context).unfocus();
        },
        suggestions: (controller.queryResult.isNotEmpty)
            ? controller.queryResult
                .map(
                  (e) => SearchFieldListItem<SearchModel>(
                    e.symbol!,
                    child: Padding(
                        padding: EdgeInsets.all(media.width * 0.05),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(e.symbol!, style: AppStyles.head1),
                          RichText(
                            text: TextSpan(text: e.name!, style: AppStyles.body1),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          //Text(e.name!, style: AppStyles.body1, maxLines: 1)
                        ])),
                    item: e,
                  ),
                )
                .toList()
            : []));
  }
}
