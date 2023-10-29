// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rockets_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$RocketsService extends RocketsService {
  _$RocketsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RocketsService;

  @override
  Future<Response<Rocket>> getRocket(String id) {
    final Uri $url = Uri.parse('/rockets/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Rocket, Rocket>(
      $request,
      responseConverter: convertRocketResponse,
    );
  }
}
