import 'package:arch_x_spacex/data/repositories/rockets_repo.dart';
import 'package:arch_x_spacex/data/services/services_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RocketDetailsViewBloc extends Cubit<RocketRetrievedData?> {
  final _rocketsRepo = services<RocketsRepo>();

  final String rocketId;
  RocketDetailsViewBloc(this.rocketId) : super(null) {
    retrieveRocketDetails();
  }

  void retrieveRocketDetails() async {
    final data = await _rocketsRepo.getRocketDetails(rocketId);
    emit(data);
  }
}
