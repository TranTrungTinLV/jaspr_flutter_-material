import 'mock_types.dart';
class BottomSheetThemeData {
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final Color? modalBackgroundColor;
  final Color? modalBarrierColor;
  final double? modalElevation;
  final dynamic shape;
  final bool? clipBehavior;
  final dynamic constraints;
  const BottomSheetThemeData({this.backgroundColor, this.surfaceTintColor, this.elevation, this.modalBackgroundColor, this.modalBarrierColor, this.modalElevation, this.shape, this.clipBehavior, this.constraints});
  static BottomSheetThemeData lerp(BottomSheetThemeData? a, BottomSheetThemeData? b, double t) => a ?? const BottomSheetThemeData();
}
