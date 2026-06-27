import 'mock_types.dart';
class ActionIconThemeData {
  final dynamic backButtonIconBuilder;
  final dynamic closeButtonIconBuilder;
  final dynamic drawerButtonIconBuilder;
  final dynamic endDrawerButtonIconBuilder;
  const ActionIconThemeData({this.backButtonIconBuilder, this.closeButtonIconBuilder, this.drawerButtonIconBuilder, this.endDrawerButtonIconBuilder});
  ActionIconThemeData copyWith({dynamic backButtonIconBuilder, dynamic closeButtonIconBuilder, dynamic drawerButtonIconBuilder, dynamic endDrawerButtonIconBuilder}) {
    return ActionIconThemeData(
      backButtonIconBuilder: backButtonIconBuilder ?? this.backButtonIconBuilder,
      closeButtonIconBuilder: closeButtonIconBuilder ?? this.closeButtonIconBuilder,
      drawerButtonIconBuilder: drawerButtonIconBuilder ?? this.drawerButtonIconBuilder,
      endDrawerButtonIconBuilder: endDrawerButtonIconBuilder ?? this.endDrawerButtonIconBuilder,
    );
  }
  static ActionIconThemeData? lerp(ActionIconThemeData? a, ActionIconThemeData? b, double t) => t < 0.5 ? a : b;
}
class ActionIconTheme {
  static ActionIconThemeData? of(dynamic context) => const ActionIconThemeData();
}
