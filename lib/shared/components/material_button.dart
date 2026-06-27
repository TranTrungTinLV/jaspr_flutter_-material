import 'theme_data.dart';
import 'mock_types.dart';
import 'text_theme.dart';
import 'button_theme.dart';

class MaterialButton {
  final Brightness? colorBrightness;
  final Color? disabledTextColor;
  final bool enabled;
  final ButtonTextTheme? textTheme;
  final Color? disabledColor;
  final Color? textColor;
  final Color? color;
  final Color? splashColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final Duration? animationDuration;
  final MaterialTapTargetSize? materialTapTargetSize;
  final double? minWidth;
  final double? height;
  final Clip clipBehavior;
  
  const MaterialButton({
    this.colorBrightness,
    this.disabledTextColor,
    this.enabled = true,
    this.textTheme,
    this.disabledColor,
    this.textColor,
    this.color,
    this.splashColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.shape,
    this.animationDuration,
    this.materialTapTargetSize,
    this.minWidth,
    this.height,
    this.clipBehavior = Clip.none,
  });
}
