import 'package:jaspr/dom.dart' as dom;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text , VoidCallback;
import 'mock_types.dart';

class InkWell extends StatelessComponent {
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final Component? child;
  final Color? splashColor;
  final Color? hoverColor;
  final Color? focusColor;
  final Color? highlightColor;
  final dynamic borderRadius;
  final dynamic customBorder;
  final dynamic splashFactory;
  final dynamic overlayColor;

  const InkWell({
    super.key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.splashColor,
    this.hoverColor,
    this.focusColor,
    this.highlightColor,
    this.borderRadius,
    this.customBorder,
    this.splashFactory,
    this.overlayColor,
  });

  @override
  Component build(BuildContext context) {
    return dom.div(
      classes: 'ink-well',
      events: {
        if (onTap != null) 'click': (e) => onTap!(),
        if (onDoubleTap != null) 'dblclick': (e) => onDoubleTap!(),
      },
      styles: dom.Styles(
        cursor: onTap != null ? dom.Cursor.pointer : null,
        position: dom.Position.relative(),
        overflow: dom.Overflow.hidden,
      ),
      [child ?? dom.text('')],
    );
  }
}

class InkResponse extends InkWell {
  const InkResponse({
    super.key,
    super.child,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.splashColor,
    super.hoverColor,
    super.focusColor,
    super.highlightColor,
    super.borderRadius,
    super.customBorder,
    super.splashFactory,
    super.overlayColor,
  });
}

abstract class InteractiveInkFeatureFactory {
  const InteractiveInkFeatureFactory();
}
