import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'package:jaspr/dom.dart' as dom;
import 'mock_types.dart';
import 'edge_insets.dart';
import 'decoration.dart';

// ------------------------------------------------------------------
// MOCK WIDGETS (MAPPING TO CSS)
// ------------------------------------------------------------------

class LimitedBox extends StatelessComponent {
  final double maxWidth;
  final double maxHeight;
  final Component? child;

  const LimitedBox({
    super.key,
    this.maxWidth = double.infinity,
    this.maxHeight = double.infinity,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        maxWidth: maxWidth != double.infinity ? dom.Unit.pixels(maxWidth) : null,
        maxHeight: maxHeight != double.infinity ? dom.Unit.pixels(maxHeight) : null,
      ),
      [child!],
    );
  }
}

class ConstrainedBox extends StatelessComponent {
  final BoxConstraints constraints;
  final Component? child;

  const ConstrainedBox({
    super.key,
    required this.constraints,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        minWidth: constraints.minWidth > 0 ? dom.Unit.pixels(constraints.minWidth) : null,
        maxWidth: constraints.maxWidth != double.infinity ? dom.Unit.pixels(constraints.maxWidth) : null,
        minHeight: constraints.minHeight > 0 ? dom.Unit.pixels(constraints.minHeight) : null,
        maxHeight: constraints.maxHeight != double.infinity ? dom.Unit.pixels(constraints.maxHeight) : null,
      ),
      [child!],
    );
  }
}

class Align extends StatelessComponent {
  final AlignmentGeometry alignment;
  final Component? child;

  const Align({
    super.key,
    required this.alignment,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        display: dom.Display.flex,
        width: dom.Unit.percent(100),
        height: dom.Unit.percent(100),
        justifyContent: dom.JustifyContent.center,
        alignItems: dom.AlignItems.center,
      ),
      [child!],
    );
  }
}

class Padding extends StatelessComponent {
  final EdgeInsetsGeometry padding;
  final Component? child;

  const Padding({
    super.key,
    required this.padding,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        padding: padding.toJasprPadding,
      ),
      [child!],
    );
  }
}

class ColoredBox extends StatelessComponent {
  final Color color;
  final bool isAntiAlias;
  final Component? child;

  const ColoredBox({
    super.key,
    required this.color,
    this.isAntiAlias = true,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        backgroundColor: color.toJasprColor(),
      ),
      [child!],
    );
  }
}

class ClipPath extends StatelessComponent {
  final Clip clipBehavior;
  final Component? child;
  final dynamic clipper; 

  const ClipPath({
    super.key,
    this.clipBehavior = Clip.none,
    this.child,
    this.clipper,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div(
      styles: dom.Styles(
        overflow: clipBehavior != Clip.none ? dom.Overflow.hidden : null,
      ),
      [child!],
    );
  }
}

class DecoratedBox extends StatelessComponent {
  final Decoration decoration;
  final DecorationPosition position;
  final Component? child;

  const DecoratedBox({
    super.key,
    required this.decoration,
    this.position = DecorationPosition.background,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div([child!]);
  }
}

class Transform extends StatelessComponent {
  final Matrix4 transform;
  final AlignmentGeometry? alignment;
  final Component? child;

  const Transform({
    super.key,
    required this.transform,
    this.alignment,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    if (child == null) return dom.text('');
    return dom.div([child!]);
  }
}

class Icon extends StatelessComponent {
  final IconData? icon;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  const Icon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  @override
  Component build(BuildContext context) {
    return dom.span(
      styles: dom.Styles(
        width: size != null ? dom.Unit.pixels(size!) : null,
        height: size != null ? dom.Unit.pixels(size!) : null,
        color: color?.toJasprColor(),
      ),
      [
        dom.text(String.fromCharCode(icon?.codePoint ?? 0)),
      ],
    );
  }
}

class Navigator {
  static void maybePop(BuildContext context) {}
}
