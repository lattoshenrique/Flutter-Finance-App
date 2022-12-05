import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_selective_process/src/core/enums/loadingstatus.enum.dart';
import 'package:guide_selective_process/src/core/models/charts.model.dart';
import 'package:guide_selective_process/src/core/models/search.model.dart';
import 'package:guide_selective_process/src/core/stores/filterparams.store.dart';
import 'package:guide_selective_process/src/modules/home/models/card.model.dart';
import 'package:guide_selective_process/src/modules/home/stores/home.store.dart';

class HomeController {
  HomeController(this._store);

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

  RxBool get isSearch => _store.isSearch;
  set isSearch(RxBool val) => _store.isSearch = val;

  String get term => _filterParams.term;
  set term(String val) => _filterParams.term = val;

  //
  //View Variables
  GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> chartScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> priceVariationScaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  Timer? searchOnStoppedTyping;

  //
  //Functions
  loadSymbol() {
    if (term.isNotEmpty) _store.searchSymbol(term);
  }

  loadChart(String symbol) {
    _store.fetchChart(symbol);
  }

  onChangeHandler(String query) {
    const duration = Duration(milliseconds: 400);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }
    searchOnStoppedTyping = Timer(duration, () {
      term = query;
      loadSymbol();
    });
  }
}
