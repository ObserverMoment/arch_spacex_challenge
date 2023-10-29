import 'package:arch_x_spacex/constants.dart';
import 'package:arch_x_spacex/data/services/spacex_api/history/history_service.dart';
import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_service.dart';
import 'package:arch_x_spacex/data/services/spacex_api/rockets/rockets_service.dart';
import 'package:chopper/chopper.dart';
import 'package:http/testing.dart';

class ChopperFactory {
  ChopperClient create() => ChopperClient(
      baseUrl: Uri.https(kSpacexApiBaseUrl, '/v4'),
      services: [
        HistoryService.create(),
        LaunchesService.create(),
        RocketsService.create(),
      ],
      interceptors: [
        const HeadersInterceptor({'Content-type': 'Application/json'}),
        HttpLoggingInterceptor()
      ],
      converter: const JsonConverter());

  ChopperClient createMock(MockClient mockClient) => ChopperClient(
      client: mockClient,
      baseUrl: Uri.https(kSpacexApiBaseUrl, '/v4'),
      services: [
        HistoryService.create(),
        LaunchesService.create(),
        RocketsService.create(),
      ],
      interceptors: [
        const HeadersInterceptor({'Content-type': 'Application/json'}),
        HttpLoggingInterceptor()
      ],
      converter: const JsonConverter());
}
