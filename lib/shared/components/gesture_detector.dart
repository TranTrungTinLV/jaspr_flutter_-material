/// GestureDetector Component cho Jaspr — Mô phỏng Flutter GestureDetector
library;

import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text ;

/// GestureDetector: Bọc một Component để bắt các sự kiện chạm, nhấp chuột.
/// Trong môi trường Web, chủ yếu ánh xạ sang `onClick` (click) và `onDblClick` (double click).
///
/// Lưu ý cho Web: Sử dụng `display: contents` để không làm thay đổi cấu trúc Flexbox (Row, Column)
/// của Component con bên trong.
class GestureDetector extends StatelessComponent {
  final Component? child;

  // Gọi khi nhấp chuột (click)
  final VoidCallback? onTap;

  // Gọi khi nhấp đúp (double click)
  final VoidCallback? onDoubleTap;

  // Dành cho Web: hover chuột vào và ra
  final VoidCallback? onPointerEnter;
  final VoidCallback? onPointerExit;

  const GestureDetector({
    super.key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onPointerEnter,
    this.onPointerExit,
  });

  @override
  Component build(BuildContext context) {
    return div(
      events: {
        if (onTap != null) 'click': (e) => onTap!(),
        if (onDoubleTap != null) 'dblclick': (e) => onDoubleTap!(),
        if (onPointerEnter != null) 'mouseenter': (e) => onPointerEnter!(),
        if (onPointerExit != null) 'mouseleave': (e) => onPointerExit!(),
      },
      styles: Styles(
        // display: contents giúp GestureDetector tàng hình về mặt Layout,
        // Component con bên trong vẫn sẽ layout bình thường với thằng cha bên ngoài.
        display: Display.contents,

        // Hiển thị bàn tay khi có thể click
        cursor: (onTap != null || onDoubleTap != null) ? Cursor.pointer : null,
      ),
      [if (child != null) child!],
    );
  }
}
