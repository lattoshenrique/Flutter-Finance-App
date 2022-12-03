import 'package:guide_selective_process/src/core/models/api_response.model.dart';

abstract class IApi {
  Future<ApiResponseModel> call(
    EApiType type,
    String url, {
    Map<String, dynamic> data,
    Map<String, dynamic> options,
  });
}

enum EApiType {
  get,
  post,
  put,
  patch,
  delete,
}
