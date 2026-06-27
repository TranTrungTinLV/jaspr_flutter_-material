import 'mock_types.dart';

class TextStyle {
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? height;
  final Locale? locale;
  final Paint? foreground;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final Paint? background;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final bool inherit;
  final String? debugLabel;
  final TextLeadingDistribution? leadingDistribution;

  const TextStyle({
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.locale,
    this.foreground,
    this.fontFamily,
    this.fontFamilyFallback,
    this.background,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.inherit = true,
    this.debugLabel,
    this.leadingDistribution,
  });

  TextStyle copyWith({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    Paint? background,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    bool? inherit,
    String? debugLabel,
    TextLeadingDistribution? leadingDistribution,
  }) {
    return TextStyle(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      background: background ?? this.background,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      inherit: inherit ?? this.inherit,
      debugLabel: debugLabel ?? this.debugLabel,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
    );
  }

  TextStyle merge(TextStyle? other) {
    if (other == null) return this;
    return copyWith(
      color: other.color,
      backgroundColor: other.backgroundColor,
      fontSize: other.fontSize,
      fontWeight: other.fontWeight,
      fontStyle: other.fontStyle,
      letterSpacing: other.letterSpacing,
      wordSpacing: other.wordSpacing,
      textBaseline: other.textBaseline,
      height: other.height,
      locale: other.locale,
      foreground: other.foreground,
      background: other.background,
      decoration: other.decoration,
      decorationColor: other.decorationColor,
      decorationStyle: other.decorationStyle,
      decorationThickness: other.decorationThickness,
    );
  }

  TextStyle apply({
    Color? color,
    Color? backgroundColor,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThicknessFactor,
    double? decorationThicknessDelta,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSizeFactor,
    double? fontSizeDelta,
    int? fontWeightDelta,
    FontStyle? fontStyle,
    double? letterSpacingFactor,
    double? letterSpacingDelta,
    double? wordSpacingFactor,
    double? wordSpacingDelta,
    double? heightFactor,
    double? heightDelta,
    TextBaseline? textBaseline,
    TextLeadingDistribution? leadingDistribution,
    dynamic locale,
    List<dynamic>? shadows,
    List<dynamic>? fontFeatures,
    List<dynamic>? fontVariations,
    String? package,
    TextOverflow? overflow,
  }) => this;

  static TextStyle? lerp(TextStyle? a, TextStyle? b, double t) => t < 0.5 ? a : b;
}

