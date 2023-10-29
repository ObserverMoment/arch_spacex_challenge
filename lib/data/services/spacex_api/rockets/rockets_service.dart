import 'dart:async';
import 'dart:convert';

import 'package:arch_x_spacex/data/services/spacex_api/rockets/rocket_model.dart';
import 'package:chopper/chopper.dart';

part 'rockets_service.chopper.dart';

@ChopperApi(baseUrl: "/rockets")
abstract class RocketsService extends ChopperService {
  static RocketsService create([ChopperClient? client]) =>
      _$RocketsService(client);

  @FactoryConverter(response: convertRocketResponse)
  @Get(path: '/{id}')
  Future<Response<Rocket>> getRocket(@Path() String id);
}

Response<Rocket> convertRocketResponse<T>(Response res) {
  final decodedBody = jsonDecode(res.body);
  return res.copyWith<Rocket>(body: Rocket.fromJson(decodedBody));
}
