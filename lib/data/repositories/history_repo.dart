import 'package:arch_x_spacex/data/services/spacex_api/history/history_model.dart';
import 'package:arch_x_spacex/data/services/spacex_api/history/history_service.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:chopper/chopper.dart';
import 'package:rxdart/subjects.dart';

class HistoryRetrievedData {
  final List<History> history;
  final List<String> errors;
  const HistoryRetrievedData({this.history = const [], this.errors = const []});
}

class HistoryRepo {
  late HistoryService _historyService;
  HistoryRepo(ChopperClient chopper) {
    _historyService = chopper.getService<HistoryService>();
    retrieveHistoryData();
  }

  final _historyBehaviourSubject =
      BehaviorSubject<HistoryRetrievedData?>.seeded(null);
  Stream<HistoryRetrievedData?> get history => _historyBehaviourSubject.stream;

  Future<void> retrieveHistoryData() async {
    try {
      final res = await _historyService.getHistory();
      if (res.isSuccessful && res.body != null) {
        _historyBehaviourSubject
            .add(HistoryRetrievedData(history: res.body ?? []));
      } else {
        final err = 'Errror retrieving History: ${res.error}';
        printErrorLog(err);
        _historyBehaviourSubject.add(HistoryRetrievedData(errors: [err]));
      }
    } catch (e) {
      final err = 'Errror retrieving History: $e';
      printErrorLog(err);
      _historyBehaviourSubject.add(HistoryRetrievedData(errors: [err]));
    }
  }

  void dispose() {
    _historyBehaviourSubject.close();
  }
}
