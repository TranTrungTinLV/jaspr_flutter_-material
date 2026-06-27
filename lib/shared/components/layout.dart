/// Layout Components cho Jaspr — Bộ component cốt lõi thay thế cho Flutter.
///
/// Thư viện này chứa các component quen thuộc của Flutter nhưng được
/// ánh xạ sang CSS Box Model và CSS Flexbox của Jaspr.
/// Bao gồm: Row, Column, Expanded, Flexible, SizedBox, Center, Stack, Positioned.
library;

import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text ;

// ============================================================================
// ENUMS FOR FLEXBOX (Mapping từ Flutter sang CSS)
// ============================================================================

enum MainAxisAlignment {
  start(JustifyContent.start),
  end(JustifyContent.end),
  center(JustifyContent.center),
  spaceBetween(JustifyContent.spaceBetween),
  spaceAround(JustifyContent.spaceAround),
  spaceEvenly(JustifyContent.spaceEvenly)
  ;

  final JustifyContent justify;
  const MainAxisAlignment(this.justify);
}

enum CrossAxisAlignment {
  start(AlignItems.start),
  end(AlignItems.end),
  center(AlignItems.center),
  stretch(AlignItems.stretch),
  baseline(AlignItems.baseline)
  ;

  final AlignItems align;
  const CrossAxisAlignment(this.align);
}

enum MainAxisSize {
  /// Cố gắng chiếm ít không gian nhất có thể (CSS: inline-flex / width: max-content).
  min,

  /// Cố gắng chiếm toàn bộ không gian có thể (CSS: flex / width: 100%).
  max,
}

enum FlexFit {
  /// Bắt buộc chiếm toàn bộ không gian được chia (flex-grow: X, flex-basis: 0).
  tight,

  /// Có thể chiếm tối đa không gian được chia nhưng không bắt buộc (flex-grow: 0).
  loose,
}

enum TextDirection { ltr, rtl }

enum VerticalDirection { up, down }

enum TextBaseline { alphabetic, ideographic }

// ============================================================================
// ROW & COLUMN
// ============================================================================

/// Hàng ngang (Row) - Ánh xạ sang CSS `display: flex; flex-direction: row;`.
class Row extends StatelessComponent {
  final List<Component> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;
  final double? spacing;

  const Row({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
    this.spacing,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: mainAxisSize == MainAxisSize.max ? Display.flex : Display.inlineFlex,
        width: mainAxisSize == MainAxisSize.max ? 100.percent : null,
        flexDirection: textDirection == TextDirection.rtl ? FlexDirection.rowReverse : FlexDirection.row,
        justifyContent: mainAxisAlignment.justify,
        alignItems: crossAxisAlignment.align,
        gap: spacing != null ? Gap(row: Unit.pixels(spacing!), column: Unit.pixels(spacing!)) : null,
      ),
      children,
    );
  }
}

/// Cột dọc (Column) - Ánh xạ sang CSS `display: flex; flex-direction: column;`.
class Column extends StatelessComponent {
  final List<Component> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;
  final double? spacing;

  const Column({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing,
  });

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: mainAxisSize == MainAxisSize.max ? Display.flex : Display.inlineFlex,
        height: mainAxisSize == MainAxisSize.max ? 100.percent : null,
        flexDirection: verticalDirection == VerticalDirection.up ? FlexDirection.columnReverse : FlexDirection.column,
        justifyContent: mainAxisAlignment.justify,
        alignItems: crossAxisAlignment.align,
        gap: spacing != null ? Gap(row: Unit.pixels(spacing!), column: Unit.pixels(spacing!)) : null,
      ),
      children,
    );
  }
}

// ============================================================================
// EXPANDED & FLEXIBLE
// ============================================================================

/// Mở rộng Component để lấp đầy khoảng trống (flex-grow).
class Expanded extends StatelessComponent {
  final Component child;
  final int flex;

  const Expanded({super.key, required this.child, this.flex = 1});

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        minWidth: 0.px,
        minHeight: 0.px, // Trick CSS để flex item có thể co lại nhỏ hơn nội dung
        flex: Flex(grow: flex.toDouble(), shrink: 1, basis: Unit.zero),
      ),
      [child],
    );
  }
}

/// Tương tự Expanded nhưng cho phép cấu hình FlexFit.
class Flexible extends StatelessComponent {
  final Component child;
  final int flex;
  final FlexFit fit;

  const Flexible({super.key, required this.child, this.flex = 1, this.fit = FlexFit.loose});

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        minWidth: 0.px,
        minHeight: 0.px,
        flex: fit == FlexFit.tight
            ? Flex(grow: flex.toDouble(), shrink: 1, basis: Unit.zero)
            : Flex(grow: 0, shrink: flex.toDouble(), basis: Unit.auto),
      ),
      [child],
    );
  }
}

// ============================================================================
// SIZED BOX & CENTER
// ============================================================================

/// Hộp cố định kích thước. Nếu không có child, nó đóng vai trò làm khoảng trống.
class SizedBox extends StatelessComponent {
  final Component? child;
  final Unit? width;
  final Unit? height;

  const SizedBox({super.key, this.child, this.width, this.height});

  const SizedBox.square({super.key, this.child, Unit? dimension}) : width = dimension, height = dimension;

  const SizedBox.shrink({super.key, this.child}) : width = const Unit.pixels(0), height = const Unit.pixels(0);

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: child == null ? Display.block : null,
        width: width,
        height: height,
      ),
      [if (child != null) child!],
    );
  }
}

/// Căn giữa nội dung bên trong. Hoạt động dựa trên flexbox (justify-content: center).
class Center extends StatelessComponent {
  final Component child;

  const Center({super.key, required this.child});

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 100.percent,
        height: 100.percent,
        justifyContent: JustifyContent.center,
        alignItems: AlignItems.center,
      ),
      [child],
    );
  }
}

// ============================================================================
// STACK & POSITIONED
// ============================================================================

/// Stack - Xếp chồng các Component. Ánh xạ sang CSS `position: relative`.
class Stack extends StatelessComponent {
  final List<Component> children;

  const Stack({super.key, required this.children});

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        position: Position.relative(),
        width: 100.percent,
        height: 100.percent,
      ),
      children,
    );
  }
}

/// Vị trí tuyệt đối bên trong Stack. Ánh xạ sang CSS `position: absolute`.
class Positioned extends StatelessComponent {
  final Component child;
  final Unit? top;
  final Unit? bottom;
  final Unit? left;
  final Unit? right;
  final Unit? width;
  final Unit? height;

  const Positioned({
    super.key,
    required this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.width,
    this.height,
  });

  const Positioned.fill({super.key, required this.child})
    : top = const Unit.pixels(0),
      bottom = const Unit.pixels(0),
      left = const Unit.pixels(0),
      right = const Unit.pixels(0),
      width = null,
      height = null;

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        position: Position.absolute(top: top, bottom: bottom, left: left, right: right),
        width: width,
        height: height,
      ),
      [child],
    );
  }
}
