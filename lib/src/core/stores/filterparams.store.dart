import 'package:get/state_manager.dart';
import 'package:guide_selective_process/src/core/models/charts.model.dart';

class FilterParamsStore extends GetxController {
  final _chart = Rxn<ChartsModel>();
  final _term = RxnString();

  ChartsModel get chart => _chart.value ?? ChartsModel();
  set chart(ChartsModel value) => _chart.value = value;

  String get term => _term.value!;
  set term(String val) => _term.value = val;
}
