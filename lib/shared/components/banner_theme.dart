import 'mock_types.dart';
class MaterialBannerThemeData {
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final Color? dividerColor;
  final dynamic contentTextStyle;
  final double? elevation;
  final dynamic padding;
  final dynamic leadingPadding;
  const MaterialBannerThemeData({this.backgroundColor, this.surfaceTintColor, this.shadowColor, this.dividerColor, this.contentTextStyle, this.elevation, this.padding, this.leadingPadding});
  static MaterialBannerThemeData lerp(MaterialBannerThemeData? a, MaterialBannerThemeData? b, double t) => a ?? const MaterialBannerThemeData();
}
