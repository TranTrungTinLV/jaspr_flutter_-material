import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'package:jaspr/dom.dart' as dom;
import 'mock_types.dart';
import 'edge_insets.dart';
import 'decoration.dart';

typedef Widget = Component;
typedef StatelessWidget = StatelessComponent;
typedef StatefulWidget = StatefulComponent;


class AlignmentGeometry {
  const AlignmentGeometry();
  static AlignmentGeometry? lerp(AlignmentGeometry? a, AlignmentGeometry? b, double t) => a;
}

class Alignment extends AlignmentGeometry {
  final double x, y;
  const Alignment(this.x, this.y);
  static const Alignment topLeft = Alignment(-1.0, -1.0);
  static const Alignment topCenter = Alignment(0.0, -1.0);
  static const Alignment topRight = Alignment(1.0, -1.0);
  static const Alignment centerLeft = Alignment(-1.0, 0.0);
  static const Alignment center = Alignment(0.0, 0.0);
  static const Alignment centerRight = Alignment(1.0, 0.0);
  static const Alignment bottomLeft = Alignment(-1.0, 1.0);
  static const Alignment bottomCenter = Alignment(0.0, 1.0);
  static const Alignment bottomRight = Alignment(1.0, 1.0);
}

class Axis {
  static const int horizontal = 0;
  static const int vertical = 1;
}

class AxisDirection {
  static const int up = 0;
  static const int right = 1;
  static const int down = 2;
  static const int left = 3;
}

class VerticalDirection {
  static const int up = 0;
  static const int down = 1;
}

class RenderBox {}
class RenderDecoratedBox extends RenderBox {
  dynamic decoration;
  dynamic configuration;
  dynamic position;
  RenderDecoratedBox({this.decoration, this.configuration, this.position});
}

class Matrix4 {
  Matrix4();
  static Matrix4 rotationZ(double radians) => Matrix4();
  static Matrix4 identity() => Matrix4();
}

class BoxConstraints {
  static BoxConstraints lerp(BoxConstraints? a, BoxConstraints? b, double t) => a ?? const BoxConstraints();
  const BoxConstraints.expand({double? width, double? height}) : minWidth = width ?? double.infinity, maxWidth = width ?? double.infinity, minHeight = height ?? double.infinity, maxHeight = height ?? double.infinity;
  const BoxConstraints.tightFor({double? width, double? height}) : minWidth = width ?? 0.0, maxWidth = width ?? double.infinity, minHeight = height ?? 0.0, maxHeight = height ?? double.infinity;

  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  const BoxConstraints({
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
  });
  
  bool get isTight => minWidth >= maxWidth && minHeight >= maxHeight;
  BoxConstraints tighten({double? width, double? height}) => this;
  bool debugAssertIsValid() => true;
}

class ScaffoldFeatureController<T, U> {}
class ScaffoldMessengerState {
  void showSnackBar(dynamic snackBar) {}
  void hideCurrentSnackBar() {}
  void removeCurrentSnackBar() {}
}
class ScaffoldMessenger {
  static ScaffoldMessengerState? maybeOf(BuildContext context) => null;
  static ScaffoldMessengerState of(BuildContext context) => ScaffoldMessengerState();
}

abstract class SingleChildRenderObjectWidget extends StatelessComponent {
  final Component? child;
  const SingleChildRenderObjectWidget({super.key, this.child});

  @override
  Component build(BuildContext context) {
    return child ?? dom.div([]);
  }
}
extension BoxConstraintsExt on BoxConstraints {
  BoxConstraints copyWith({double? minWidth, double? maxWidth, double? minHeight, double? maxHeight}) => BoxConstraints(minWidth: minWidth ?? this.minWidth, maxWidth: maxWidth ?? this.maxWidth, minHeight: minHeight ?? this.minHeight, maxHeight: maxHeight ?? this.maxHeight);
}
abstract class InheritedTheme extends InheritedComponent {
  const InheritedTheme({super.key, required Component child}) : super(child: child);
  Widget wrap(BuildContext context, Widget child) => child;
}

