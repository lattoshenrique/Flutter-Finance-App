// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:guide_selective_process/src/core/interfaces/api.interface.dart';
import 'package:guide_selective_process/src/core/models/api_response.model.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

class ApiService implements IApi {
  ApiService({this.apiRoute}) {
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status! < 5000;
    dio.options.sendTimeout = 60 * 1000;
    dio.options.receiveTimeout = 60 * 1000;
  }

  final String? apiRoute;
  final Dio dio = Dio();

  @override
  Future<ApiResponseModel> call(EApiType type, String url, {Map<String, dynamic>? data, Map<String, dynamic>? options}) async {
    final _options = Options(headers: options);

    final _data = Map<String, dynamic>.from(data ?? {});

    dynamic response;
    switch (type) {
      case EApiType.get:
        response = await dio.get(url, queryParameters: _data, options: _options);
        break;
      case EApiType.post:
        response = await dio.post(url, data: jsonEncode(_data), options: _options);
        break;
      case EApiType.put:
        response = await dio.put(url, data: jsonEncode(_data), options: _options);
        break;
      case EApiType.patch:
        response = await dio.patch(url, data: jsonEncode(_data), options: _options);
        break;
      case EApiType.delete:
        response = await dio.delete(url, data: jsonEncode(_data), options: _options);
        break;
    }

    logger.w("======start api call======");
    logger.i("url: ${dio.options.baseUrl}$url");
    logger.i("data: ${_data.toString()}");
    logger.i("statusCode: ${response.statusCode}");
    logger.i("data: ${response.data}");
    logger.w("=======end api call=======");

    return ApiResponseModel(response.data, response.statusCode);
  }
}
