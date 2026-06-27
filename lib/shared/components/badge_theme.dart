import 'mock_types.dart';
class BadgeThemeData {
  final Color? backgroundColor;
  final Color? textColor;
  final double? smallSize;
  final double? largeSize;
  final dynamic textStyle;
  final dynamic padding;
  final dynamic alignment;
  final dynamic offset;
  const BadgeThemeData({this.backgroundColor, this.textColor, this.smallSize, this.largeSize, this.textStyle, this.padding, this.alignment, this.offset});
  static BadgeThemeData lerp(BadgeThemeData? a, BadgeThemeData? b, double t) => a ?? const BadgeThemeData();
}
