import 'package:guide_selective_process/src/core/enums/loadingstatus.enum.dart';
import 'package:guide_selective_process/src/core/interfaces/api.interface.dart';
import 'package:guide_selective_process/src/core/models/api_response.model.dart';
import 'package:guide_selective_process/src/core/models/charts.model.dart';
import 'package:guide_selective_process/src/core/models/search.model.dart';
import 'package:guide_selective_process/src/core/routes/api.routes.dart';

class SearchRepository {
  final IApi _api;

  SearchRepository(this._api);

  ELoadingStatus _loadingStatus = ELoadingStatus.loading;

  Future<List<SearchModel>> fetchSymbol(String term) async {
    _loadingStatus = ELoadingStatus.loading;
    ApiResponseModel response =
        await _api.call(EApiType.get, '${ApiRoutes.SEARCH}$term');

    if (response.statusCode == 200) {
      _loadingStatus = ELoadingStatus.completed;
      return List<SearchModel>.from(
          response.data["items"].map((x) => SearchModel.fromJson(x)));
    } else {
      _loadingStatus = ELoadingStatus.error;
      throw Exception('Falha ao carregar dados');
    }
  }

  Future<ChartsModel> fetchChart(String symbol) async {
    _loadingStatus = ELoadingStatus.loading;
    ApiResponseModel response = await _api.call(
        EApiType.get, '${ApiRoutes.GET_CHARTS}$symbol?interval=1d&range=30d');

    if (response.statusCode == 200) {
      _loadingStatus = ELoadingStatus.completed;
      return ChartsModel.fromJson(response.data["chart"]["result"][0]);
    } else {
      _loadingStatus = ELoadingStatus.error;
      throw Exception('Falha ao carregar dados');
    }
  }

  ELoadingStatus get loadingStatus => _loadingStatus;
}
