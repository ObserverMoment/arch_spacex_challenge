import 'package:arch_x_spacex/constants.dart';
import 'package:arch_x_spacex/data/spacex_api/spacex_api_launches.dart';
import 'package:arch_x_spacex/repo/launches_repo.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart' as l;

final services = GetIt.instance;

class ServicesManager {
  const ServicesManager();

  void registerGlobalServices() {
    final logger = l.Logger();
    services.registerSingleton<l.Logger>(logger);

    FlutterError.onError = (details) {
      logger.log(l.Level.all, details.exceptionAsString(),
          stackTrace: details.stack, error: details.exception);
    };

    final chopper = ChopperClient(
        baseUrl: Uri.https(kSpacexApiBaseUrl, '/v4'),
        services: [
          // Create and pass an instance of the generated service to the client
          LaunchesListService.create()
        ],
        interceptors: [
          const HeadersInterceptor({'Content-type': 'Application/json'}),
          HttpLoggingInterceptor()
        ],
        converter: const JsonConverter());

    services.registerSingleton<ChopperClient>(chopper);

    services.registerLazySingleton<LaunchesRepo>(() => LaunchesRepo(chopper));
  }

  void unregisterGlobalServices() {
    services.unregister<LaunchesRepo>();
    services.unregister<ChopperClient>();
    services.unregister<l.Logger>();
  }
}
