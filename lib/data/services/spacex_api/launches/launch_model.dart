import 'package:json_annotation/json_annotation.dart';

part 'launch_model.g.dart';

// https://github.com/r-spacex/SpaceX-API/blob/master/docs/launches/v4/schema.md
@JsonSerializable()
class Launch {
  final String id;
  final String name;
  final int flightNumber;
  final String? rocket;
  final DateTime dateUtc;
  final String? details;

  /// Retrieve from "links.patch.small"
  @PatchImageUrlConverter()
  @JsonKey(name: 'links')
  final String? patchImageUrl;

  const Launch({
    required this.id,
    required this.name,
    required this.flightNumber,
    required this.rocket,
    required this.dateUtc,
    required this.details,
    this.patchImageUrl,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

class PatchImageUrlConverter implements JsonConverter<String?, dynamic> {
  const PatchImageUrlConverter();

  @override
  String? fromJson(dynamic o) => o['patch']['small'];

  @override
  dynamic toJson(String? object) => object;
}
