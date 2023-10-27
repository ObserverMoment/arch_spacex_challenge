import 'package:arch_x_spacex/data/dio_client.dart';
import 'package:arch_x_spacex/data/spacex/spacex_api_client.dart';
import 'package:arch_x_spacex/repo/launches_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class ServicesManager {
  final GetIt services;
  const ServicesManager(this.services);

  /// Pre Auth
  void registerGlobalServices() {
    final logger = Logger();

    FlutterError.onError = (details) {
      logger.log(Level.all, details.exceptionAsString(),
          stackTrace: details.stack, error: details.exception);
    };

    final dio = DioClient(logger);
    final spacexApiClient = SpacexApiClient(dio.client);

    /// Register global services needed pre-auth ///
    /// Global services with no dependencies ///
    services.registerLazySingleton<LaunchesRepo>(
        () => LaunchesRepo(spacexApiClient));
  }

  void unregisterGlobalServices() {
    services.unregister<LaunchesRepo>();
  }
}
