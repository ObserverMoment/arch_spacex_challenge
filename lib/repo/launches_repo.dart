import 'package:arch_x_spacex/data/spacex_api/launches/launches_model.dart';
import 'package:arch_x_spacex/data/spacex_api/launches/launches_service.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:chopper/chopper.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/subjects.dart';

class LaunchesRepo {
  late LaunchesListService _launchesListService;
  LaunchesRepo(ChopperClient chopper) {
    _launchesListService = chopper.getService<LaunchesListService>();
    _initData();
  }

  final _launchesBehaviourSubject = BehaviorSubject<List<Launch>>.seeded([]);
  Stream<List<Launch>> get launches => _launchesBehaviourSubject.stream;

  _initData() async {
    try {
      final res = await _launchesListService.getLaunches();

      print('res');
      print(res);

      if (res.isSuccessful && res.body != null) {
        _launchesBehaviourSubject.add(res.body ?? []);
      } else {
        printErrorLog('Errror retrieving Launches: ${res.error}');
      }
    } on DioException catch (e) {
      printErrorLog(
        'Errror retrieving Launches: ${e.message}',
        time: DateTime.now(),
        error: e.error,
        stackTrace: e.stackTrace,
      );
    } catch (e) {
      printErrorLog(
        'Errror retrieving Launches: $e',
      );
    }
  }
}
