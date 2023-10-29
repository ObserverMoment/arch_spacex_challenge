import 'package:arch_x_spacex/data/services/spacex_api/launches/launch_model.dart';
import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_service.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:chopper/chopper.dart';
import 'package:rxdart/subjects.dart';

class LaunchesRetrievedData {
  final List<Launch> launches;
  final List<String> errors;
  const LaunchesRetrievedData(
      {this.launches = const [], this.errors = const []});
}

class LaunchesRepo {
  late LaunchesService _launchesService;
  LaunchesRepo(ChopperClient chopper) {
    _launchesService = chopper.getService<LaunchesService>();
    retrieveLaunchesData();
  }

  final _launchesBehaviourSubject =
      BehaviorSubject<LaunchesRetrievedData?>.seeded(null);
  Stream<LaunchesRetrievedData?> get launches =>
      _launchesBehaviourSubject.stream;

  Future<void> retrieveLaunchesData() async {
    try {
      final res = await _launchesService.getLaunches();
      if (res.isSuccessful && res.body != null) {
        _launchesBehaviourSubject
            .add(LaunchesRetrievedData(launches: res.body ?? []));
      } else {
        final err = 'Errror retrieving Launches: ${res.error}';
        printErrorLog(err);
        _launchesBehaviourSubject.add(LaunchesRetrievedData(errors: [err]));
      }
    } catch (e) {
      final err = 'Errror retrieving Launches: $e';
      printErrorLog(err);
      _launchesBehaviourSubject.add(LaunchesRetrievedData(errors: [err]));
    }
  }

  void dispose() {
    _launchesBehaviourSubject.close();
  }
}
