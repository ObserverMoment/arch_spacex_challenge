// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacex_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      id: json['id'] as String,
      name: json['name'] as String,
      flightNumber: json['flightNumber'] as String,
      dateUtc: DateTime.parse(json['dateUtc'] as String),
      details: json['details'] as String,
      patchImageUrl: json['patchImageUrl'] as String?,
      liveImageUrl: json['liveImageUrl'] as String?,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'flightNumber': instance.flightNumber,
      'dateUtc': instance.dateUtc.toIso8601String(),
      'details': instance.details,
      'patchImageUrl': instance.patchImageUrl,
      'liveImageUrl': instance.liveImageUrl,
    };
