import 'package:jaspr/dom.dart' hide Color, Padding, Transform, Border, BorderRadius, Text, BoxShadow, Radius, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'mock_types.dart';

class AppBar extends StatelessComponent implements PreferredSizeWidget {
  final Component? title;
  final Color? backgroundColor;
  final double? elevation;

  const AppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        // basic app bar style
      ),
      [
        if (title != null) title!
      ],
    );
  }
}
