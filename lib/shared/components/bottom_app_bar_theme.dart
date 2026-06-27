import 'mock_types.dart';
class BottomAppBarThemeData {
  final Color? color;
  final double? elevation;
  final dynamic shape;
  final double? height;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final dynamic padding;
  const BottomAppBarThemeData({this.color, this.elevation, this.shape, this.height, this.surfaceTintColor, this.shadowColor, this.padding});
  static BottomAppBarThemeData lerp(BottomAppBarThemeData? a, BottomAppBarThemeData? b, double t) => a ?? const BottomAppBarThemeData();
}
