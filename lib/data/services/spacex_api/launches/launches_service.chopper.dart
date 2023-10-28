// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$LaunchesListService extends LaunchesListService {
  _$LaunchesListService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LaunchesListService;

  @override
  Future<Response<List<Launch>>> getLaunches() {
    final Uri $url = Uri.parse('/launches');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Launch>, Launch>(
      $request,
      responseConverter: convertLaunchesResponse,
    );
  }
}
