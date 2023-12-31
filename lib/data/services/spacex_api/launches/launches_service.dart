import 'dart:async';
import 'dart:convert';

import 'package:arch_x_spacex/data/services/spacex_api/launches/launch_model.dart';
import 'package:chopper/chopper.dart';

part 'launches_service.chopper.dart';

@ChopperApi(baseUrl: "/launches")
abstract class LaunchesService extends ChopperService {
  static LaunchesService create([ChopperClient? client]) =>
      _$LaunchesService(client);

  @FactoryConverter(
    response: convertLaunchesResponse,
  )
  @Get()
  Future<Response<List<Launch>>> getLaunches();
}

Response<List<Launch>> convertLaunchesResponse<T>(Response res) {
  final decodedBody = jsonDecode(res.body);
  return res.copyWith<List<Launch>>(
      body: (decodedBody as List).map((d) => Launch.fromJson(d)).toList());
}
