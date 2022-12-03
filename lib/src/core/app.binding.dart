import 'package:guide_selective_process/src/core/repositories/search.repository.dart';
import 'package:guide_selective_process/src/core/services/api.service.dart';
import 'package:guide_selective_process/src/core/stores/filterparams.store.dart';
import 'package:guide_selective_process/src/modules/home/controllers/home.controller.dart';
import 'package:guide_selective_process/src/modules/home/stores/home.store.dart';

import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(FilterParamsStore());

    Get.lazyPut(() {
      Get.put(SearchRepository(Get.find<ApiService>()));
      Get.put(HomeStore());
      return HomeController(Get.find());
    }, fenix: true);
  }
}
