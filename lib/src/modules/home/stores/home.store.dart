// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:guide_selective_process/src/core/enums/loadingstatus.enum.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/core/models/charts.model.dart';
import 'package:guide_selective_process/src/core/models/search.model.dart';
import 'package:guide_selective_process/src/core/repositories/search.repository.dart';
import 'package:guide_selective_process/src/core/stores/filterparams.store.dart';
import 'package:guide_selective_process/src/core/styles/appcolors.style.dart';
import 'package:guide_selective_process/src/modules/home/models/card.model.dart';

class HomeStore extends GetxController {
  final SearchRepository _searchRepository = Get.find();
  final FilterParamsStore _filterParams = Get.find();

  final loadingStatus = ELoadingStatus.completed.obs;

  final queryResult = <SearchModel>[].obs;
  CardViewModel? cardView;

  ChartsModel get chart => _filterParams.chart;
  set chart(ChartsModel val) => _filterParams.chart = val;

  //
  //Call functions

  searchSymbol(String term) async {
    queryResult.value = [];
    queryResult.assignAll(await _searchRepository.fetchSymbol(term));
    if (queryResult.isEmpty) {
      Get.snackbar("Oops!", 'Não encontrei resultados para o termo: "$term"',
          margin: const EdgeInsets.all(20.0), snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.SECUNDARY);
    }
  }

  fetchChart(String symbol) async {
    queryResult.value = [];
    loadingStatus.value = ELoadingStatus.loading;
    _filterParams.chart = await _searchRepository.fetchChart(symbol);
    calcCardPercentage();
    loadingStatus.value = _searchRepository.loadingStatus;
  }

  //
  //Logic functions

  calcCardPercentage() {
    var nowPrice = chart.indicators?.quote?[0].open?.last ?? 0.0;
    var lastOpenPrice = chart.indicators?.quote?[0].open?[28] ?? 0.0;
    if (nowPrice == 0.0 && lastOpenPrice == 0.0) {
      cardView = CardViewModel(isPositive: true, diff: 0.0, percentage: 0.0);
    } else if (nowPrice > lastOpenPrice) {
      var diff = nowPrice - lastOpenPrice;
      var percentage = ((nowPrice - lastOpenPrice) / nowPrice) * 100;
      cardView = CardViewModel(isPositive: true, diff: diff, percentage: percentage);
    } else {
      var diff = lastOpenPrice - nowPrice;
      var percentage = ((lastOpenPrice - nowPrice) / lastOpenPrice) * 100;
      cardView = CardViewModel(isPositive: false, diff: diff, percentage: percentage);
    }
  }
}
