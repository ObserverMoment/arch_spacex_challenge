import 'package:json_annotation/json_annotation.dart';

part 'launches_model.g.dart';

@JsonSerializable()
class Launch {
  const Launch(
      {required this.id,
      required this.name,
      required this.flightNumber,
      required this.dateUtc,
      required this.details,
      this.patchImageUrl,
      this.liveImageUrl});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  final String id;
  final String name;
  final int flightNumber;
  final DateTime dateUtc;
  final String details;

  /// Retrieve from "links.patch.small"
  @PatchImageUrlConverter()
  final String? patchImageUrl;

  /// Retrieve from "links.flickr.original[0]"
  @LiveImageUrlConverter()
  final String? liveImageUrl;

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

class PatchImageUrlConverter implements JsonConverter<String?, dynamic> {
  const PatchImageUrlConverter();

  @override
  String? fromJson(dynamic o) => o['links']['patch']['small'];

  @override
  dynamic toJson(String? object) => object;
}

class LiveImageUrlConverter implements JsonConverter<String?, dynamic> {
  const LiveImageUrlConverter();

  @override
  String? fromJson(dynamic o) => o['links']['flickr']['original'][0];

  @override
  dynamic toJson(String? object) => object;
}
