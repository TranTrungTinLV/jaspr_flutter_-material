import 'mock_types.dart';

class ButtonStyle {
  const ButtonStyle();
  static ButtonStyle lerp(ButtonStyle? a, ButtonStyle? b, double t) => a ?? const ButtonStyle();
}
