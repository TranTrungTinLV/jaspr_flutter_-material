import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text, VoidCallback;
import 'package:jaspr/dom.dart' as dom;
import 'mock_types.dart';
import 'mock_widgets.dart';

class IconButton extends StatelessComponent {
  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final Color? color;
  final ButtonStyle? style;

  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
    this.style,
  });

  @override
  Component build(BuildContext context)  {
    return dom.button(
      events: onPressed != null ? {'click': (e) => onPressed!()} : null,
      attributes: tooltip != null ? {'title': tooltip!} : null,
      styles: dom.Styles(),
      [icon as Component],
    );
  }
}
