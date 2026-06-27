import 'ink_well.dart';

class InkSparkle {
  static const InteractiveInkFeatureFactory splashFactory = _InkSparkleFactory();
  static const InteractiveInkFeatureFactory constantTurbulenceSplashFactory = _InkSparkleFactory();
}

class _InkSparkleFactory extends InteractiveInkFeatureFactory {
  const _InkSparkleFactory();
}
