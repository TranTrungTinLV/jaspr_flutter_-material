/// Image Component cho Jaspr — Bộ component thay thế cho Flutter Image.
library;

import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text ;

// ============================================================================
// BOX FIT
// ============================================================================

/// Tương đương với BoxFit của Flutter. Ánh xạ sang CSS `object-fit`.
enum BoxFit {
  fill,
  contain,
  cover,
  fitWidth,
  fitHeight,
  none,
  scaleDown,
}

String _boxFitToCss(BoxFit fit) {
  switch (fit) {
    case BoxFit.fill:
      return 'fill';
    case BoxFit.contain:
      return 'contain';
    case BoxFit.cover:
      return 'cover';
    case BoxFit.fitWidth:
      return 'contain'; // Trên web thường dùng width: 100%, height: auto kết hợp contain.
    case BoxFit.fitHeight:
      return 'contain';
    case BoxFit.none:
      return 'none';
    case BoxFit.scaleDown:
      return 'scale-down';
  }
}

// ============================================================================
// IMAGE
// ============================================================================

/// Image Component — sử dụng giống hệt Flutter Image.
class Image extends StatelessComponent {
  final String src;
  final Unit? width;
  final Unit? height;
  final BoxFit? fit;
  final String? semanticLabel;

  /// Default constructor
  const Image({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit,
    this.semanticLabel,
  });

  /// Hiển thị ảnh từ network (URL).
  /// Trong Jaspr, nó ánh xạ thẳng ra thẻ <img> với `src=url`.
  const Image.network(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.semanticLabel,
  });

  /// Hiển thị ảnh từ assets.
  /// Lưu ý: Trong Jaspr, các file tĩnh thường đặt trong thư mục `web/` ở thư mục gốc project.
  /// Ví dụ: web/images/logo.png -> src = 'images/logo.png'
  const Image.asset(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.semanticLabel,
  });

  @override
  Component build(BuildContext context) {
    return img(
      src: src,
      alt: semanticLabel ?? '',
      styles: Styles(
        width: width,
        height: height,
        raw: {
          if (fit != null) 'object-fit': _boxFitToCss(fit!),
        },
      ),
    );
  }
}
