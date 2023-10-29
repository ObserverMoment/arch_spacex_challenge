import 'dart:async';
import 'dart:convert';

import 'package:arch_x_spacex/data/services/spacex_api/history/history_model.dart';
import 'package:chopper/chopper.dart';

part 'history_service.chopper.dart';

@ChopperApi(baseUrl: "/history")
abstract class HistoryService extends ChopperService {
  static HistoryService create([ChopperClient? client]) =>
      _$HistoryService(client);

  @FactoryConverter(
    response: convertHistoryResponse,
  )
  @Get()
  Future<Response<List<History>>> getHistory();
}

Response<List<History>> convertHistoryResponse<T>(Response res) {
  final decodedBody = jsonDecode(res.body);
  return res.copyWith<List<History>>(
      body: (decodedBody as List).map((d) => History.fromJson(d)).toList());
}
