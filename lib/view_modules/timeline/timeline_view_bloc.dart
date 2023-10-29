import 'dart:async';
import 'package:arch_x_spacex/data/repositories/launches_repo.dart';
import 'package:arch_x_spacex/data/services/services_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineViewBloc extends Cubit<LaunchesRetrievedData?> {
  final _launchesRepo = services<LaunchesRepo>();
  late StreamSubscription<LaunchesRetrievedData?> _launchesListener;

  TimelineViewBloc() : super(const LaunchesRetrievedData()) {
    _launchesListener = _launchesRepo.launches.listen((data) => emit(data));
  }

  void retryRequestData() => _launchesRepo.retrieveLaunchesData();

  @override
  Future<void> close() {
    _launchesListener.cancel();
    return super.close();
  }
}
