/// Basic Components cho Jaspr — Bộ component cơ bản thay thế cho Flutter.
///
/// Bao gồm: Align, Opacity, PaddingBox (thay thế cho Padding), ClipRRect, ClipOval.
library;

import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text ;
import 'package:jaspr/dom.dart' as dom;
import 'package:my_website_flutter/shared/components/mock_types.dart';

// ============================================================================
// ALIGNMENT
// ============================================================================

/// Đại diện cho Alignment của Flutter, ánh xạ sang JustifyContent và AlignItems của Flexbox.
class Alignment {
  final JustifyContent justifyContent;
  final AlignItems alignItems;

  const Alignment(this.justifyContent, this.alignItems);

  static const Alignment topLeft = Alignment(JustifyContent.start, AlignItems.start);
  static const Alignment topCenter = Alignment(JustifyContent.center, AlignItems.start);
  static const Alignment topRight = Alignment(JustifyContent.end, AlignItems.start);
  static const Alignment centerLeft = Alignment(JustifyContent.start, AlignItems.center);
  static const Alignment center = Alignment(JustifyContent.center, AlignItems.center);
  static const Alignment centerRight = Alignment(JustifyContent.end, AlignItems.center);
  static const Alignment bottomLeft = Alignment(JustifyContent.start, AlignItems.end);
  static const Alignment bottomCenter = Alignment(JustifyContent.center, AlignItems.end);
  static const Alignment bottomRight = Alignment(JustifyContent.end, AlignItems.end);
}

// ============================================================================
// ALIGN
// ============================================================================

/// Căn lề một Widget bên trong không gian cha (tương tự Align của Flutter).
/// Hoạt động dựa trên CSS flexbox.
class Align extends StatelessComponent {
  final Component child;
  final Alignment alignment;

  const Align({
    super.key,
    required this.child,
    this.alignment = Alignment.center,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 100.percent,
        height: 100.percent,
        justifyContent: alignment.justifyContent,
        alignItems: alignment.alignItems,
      ),
      [child],
    );
  }
}

// ============================================================================
// OPACITY
// ============================================================================

/// Làm mờ child. Nhận giá trị từ 0.0 (trong suốt) đến 1.0 (hiển thị hoàn toàn).
/// Ánh xạ sang CSS `opacity: <value>`.
class Opacity extends StatelessComponent {
  final Component child;
  final double opacity;

  const Opacity({
    super.key,
    required this.opacity,
    required this.child,
  }) : assert(opacity >= 0.0 && opacity <= 1.0);

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        opacity: opacity,
      ),
      [child],
    );
  }
}

// ============================================================================
// PADDING BOX
// ============================================================================

/// Chức năng giống Padding trong Flutter.
/// Do Jaspr đã có class tên `Padding` (dùng cho CSS), nên đổi tên thành `PaddingBox`.
class PaddingBox extends StatelessComponent {
  final Component child;
  final dynamic padding;

  const PaddingBox({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        padding: padding,
        boxSizing: BoxSizing.borderBox,
      ),
      [child],
    );
  }
}

// ============================================================================
// CLIP RRECT
// ============================================================================

/// Cắt góc bo tròn của child. Ánh xạ sang CSS `overflow: hidden; border-radius: <radius>`.
class ClipRRect extends StatelessComponent {
  final Component child;
  final dynamic borderRadius;

  const ClipRRect({
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    required this.child,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        overflow: Overflow.hidden,
        radius: borderRadius,
      ),
      [child],
    );
  }
}

// ============================================================================
// CLIP OVAL
// ============================================================================

/// Cắt thành hình oval hoặc hình tròn. Ánh xạ sang CSS `overflow: hidden; border-radius: 50%`.
class ClipOval extends StatelessComponent {
  final Component child;

  const ClipOval({
    super.key,
    required this.child,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        radius: dom.BorderRadius.circular(dom.Unit.pixels(50)),
        overflow: Overflow.hidden,
      ),
      [child],
    );
  }
}
