import 'package:jaspr/dom.dart' hide Color, Padding, Transform, Border, BorderRadius, Text, BoxShadow, Radius, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'mock_types.dart';

class MaterialApp extends StatelessComponent {
  final Component? child;
  final Color? color;

  const MaterialApp({
    super.key,
    this.child,
    this.color,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
      ),
      [
        if (child != null) child!
      ],
    );
  }
}
