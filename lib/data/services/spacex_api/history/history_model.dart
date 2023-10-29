import 'package:json_annotation/json_annotation.dart';

part 'history_model.g.dart';

// https://github.com/r-spacex/SpaceX-API/blob/master/docs/history/v4/schema.md
@JsonSerializable()
class History {
  final String? title;
  final DateTime? eventDateUtc;
  final String? details;

  const History({
    this.title,
    this.eventDateUtc,
    this.details,
  });

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
