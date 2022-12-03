import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/core/enums/loadingstatus.enum.dart';
import 'package:guide_selective_process/src/core/models/charts.model.dart';
import 'package:guide_selective_process/src/core/models/search.model.dart';
import 'package:guide_selective_process/src/core/stores/filterparams.store.dart';
import 'package:guide_selective_process/src/modules/home/models/card.model.dart';
import 'package:guide_selective_process/src/modules/home/stores/home.store.dart';
import 'package:logger/logger.dart';

class HomeController {
  HomeController(this._store);

  RxBool showAvg = false.obs;

  //
  //Classes
  final HomeStore _store;
  final FilterParamsStore _filterParams = Get.find();

  //
  //Get's and Set's
  bool get isLoading => _store.loadingStatus.value == ELoadingStatus.loading;
  List<SearchModel> get queryResult => _store.queryResult;
  CardViewModel get cardView => _store.cardView!;
  ChartsModel get chart => _filterParams.chart;
  set chart(ChartsModel val) => _filterParams.chart = val;

  //
  //View Variables
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> chartScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> priceVariationScaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();

  //
  //Functions
  loadSymbol() {
    _store.searchSymbol(searchController.text);
  }

  loadChart(String symbol) {
    searchController.text = '';
    _store.fetchChart(symbol);
  }
}
