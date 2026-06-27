/// ListView Component cho Jaspr — Mô phỏng Flutter ListView
library;

import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text ;

enum Axis { horizontal, vertical }

/// Một danh sách cuộn được, tương tự như `ListView` của Flutter.
/// Trên Web, nó được ánh xạ sang một `div` có thuộc tính `overflow: auto`
/// kết hợp với `display: flex` để hỗ trợ hướng cuộn và đảo ngược (reverse).
class ListView extends StatelessComponent {
  final List<Component> children;
  final Axis scrollDirection;
  final bool reverse;

  const ListView({
    super.key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  });

  /// Mô phỏng ListView.builder (trong môi trường Web tĩnh, ta có thể sinh
  /// toàn bộ child ngay từ đầu, hoặc dùng `List.generate`).
  /// Vì Jaspr render ra HTML DOM nên trình duyệt có khả năng xử lý
  /// danh sách rất dài mà không bị lag như vẽ từng pixel của Flutter.
  ListView.builder({
    super.key,
    required int itemCount,
    required Component Function(BuildContext context, int index) itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  }) : children = _buildChildren(itemCount, itemBuilder);

  static List<Component> _buildChildren(
    int itemCount,
    Component Function(BuildContext context, int index) itemBuilder,
  ) {
    // Jaspr hỗ trợ sinh giao diện tĩnh thông qua Dummy BuildContext
    // Tuy nhiên để đơn giản trong ví dụ này, ta cho phép gọi itemBuilder
    // với null context (vì StatelessComponent hiếm khi dùng context trong Jaspr).
    // Nếu bắt buộc cần context, ta sẽ phải bọc nó trong một Component khác.
    return List.generate(itemCount, (index) => _BuilderItem(index: index, builder: itemBuilder));
  }

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: Display.flex,
        width: 100.percent,

        // Cấu hình thanh cuộn
        height: 100.percent,

        // Bắt buộc phải có kích thước để cuộn hoạt động
        overflow: Overflow.only(
          x: scrollDirection == Axis.horizontal ? OverflowValue.auto : OverflowValue.hidden,
          y: scrollDirection == Axis.vertical ? OverflowValue.auto : OverflowValue.hidden,
        ),
        flexDirection: scrollDirection == Axis.vertical
            ? (reverse ? FlexDirection.columnReverse : FlexDirection.column)
            : (reverse ? FlexDirection.rowReverse : FlexDirection.row),
      ),
      children,
    );
  }
}

/// Helper component cho ListView.builder
class _BuilderItem extends StatelessComponent {
  final int index;
  final Component Function(BuildContext context, int index) builder;

  const _BuilderItem({required this.index, required this.builder});

  @override
  Component build(BuildContext context) {
    return builder(context, index);
  }
}
