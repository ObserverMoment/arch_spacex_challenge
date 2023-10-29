// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rocket _$RocketFromJson(Map<String, dynamic> json) => Rocket(
      id: json['id'] as String,
      name: json['name'] as String,
      flickrImages: (json['flickr_images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      active: json['active'] as bool,
      stages: json['stages'] as int,
      boosters: json['boosters'] as int,
      costPerLaunch: json['cost_per_launch'] as int,
      firstFlight: DateTime.parse(json['first_flight'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'stages': instance.stages,
      'boosters': instance.boosters,
      'cost_per_launch': instance.costPerLaunch,
      'first_flight': instance.firstFlight.toIso8601String(),
      'description': instance.description,
      'flickr_images': instance.flickrImages,
    };
