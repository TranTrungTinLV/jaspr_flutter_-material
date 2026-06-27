/// Stub cho debug.dart — các hàm debug dùng trong Flutter source.
library;

import 'painting.dart';

/// Stub cho objectRuntimeType — trả về tên class.
String objectRuntimeType(Object? object, String optimizedValue) {
  return optimizedValue;
}

String debugFormatDouble(double? value) => value?.toStringAsFixed(1) ?? 'null';

bool debugDisableShadows = false;

enum DiagnosticsTreeStyle { none, singleLine, errorProperty, whitespace }

mixin Diagnosticable {
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {}
  String toStringShort() => super.toString();
}

class DiagnosticsNode {
  const DiagnosticsNode();
}

class DiagnosticsProperty<T> extends DiagnosticsNode {
  DiagnosticsProperty(String name, T? value, {Object? defaultValue, Object? ifNull, String? description, bool showName = true, Object? style, dynamic level});
}
class IterableProperty<T> extends DiagnosticsProperty<Iterable<T>> {
  IterableProperty(String name, Iterable<T>? value, {Object? defaultValue, Object? ifNull, String? description, Object? style, Object? ifEmpty, dynamic level})
      : super(name, value);
}
class ObjectFlagProperty<T> extends DiagnosticsProperty<T> {
  ObjectFlagProperty.has(String name, T? value, { dynamic level }) : super(name, value);
}
class EnumProperty<T> extends DiagnosticsProperty<T> {
  EnumProperty(String name, T? value, {Object? defaultValue, dynamic level}) : super(name, value);
}
class ColorProperty extends DiagnosticsProperty<Color> {
  ColorProperty(String name, Color? value, {Object? defaultValue, Object? style, dynamic level}) : super(name, value);
}

class DiagnosticPropertiesBuilder {
  DiagnosticsTreeStyle? defaultDiagnosticsTreeStyle;
  String? emptyBodyDescription;
  void add(DiagnosticsNode property) {}
}

class DoubleProperty extends DiagnosticsProperty<double> {
  DoubleProperty(String name, double? value, {dynamic defaultValue, dynamic level}) : super(name, value);
}

class StringProperty extends DiagnosticsProperty<String> {
  StringProperty(String name, String? value, {
    String? tooltip,
    bool showName = true,
    Object? defaultValue,
    bool quoted = true,
    String? ifEmpty,
    Object? style,
    dynamic level,
  }) : super(name, value);
}

class FlagProperty extends DiagnosticsProperty<bool> {
  FlagProperty(String name, {
    required bool? value,
    String? ifTrue,
    String? ifFalse,
    bool showName = false,
    dynamic defaultValue,
    dynamic level,
  }) : super(name, value);
}
enum DiagnosticLevel { hidden, fine, debug, info, warning, error, off }
