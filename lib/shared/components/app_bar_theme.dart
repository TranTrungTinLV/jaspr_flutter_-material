import 'mock_types.dart';
class AppBarThemeData {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double? scrolledUnderElevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final dynamic shape;
  final dynamic iconTheme;
  final dynamic actionsIconTheme;
  final bool? centerTitle;
  final double? titleSpacing;
  final double? leadingWidth;
  final double? toolbarHeight;
  final dynamic toolbarTextStyle;
  final dynamic titleTextStyle;
  final dynamic systemOverlayStyle;
  final dynamic actionsPadding;
  const AppBarThemeData({this.backgroundColor, this.foregroundColor, this.elevation, this.scrolledUnderElevation, this.shadowColor, this.surfaceTintColor, this.shape, this.iconTheme, this.actionsIconTheme, this.centerTitle, this.titleSpacing, this.leadingWidth, this.toolbarHeight, this.toolbarTextStyle, this.titleTextStyle, this.systemOverlayStyle, this.actionsPadding});
  static AppBarThemeData lerp(AppBarThemeData a, AppBarThemeData b, double t) => a;
}
class AppBarTheme {
  final AppBarThemeData data;
  const AppBarTheme({this.data = const AppBarThemeData()});
}
