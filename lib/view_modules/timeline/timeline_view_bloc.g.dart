// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_view_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TimelineViewBlocStateCWProxy {
  TimelineViewBlocState initialized(bool initialized);

  TimelineViewBlocState blocError(String? blocError);

  TimelineViewBlocState launches(List<Launch> launches);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimelineViewBlocState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimelineViewBlocState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimelineViewBlocState call({
    bool? initialized,
    String? blocError,
    List<Launch>? launches,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimelineViewBlocState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimelineViewBlocState.copyWith.fieldName(...)`
class _$TimelineViewBlocStateCWProxyImpl
    implements _$TimelineViewBlocStateCWProxy {
  const _$TimelineViewBlocStateCWProxyImpl(this._value);

  final TimelineViewBlocState _value;

  @override
  TimelineViewBlocState initialized(bool initialized) =>
      this(initialized: initialized);

  @override
  TimelineViewBlocState blocError(String? blocError) =>
      this(blocError: blocError);

  @override
  TimelineViewBlocState launches(List<Launch> launches) =>
      this(launches: launches);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimelineViewBlocState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimelineViewBlocState(...).copyWith(id: 12, name: "My name")
  /// ````
  TimelineViewBlocState call({
    Object? initialized = const $CopyWithPlaceholder(),
    Object? blocError = const $CopyWithPlaceholder(),
    Object? launches = const $CopyWithPlaceholder(),
  }) {
    return TimelineViewBlocState(
      initialized:
          initialized == const $CopyWithPlaceholder() || initialized == null
              ? _value.initialized
              // ignore: cast_nullable_to_non_nullable
              : initialized as bool,
      blocError: blocError == const $CopyWithPlaceholder()
          ? _value.blocError
          // ignore: cast_nullable_to_non_nullable
          : blocError as String?,
      launches: launches == const $CopyWithPlaceholder() || launches == null
          ? _value.launches
          // ignore: cast_nullable_to_non_nullable
          : launches as List<Launch>,
    );
  }
}

extension $TimelineViewBlocStateCopyWith on TimelineViewBlocState {
  /// Returns a callable class that can be used as follows: `instanceOfTimelineViewBlocState.copyWith(...)` or like so:`instanceOfTimelineViewBlocState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimelineViewBlocStateCWProxy get copyWith =>
      _$TimelineViewBlocStateCWProxyImpl(this);
}
