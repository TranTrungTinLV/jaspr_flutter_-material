import 'package:jaspr/dom.dart' hide Color, Padding, Transform, Border, BorderRadius, Text, BoxShadow, Radius, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'mock_types.dart';

class TextFlutter extends StatelessComponent {
  final String data;
  final TextStyle? style;
  final dynamic textAlign;
  final dynamic overflow;
  final dynamic maxLines;

  const TextFlutter(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Component build(BuildContext context) {
    return span(
      styles: Styles(
        // We can add simple css mappings here if needed
      ),
      [text(data)],
    );
  }
}
