import 'package:json_annotation/json_annotation.dart';

part 'launches_model.g.dart';

@JsonSerializable()
class Launch {
  final String id;
  final String name;
  final int flightNumber;
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
