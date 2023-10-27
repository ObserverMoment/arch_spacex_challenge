import 'package:json_annotation/json_annotation.dart';

part 'spacex_api_model.g.dart';

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
  final String flightNumber;
  final DateTime dateUtc;
  final String details;

  final String? patchImageUrl;
  final String? liveImageUrl;

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
