// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      id: json['id'] as String,
      name: json['name'] as String,
      flightNumber: json['flight_number'] as int,
      dateUtc: DateTime.parse(json['date_utc'] as String),
      details: json['details'] as String,
      patchImageUrl:
          const PatchImageUrlConverter().fromJson(json['patch_image_url']),
      liveImageUrl:
          const LiveImageUrlConverter().fromJson(json['live_image_url']),
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flight_number': instance.flightNumber,
      'date_utc': instance.dateUtc.toIso8601String(),
      'details': instance.details,
      'patch_image_url':
          const PatchImageUrlConverter().toJson(instance.patchImageUrl),
      'live_image_url':
          const LiveImageUrlConverter().toJson(instance.liveImageUrl),
    };
