import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

// https://github.com/r-spacex/SpaceX-API/blob/master/docs/rockets/v4/schema.md
@JsonSerializable()
class Rocket {
  final String id;
  final String name;
  final bool active;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final DateTime firstFlight;
  final String description;
  final List<String> flickrImages;

  const Rocket({
    required this.id,
    required this.name,
    required this.flickrImages,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.firstFlight,
    required this.description,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
