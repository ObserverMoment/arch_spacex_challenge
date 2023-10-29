// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      title: json['title'] as String?,
      eventDateUtc: json['event_date_utc'] == null
          ? null
          : DateTime.parse(json['event_date_utc'] as String),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'title': instance.title,
      'event_date_utc': instance.eventDateUtc?.toIso8601String(),
      'details': instance.details,
    };
