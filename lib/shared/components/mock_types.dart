library;

import 'dart:async';
import 'dart:typed_data';

import 'package:jaspr/dom.dart' as dom;
import 'package:jaspr/jaspr.dart' hide VoidCallback, objectRuntimeType;

import 'border_radius.dart';
import 'borders.dart';
import 'layout.dart';
import 'mock_material_types.dart';
import 'painting.dart';

export 'material_localizations.dart';
export 'text.dart';
export 'button_style.dart';
export 'basic.dart' hide Align, Alignment;
export 'border_radius.dart';
export 'borders.dart';
export 'box_border.dart';
export 'box_decoration.dart';
export 'box_shadow.dart';
export 'constants.dart';
export 'debug.dart';
export 'decoration.dart';
export 'edge_insets.dart';
export 'framework.dart';
export 'icon_theme_data.dart' hide DoubleProperty, Shadow, DiagnosticsProperty;
export 'icons.dart';
export 'layout.dart' hide VerticalDirection;
export 'mock_material_types.dart' hide BorderRadius;
export 'mock_widgets.dart';
export 'package:jaspr/jaspr.dart' hide VoidCallback, objectRuntimeType;
export 'painting.dart';
export 'text_style.dart';

import 'debug.dart';
class ErrorSummary extends DiagnosticsNode {
  ErrorSummary(String message);
}
class ErrorDescription extends DiagnosticsNode {
  ErrorDescription(String message);
}
class ErrorHint extends DiagnosticsNode {
  ErrorHint(String message);
}
class FlutterError {
  static Never fromParts(List<DiagnosticsNode> diagnostics) {
    throw Exception('FlutterError: $diagnostics');
  }
}

extension ColorJasprExt on Color {
  dom.Color toJasprColor() {
    return dom.Color('#${toARGB32().toRadixString(16).padLeft(8, '0')}');
  }
}

class SystemColor extends Color {
  const SystemColor(super.value);
  static SystemColorPalette get dark => const SystemColorPalette();
  static SystemColorPalette get light => const SystemColorPalette();
  static bool get platformProvidesSystemColors => false;
}

class SystemColorPalette {
  final SystemColor accentColor = const SystemColor(0);
  final SystemColor accentColorText = const SystemColor(0);
  final SystemColor canvas = const SystemColor(0);
  final SystemColor canvasText = const SystemColor(0);
  final SystemColor buttonFace = const SystemColor(0);
  final SystemColor buttonBorder = const SystemColor(0);
  final SystemColor buttonText = const SystemColor(0);
  final SystemColor field = const SystemColor(0);
  final SystemColor fieldText = const SystemColor(0);
  const SystemColorPalette();
}

// ------------------------------------------------------------------
// SIZE & GEOMETRY
// ------------------------------------------------------------------

class Size {
  final double width;
  final double height;
  const Size(this.width, this.height);
  const Size.fromHeight(this.height) : width = double.infinity;
  static const Size zero = Size(0, 0);
  
  Offset center(Offset origin) => Offset(origin.dx + width / 2.0, origin.dy + height / 2.0);
}

class Offset {
  final double dx;
  final double dy;
  const Offset(this.dx, this.dy);
  static const Offset zero = Offset(0, 0);

  Offset operator -(Offset other) => Offset(dx - other.dx, dy - other.dy);
  Offset operator +(Offset other) => Offset(dx + other.dx, dy + other.dy);
  Offset operator *(double operand) => Offset(dx * operand, dy * operand);
  
  static Offset? lerp(Offset? a, Offset? b, double t) {
    if (a == null && b == null) return null;
    if (a == null) return b! * t;
    if (b == null) return a * (1.0 - t);
    return Offset(lerpDouble(a.dx, b.dx, t) ?? 0.0, lerpDouble(a.dy, b.dy, t) ?? 0.0);
  }
  
  double get distance => 0.0; // Mock implementation
  
  Rect operator &(Size size) => Rect.fromLTWH(dx, dy, size.width, size.height);
}

class Radius {
  final double x;
  final double y;
  const Radius.circular(double radius) : x = radius, y = radius;
  const Radius.elliptical(this.x, this.y);
  static const Radius zero = Radius.circular(0.0);
  
  Radius clamp({Radius? minimum, Radius? maximum}) => this;
  Radius operator -() => Radius.elliptical(-x, -y);
  Radius operator +(Radius other) => Radius.elliptical(x + other.x, y + other.y);
  Radius operator -(Radius other) => Radius.elliptical(x - other.x, y - other.y);
  Radius operator *(double operand) => Radius.elliptical(x * operand, y * operand);
  Radius operator /(double operand) => Radius.elliptical(x / operand, y / operand);
  Radius operator ~/(double operand) => Radius.elliptical((x ~/ operand).toDouble(), (y ~/ operand).toDouble());
  Radius operator %(double operand) => Radius.elliptical(x % operand, y % operand);
  static Radius? lerp(Radius? a, Radius? b, double t) => a;
}

class Rect {
  final double left, top, right, bottom;
  const Rect.fromLTRB(this.left, this.top, this.right, this.bottom);
  bool get isEmpty => false;
  bool get hasNaN => false;
  static const Rect zero = Rect.fromLTRB(0, 0, 0, 0);
  static const Rect largest = Rect.fromLTRB(-1e4, -1e4, 1e4, 1e4);

  const Rect.fromLTWH(double left, double top, double width, double height) 
      : this.fromLTRB(left, top, left + width, top + height);
  
  factory Rect.fromCircle({required Offset center, required double radius}) {
    return Rect.fromLTRB(center.dx - radius, center.dy - radius, center.dx + radius, center.dy + radius);
  }
  
  double get width => right - left;
  double get height => bottom - top;
  double get shortestSide => width < height ? width : height;
  Offset get center => Offset((left + right) / 2, (top + bottom) / 2);
  
  bool contains(Offset offset) => true;
  Rect shift(Offset offset) => Rect.fromLTRB(left + offset.dx, top + offset.dy, right + offset.dx, bottom + offset.dy);
  Rect inflate(double delta) => Rect.fromLTRB(left - delta, top - delta, right + delta, bottom + delta);
}

class RRect {
  final double left, top, right, bottom;
  final Radius tlRadius, trRadius, brRadius, blRadius;
  
  const RRect.fromLTRBAndCorners(
    this.left, this.top, this.right, this.bottom, {
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
  }) : tlRadius = topLeft,
       trRadius = topRight,
       brRadius = bottomRight,
       blRadius = bottomLeft;
       
  static RRect fromRectAndCorners(Rect boundingBox, {
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
  }) {
    return RRect.fromLTRBAndCorners(
      boundingBox.left, boundingBox.top, boundingBox.right, boundingBox.bottom,
      topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft,
    );
  }
  
  bool contains(Offset offset) => true;

  RRect deflate(double delta) => this;
  
  bool get hasNaN => false;
  RRect inflate(double delta) => this; // mock
  static RRect fromRectAndRadius(Rect rect, Radius radius) {
    return RRect.fromLTRBAndCorners(
      rect.left, rect.top, rect.right, rect.bottom,
      topLeft: radius, topRight: radius, bottomRight: radius, bottomLeft: radius,
    );
  }
}

enum Axis { horizontal, vertical }

// TextDirection-aware helpers
bool debugCheckCanResolveTextDirection(TextDirection? direction, String caller) => direction != null;

double clampDouble(double x, double min, double max) {
  if (x < min) return min;
  if (x > max) return max;
  return x;
}

class ViewPadding {
  final double left, top, right, bottom;
  const ViewPadding({this.left = 0.0, this.top = 0.0, this.right = 0.0, this.bottom = 0.0});
}

double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0.0;
  b ??= 0.0;
  return a + (b - a) * t;
}

typedef VoidCallback = void Function();

class Gradient {
  const Gradient();
  Shader createShader(Rect rect, {TextDirection? textDirection}) { throw UnimplementedError(); }
  Gradient scale(double factor) => this;
  static Gradient? lerp(Gradient? a, Gradient? b, double t) => a ?? b;
}

bool listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

class ColorSwatch<T> extends Color {
  const ColorSwatch(super.primary, this._swatch);
  final Map<T, Color> _swatch;
  Color? operator [](T index) => _swatch[index];
}

// FFI and Internal Flutter Mocks
class Bool {}
class Double {}
class Handle {}
class Int32 {}
class Uint32 {}
class Uint64 {}
class Void {}
class Pointer<T> {}

class Native<T> { const Native({String? symbol, dynamic assetId, bool? isLeaf}); }
class NativeFieldWrapperClass1 {}

class RSTransform {
  final double scos = 0.0;
  final double ssin = 0.0;
  final double tx = 0.0;
  final double ty = 0.0;
}
class RSuperellipse {
  bool get hasNaN => false;
  static RSuperellipse fromRectAndCorners(Rect boundingBox, {
    Radius topLeft = Radius.zero,
    Radius topRight = Radius.zero,
    Radius bottomRight = Radius.zero,
    Radius bottomLeft = Radius.zero,
  }) {
    return RSuperellipse();
  }
}
class _NativeRSuperellipse {}
bool get _impellerEnabled => false;
final Endian _kFakeHostEndian = Endian.host;
double _lerpDouble(num a, num b, double t) => lerpDouble(a, b, t) ?? 0.0;

// ------------------------------------------------------------------
// WIDGET & COMPONENTS
// ------------------------------------------------------------------

abstract class PreferredSizeWidget implements Component {
  Size get preferredSize;
}

// ------------------------------------------------------------------
// MATERIAL
// ------------------------------------------------------------------

enum MaterialType {
  canvas,
  card,
  circle,
  button,
  transparency,
}

enum Clip {
  none,
  hardEdge,
  antiAlias,
  antiAliasWithSaveLayer,
}

// ------------------------------------------------------------------
// TEXT & ICONS
// ------------------------------------------------------------------



// ------------------------------------------------------------------
// APP BAR
// ------------------------------------------------------------------

class SystemUiOverlayStyle {
  const SystemUiOverlayStyle();
}

typedef ScrollNotificationPredicate = bool Function(dynamic notification);

bool defaultScrollNotificationPredicate(dynamic notification) => true;

// ------------------------------------------------------------------
// SCAFFOLD
// ------------------------------------------------------------------

abstract class FloatingActionButtonLocation {
  const FloatingActionButtonLocation();
}

abstract class FloatingActionButtonAnimator {
  const FloatingActionButtonAnimator();
}

enum AlignmentDirectional {
  topStart,
  topCenter,
  topEnd,
  centerStart,
  center,
  centerEnd,
  bottomStart,
  bottomCenter,
  bottomEnd,
}

typedef DrawerCallback = void Function(bool isOpened);

enum DragStartBehavior {
  down,
  start,
}


bool mapEquals<T, U>(Map<T, U>? a, Map<T, U>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  if (identical(a, b)) return true;
  for (final T key in a.keys) {
    if (!b.containsKey(key) || b[key] != a[key]) return false;
  }
  return true;
}
