import 'package:arch_x_spacex/data/repositories/launches_repo.dart';
import 'package:arch_x_spacex/data/repositories/rockets_repo.dart';
import 'package:arch_x_spacex/data/services/spacex_api/chopper_factory.dart';
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
      logger.log(l.Level.error, details.exceptionAsString(),
          stackTrace: details.stack, error: details.exception);
    };

    final chopper = ChopperFactory().create();

    services.registerSingleton<ChopperClient>(chopper);

    services.registerLazySingleton<LaunchesRepo>(() => LaunchesRepo(chopper));
    services.registerLazySingleton<RocketsRepo>(() => RocketsRepo(chopper));
  }

  void unregisterGlobalServices() {
    services.unregister<RocketsRepo>();
    services.unregister<LaunchesRepo>();
    services.unregister<ChopperClient>();
    services.unregister<l.Logger>();
  }
}
