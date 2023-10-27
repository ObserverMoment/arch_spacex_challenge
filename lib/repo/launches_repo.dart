import 'package:arch_x_spacex/data/spacex/spacex_api_client.dart';
import 'package:arch_x_spacex/data/spacex/spacex_api_model.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/subjects.dart';

class LaunchesRepo {
  final SpacexApiClient spacexApiClient;
  LaunchesRepo(this.spacexApiClient) {
    _initData();
  }

  /// Internal data.
  List<Launch> _launches = [];

  final _launchesBehaviourSubject = BehaviorSubject<List<Launch>>.seeded([]);

  Stream<List<Launch>> get launches => _launchesBehaviourSubject.stream;

  _initData() async {
    try {
      _launches = await spacexApiClient.getLaunches();
      _launchesBehaviourSubject.add(_launches);
    } on DioException catch (e) {
      /// TODO.
    } catch (e) {
      /// TODO.
    }
  }
}
