extension StringExtension on String? {
  bool get notNullNotEmpty => this != null && this!.isNotEmpty;
}
