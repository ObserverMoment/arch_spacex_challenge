import 'package:arch_x_spacex/data/spacex/spacex_api_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'spacex_api_client.g.dart';

@RestApi(baseUrl: 'https://api.spacexdata.com/v4/')
abstract class SpacexApiClient {
  factory SpacexApiClient(Dio dio, {String baseUrl}) = _SpacexApiClient;

  @GET('/launches')
  Future<List<Launch>> getLaunches();
}
