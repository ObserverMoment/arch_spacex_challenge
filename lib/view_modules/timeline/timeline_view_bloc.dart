import 'dart:async';
import 'package:arch_x_spacex/data/services/spacex_api/launches/launches_model.dart';
import 'package:arch_x_spacex/data/repositories/launches_repo.dart';
import 'package:arch_x_spacex/services_manager.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timeline_view_bloc.g.dart';

@CopyWith()
class TimelineViewBlocState {
  final List<Launch> launches;
  final bool initialized;
  final String? blocError;
  TimelineViewBlocState({
    this.initialized = false,
    this.blocError,
    this.launches = const [],
  });
}

class TimelineViewBloc extends Cubit<TimelineViewBlocState> {
  final _launchesRepo = services<LaunchesRepo>();
  late StreamSubscription<List<Launch>> _launchesListener;

  TimelineViewBloc() : super(TimelineViewBlocState()) {
    _launchesListener =
        _launchesRepo.launches.listen((launches) => emit(state.copyWith(
              launches: launches,
              initialized: true,
            )));
  }

  @override
  Future<void> close() {
    _launchesListener.cancel();
    return super.close();
  }
}
