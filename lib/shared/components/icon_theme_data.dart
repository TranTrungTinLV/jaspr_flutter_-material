import 'package:jaspr/dom.dart' hide Color, Shadow, Padding, Transform, Border, BorderRadius, Text, BoxShadow, Radius, Offset, VoidCallback;

import 'mock_types.dart';

double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0.0;
  b ??= 0.0;
  return a + (b - a) * t;
}

double clampDouble(num x, num min, num max) {
  if (x < min) return min.toDouble();
  if (x > max) return max.toDouble();
  return x.toDouble();
}

bool listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

class DiagnosticsProperty<T> extends DiagnosticsNode {
  DiagnosticsProperty(String name, T? value, {Object? defaultValue}) {}
}

class IconThemeData with Diagnosticable {
  const IconThemeData({
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    double? opacity,
    this.shadows,
    this.applyTextScaling,
  }) : _opacity = opacity;

  const IconThemeData.fallback()
    : size = 24.0,
      fill = 0.0,
      weight = 400.0,
      grade = 0.0,
      opticalSize = 48.0,
      color = const Color(0xFF000000),
      _opacity = 1.0,
      shadows = null,
      applyTextScaling = false;

  IconThemeData copyWith({
    double? size,
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    Color? color,
    double? opacity,
    List<Shadow>? shadows,
    bool? applyTextScaling,
  }) {
    return IconThemeData(
      size: size ?? this.size,
      fill: fill ?? this.fill,
      weight: weight ?? this.weight,
      grade: grade ?? this.grade,
      opticalSize: opticalSize ?? this.opticalSize,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      shadows: shadows ?? this.shadows,
      applyTextScaling: applyTextScaling ?? this.applyTextScaling,
    );
  }

  IconThemeData merge(IconThemeData? other) {
    if (other == null) return this;
    return copyWith(
      size: other.size,
      fill: other.fill,
      weight: other.weight,
      grade: other.grade,
      opticalSize: other.opticalSize,
      color: other.color,
      opacity: other.opacity,
      shadows: other.shadows,
      applyTextScaling: other.applyTextScaling,
    );
  }

  IconThemeData resolve(dynamic context) => this;

  bool get isConcrete =>
      size != null &&
      fill != null &&
      weight != null &&
      grade != null &&
      opticalSize != null &&
      color != null &&
      opacity != null &&
      applyTextScaling != null;

  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;

  double? get opacity => _opacity == null ? null : clampDouble(_opacity!, 0.0, 1.0);
  final double? _opacity;

  final List<Shadow>? shadows;
  final bool? applyTextScaling;

  static IconThemeData lerp(IconThemeData? a, IconThemeData? b, double t) {
    if (identical(a, b) && a != null) return a;
    return IconThemeData(
      size: lerpDouble(a?.size, b?.size, t),
      fill: lerpDouble(a?.fill, b?.fill, t),
      weight: lerpDouble(a?.weight, b?.weight, t),
      grade: lerpDouble(a?.grade, b?.grade, t),
      opticalSize: lerpDouble(a?.opticalSize, b?.opticalSize, t),
      color: Color.lerp(a?.color, b?.color, t),
      opacity: lerpDouble(a?.opacity, b?.opacity, t),
      shadows: Shadow.lerpList(a?.shadows, b?.shadows, t),
      applyTextScaling: t < 0.5 ? a?.applyTextScaling : b?.applyTextScaling,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is IconThemeData &&
        other.size == size &&
        other.fill == fill &&
        other.weight == weight &&
        other.grade == grade &&
        other.opticalSize == opticalSize &&
        other.color == color &&
        other.opacity == opacity &&
        listEquals(other.shadows, shadows) &&
        other.applyTextScaling == applyTextScaling;
  }

  @override
  int get hashCode => Object.hash(size, fill, weight, grade, opticalSize, color, opacity, shadows == null ? null : Object.hashAll(shadows!), applyTextScaling);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('size', size, defaultValue: null));
    properties.add(DoubleProperty('fill', fill, defaultValue: null));
    properties.add(DoubleProperty('weight', weight, defaultValue: null));
    properties.add(DoubleProperty('grade', grade, defaultValue: null));
    properties.add(DoubleProperty('opticalSize', opticalSize, defaultValue: null));
    properties.add(ColorProperty('color', color, defaultValue: null));
    properties.add(DoubleProperty('opacity', opacity, defaultValue: null));
    properties.add(IterableProperty<Shadow>('shadows', shadows, defaultValue: null));
    properties.add(DiagnosticsProperty<bool>('applyTextScaling', applyTextScaling, defaultValue: null));
  }
}
