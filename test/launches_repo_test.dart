import 'dart:convert';

import 'package:arch_x_spacex/data/repositories/launches_repo.dart';
import 'package:arch_x_spacex/data/services/spacex_api/chopper_factory.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/testing.dart' as http_test;
import 'package:logger/logger.dart' as l;
import 'package:http/http.dart' as http;

import 'sample_data.dart';

void main() {
  late l.Logger logger;
  late http_test.MockClient mockClient;
  late ChopperClient mockChopper;
  late LaunchesRepo launchesRepo;

  setUp(() {
    logger = l.Logger();
    GetIt.instance.registerSingleton<l.Logger>(logger);

    mockClient = http_test.MockClient((request) async {
      return http.Response(json.encode(kSampleLaunchData), 200,
          headers: {'content-type': 'application/json'});
    });
    mockChopper = ChopperFactory().createMock(mockClient);
    launchesRepo = LaunchesRepo(mockChopper);
  });

  tearDown(() {
    launchesRepo.dispose();
    mockChopper.dispose();
    GetIt.instance.unregister<l.Logger>(disposingFunction: (l) => l.close());
  });

  group('LaunchesRepo Basic Data Retrieval', () {
    test(
        'LaunchesRepo.retrieveLaunchesData handles spaceX api /launches endpoint shaped data, converts it and then broadcasts the correct data class.',
        () async {
      await launchesRepo.retrieveLaunchesData();

      launchesRepo.launches.last.then((data) {
        expect(data, isA<LaunchesRetrievedData>());
        expect((data as LaunchesRetrievedData).launches.length, 1);
      });
    });
  });
}
