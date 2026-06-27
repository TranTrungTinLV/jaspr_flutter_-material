library;

import 'mock_types.dart';


abstract class DecorationImagePainter {
  void paint(Canvas canvas, Rect rect, Path? clipPath, ImageConfiguration configuration);
  void dispose();
}

class DecorationImage {
  const DecorationImage();
  DecorationImagePainter createPainter(VoidCallback onChanged) {
    throw UnimplementedError();
  }
  static DecorationImage? lerp(DecorationImage? a, DecorationImage? b, double t) => a ?? b;
}

ImageConfiguration createLocalImageConfiguration(dynamic context, {dynamic size}) => const ImageConfiguration();
