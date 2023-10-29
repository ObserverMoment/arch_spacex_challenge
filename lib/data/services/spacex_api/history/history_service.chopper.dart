// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$HistoryService extends HistoryService {
  _$HistoryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HistoryService;

  @override
  Future<Response<List<History>>> getHistory() {
    final Uri $url = Uri.parse('/history');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<History>, History>(
      $request,
      responseConverter: convertHistoryResponse,
    );
  }
}
