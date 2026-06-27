import 'mock_types.dart';
class BottomNavigationBarThemeData {
  final Color? backgroundColor;
  final double? elevation;
  final dynamic selectedIconTheme;
  final dynamic unselectedIconTheme;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final dynamic selectedLabelStyle;
  final dynamic unselectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final dynamic type;
  final dynamic enableFeedback;
  final dynamic landscapeLayout;
  const BottomNavigationBarThemeData({this.backgroundColor, this.elevation, this.selectedIconTheme, this.unselectedIconTheme, this.selectedItemColor, this.unselectedItemColor, this.selectedLabelStyle, this.unselectedLabelStyle, this.showSelectedLabels, this.showUnselectedLabels, this.type, this.enableFeedback, this.landscapeLayout});
  static BottomNavigationBarThemeData lerp(BottomNavigationBarThemeData? a, BottomNavigationBarThemeData? b, double t) => a ?? const BottomNavigationBarThemeData();
}
