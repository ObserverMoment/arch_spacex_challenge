import 'package:arch_x_spacex/data/services/spacex_api/rockets/rocket_model.dart';
import 'package:arch_x_spacex/data/services/spacex_api/rockets/rockets_service.dart';
import 'package:arch_x_spacex/global_utils.dart';
import 'package:chopper/chopper.dart';

class RocketRetrievedData {
  final Rocket? rocket;
  final List<String> errors;
  const RocketRetrievedData({this.rocket, this.errors = const []});
}

class RocketsRepo {
  late RocketsService _rocketsService;
  RocketsRepo(ChopperClient chopper) {
    _rocketsService = chopper.getService<RocketsService>();
  }

  Future<RocketRetrievedData> retrieveRocketDetails(String rocketId) async {
    try {
      final res = await _rocketsService.getRocket(rocketId);
      if (res.isSuccessful && res.body != null) {
        return RocketRetrievedData(rocket: res.body);
      } else {
        final err = 'Errror retrieving rocket info: ${res.error}';
        printErrorLog(err);
        return RocketRetrievedData(errors: [err]);
      }
    } catch (e) {
      final err = 'Errror retrieving rocket info: $e';
      printErrorLog(err);
      return RocketRetrievedData(errors: [err]);
    }
  }
}
