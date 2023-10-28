import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_model.dart';
import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_service.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:chopper/chopper.dart';
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
      if (res.isSuccessful && res.body != null) {
        _launchesBehaviourSubject.add(res.body ?? []);
      } else {
        printErrorLog('Errror retrieving Launches: ${res.error}');
      }
    } catch (e) {
      printErrorLog(
        'Errror retrieving Launches: $e',
      );
    }
  }
}
