import 'button_style.dart';
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;
import 'mock_types.dart';

typedef WidgetBuilder = Component Function(BuildContext context);

abstract class InheritedWidget extends InheritedComponent {
  const InheritedWidget({super.key, required Component child}) : super(child: child);
  bool updateShouldNotify(covariant InheritedWidget oldWidget);
}

class FloatingActionButtonLocation {}

class FloatingActionButtonAnimator {}



class FloatingActionButtonThemeData {
  const FloatingActionButtonThemeData({this.backgroundColor, this.foregroundColor});
  final dynamic backgroundColor;
  final dynamic foregroundColor;
  static FloatingActionButtonThemeData lerp(FloatingActionButtonThemeData? a, FloatingActionButtonThemeData? b, double t) => a ?? const FloatingActionButtonThemeData();
}

class DrawerThemeData {
  const DrawerThemeData();
  static DrawerThemeData lerp(DrawerThemeData? a, DrawerThemeData? b, double t) => a ?? const DrawerThemeData();
}


class ScrollbarThemeData {
  const ScrollbarThemeData();
  static ScrollbarThemeData lerp(ScrollbarThemeData? a, ScrollbarThemeData? b, double t) => a ?? const ScrollbarThemeData();
}

class BottomAppBarTheme {
  const BottomAppBarTheme();
}

class NavigationBarThemeData {
  const NavigationBarThemeData();
  static NavigationBarThemeData lerp(NavigationBarThemeData? a, NavigationBarThemeData? b, double t) => a ?? const NavigationBarThemeData();
}

class NavigationRailThemeData {
  const NavigationRailThemeData();
  static NavigationRailThemeData lerp(NavigationRailThemeData? a, NavigationRailThemeData? b, double t) => a ?? const NavigationRailThemeData();
}

class CupertinoThemeData {
  const CupertinoThemeData({Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll, Color? selectionHandleColor});
  const CupertinoThemeData.raw(Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll, Color? selectionHandleColor);
  dynamic get primaryColor => null;
  Brightness get brightness => Brightness.light;
  dynamic get primaryContrastingColor => null;
  CupertinoThemeData copyWith({Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll, Color? selectionHandleColor}) => this;
  NoDefaultCupertinoThemeData noDefault() => const NoDefaultCupertinoThemeData();
}



class DialogTheme {
  const DialogTheme();
}





class RadioThemeData {
  const RadioThemeData();
  static RadioThemeData lerp(RadioThemeData? a, RadioThemeData? b, double t) => a ?? const RadioThemeData();
}

class SwitchThemeData {
  const SwitchThemeData();
  static SwitchThemeData lerp(SwitchThemeData? a, SwitchThemeData? b, double t) => a ?? const SwitchThemeData();
}

class SliderThemeData {
  const SliderThemeData();
  static SliderThemeData lerp(SliderThemeData? a, SliderThemeData? b, double t) => a ?? const SliderThemeData();
}



class PopupMenuThemeData {
  const PopupMenuThemeData();
  static PopupMenuThemeData lerp(PopupMenuThemeData? a, PopupMenuThemeData? b, double t) => a ?? const PopupMenuThemeData();
}



class SnackBarThemeData {
  const SnackBarThemeData();
  static SnackBarThemeData lerp(SnackBarThemeData? a, SnackBarThemeData? b, double t) => a ?? const SnackBarThemeData();
}

class TooltipThemeData {
  const TooltipThemeData();
  static TooltipThemeData lerp(TooltipThemeData? a, TooltipThemeData? b, double t) => a ?? const TooltipThemeData();
}



class ListTileThemeData {
  const ListTileThemeData();
  static ListTileThemeData lerp(ListTileThemeData? a, ListTileThemeData? b, double t) => a ?? const ListTileThemeData();
}

class OutlinedButtonThemeData {
  const OutlinedButtonThemeData({this.style});
  final ButtonStyle? style;
  static OutlinedButtonThemeData lerp(OutlinedButtonThemeData? a, OutlinedButtonThemeData? b, double t) => a ?? const OutlinedButtonThemeData();
}

class TextButtonThemeData {
  const TextButtonThemeData({this.style});
  final ButtonStyle? style;
  static TextButtonThemeData lerp(TextButtonThemeData? a, TextButtonThemeData? b, double t) => a ?? const TextButtonThemeData();
}

class ElevatedButtonThemeData {
  const ElevatedButtonThemeData({this.style});
  final ButtonStyle? style;
  static ElevatedButtonThemeData lerp(ElevatedButtonThemeData? a, ElevatedButtonThemeData? b, double t) => a ?? const ElevatedButtonThemeData();
}

class FilledButtonThemeData {
  const FilledButtonThemeData({this.style});
  final ButtonStyle? style;
  static FilledButtonThemeData lerp(FilledButtonThemeData? a, FilledButtonThemeData? b, double t) => a ?? const FilledButtonThemeData();
}

class ToggleButtonsThemeData {
  const ToggleButtonsThemeData();
  static ToggleButtonsThemeData lerp(ToggleButtonsThemeData? a, ToggleButtonsThemeData? b, double t) => a ?? const ToggleButtonsThemeData();
}

class SegmentedButtonThemeData {
  const SegmentedButtonThemeData();
  static SegmentedButtonThemeData lerp(SegmentedButtonThemeData? a, SegmentedButtonThemeData? b, double t) => a ?? const SegmentedButtonThemeData();
}

class ProgressIndicatorThemeData {
  const ProgressIndicatorThemeData();
  static ProgressIndicatorThemeData lerp(ProgressIndicatorThemeData? a, ProgressIndicatorThemeData? b, double t) => a ?? const ProgressIndicatorThemeData();
}







class TimePickerThemeData {
  const TimePickerThemeData();
  static TimePickerThemeData lerp(TimePickerThemeData? a, TimePickerThemeData? b, double t) => a ?? const TimePickerThemeData();
}

class DropdownMenuThemeData {
  const DropdownMenuThemeData();
  static DropdownMenuThemeData lerp(DropdownMenuThemeData? a, DropdownMenuThemeData? b, double t) => a ?? const DropdownMenuThemeData();
}

class DrawerTheme {
  const DrawerTheme();
  static DrawerTheme lerp(DrawerTheme? a, DrawerTheme? b, double t) => a ?? const DrawerTheme();
}

class MenuThemeData {
  const MenuThemeData();
  static MenuThemeData lerp(MenuThemeData? a, MenuThemeData? b, double t) => a ?? const MenuThemeData();
}

class MenuBarThemeData {
  const MenuBarThemeData();
  static MenuBarThemeData lerp(MenuBarThemeData? a, MenuBarThemeData? b, double t) => a ?? const MenuBarThemeData();
}

class MenuButtonThemeData {
  const MenuButtonThemeData();
  static MenuButtonThemeData lerp(MenuButtonThemeData? a, MenuButtonThemeData? b, double t) => a ?? const MenuButtonThemeData();
}

enum TargetPlatform {
  android,
  fuchsia,
  iOS,
  linux,
  macOS,
  windows,
}

const TargetPlatform defaultTargetPlatform = TargetPlatform.android;



class FocusNode {}


class ElevatedButton { static ButtonStyle styleFrom({dynamic style, dynamic foregroundColor, dynamic backgroundColor, dynamic disabledForegroundColor, dynamic disabledBackgroundColor, dynamic shadowColor, dynamic surfaceTintColor, dynamic elevation, dynamic textStyle, dynamic padding, dynamic minimumSize, dynamic fixedSize, dynamic maximumSize, dynamic side, dynamic shape, dynamic mouseCursor, dynamic visualDensity, dynamic tapTargetSize, dynamic animationDuration, dynamic enableFeedback, dynamic alignment, dynamic splashFactory}) => const ButtonStyle(); }
class TextButton { static ButtonStyle styleFrom({dynamic style, dynamic foregroundColor, dynamic backgroundColor, dynamic disabledForegroundColor, dynamic disabledBackgroundColor, dynamic shadowColor, dynamic surfaceTintColor, dynamic elevation, dynamic textStyle, dynamic padding, dynamic minimumSize, dynamic fixedSize, dynamic maximumSize, dynamic side, dynamic shape, dynamic mouseCursor, dynamic visualDensity, dynamic tapTargetSize, dynamic animationDuration, dynamic enableFeedback, dynamic alignment, dynamic splashFactory}) => const ButtonStyle(); }
class OutlinedButton { static ButtonStyle styleFrom({dynamic style, dynamic foregroundColor, dynamic backgroundColor, dynamic disabledForegroundColor, dynamic disabledBackgroundColor, dynamic shadowColor, dynamic surfaceTintColor, dynamic elevation, dynamic textStyle, dynamic padding, dynamic minimumSize, dynamic fixedSize, dynamic maximumSize, dynamic side, dynamic shape, dynamic mouseCursor, dynamic visualDensity, dynamic tapTargetSize, dynamic animationDuration, dynamic enableFeedback, dynamic alignment, dynamic splashFactory}) => const ButtonStyle(); }
class FilledButton { static ButtonStyle styleFrom({dynamic style, dynamic foregroundColor, dynamic backgroundColor, dynamic disabledForegroundColor, dynamic disabledBackgroundColor, dynamic shadowColor, dynamic surfaceTintColor, dynamic elevation, dynamic textStyle, dynamic padding, dynamic minimumSize, dynamic fixedSize, dynamic maximumSize, dynamic side, dynamic shape, dynamic mouseCursor, dynamic visualDensity, dynamic tapTargetSize, dynamic animationDuration, dynamic enableFeedback, dynamic alignment, dynamic splashFactory}) => const ButtonStyle(); }

enum StandardComponentType {
  backButton,
  closeButton,
  drawerButton,
  endDrawerButton;
  
  Key get key => Key(name);
}

class WidgetStateProperty<T> {
  const WidgetStateProperty();
  static WidgetStateProperty<T> resolveWith<T>(T Function(Set<WidgetState>) callback) => throw UnimplementedError();
  static WidgetStateProperty<T?>? lerp<T>(WidgetStateProperty<T>? a, WidgetStateProperty<T>? b, double t, T? Function(T?, T?, double) lerpFunction) => a;
  T resolve(Set<WidgetState> states) => throw UnimplementedError();
  static WidgetStateProperty<T> all<T>(T value) => WidgetStatePropertyAll<T>(value);
}

class WidgetStatePropertyAll<T> extends WidgetStateProperty<T> {
  final T value;
  const WidgetStatePropertyAll(this.value);
  @override T resolve(Set<WidgetState> states) => value;
}

enum WidgetState {
  hovered, focused, pressed, dragged, selected, scrolledUnder, disabled, error
}

class MouseCursor {
  const MouseCursor();
}

class WidgetStateBorderSide extends WidgetStateProperty<BorderSide?> {
  @override BorderSide? resolve(Set<WidgetState> states) => null;
}

class InputDecorationTheme {
  const InputDecorationTheme();
  dynamic get data => null;
}

class InputDecorationThemeData {
  dynamic get labelStyle => null;

  dynamic get counterStyle => null;

  dynamic get suffixStyle => null;

  dynamic get helperStyle => null;

  dynamic get prefixStyle => null;

  dynamic get hintStyle => null;

  InputDecorationThemeData copyWith({dynamic fillColor, dynamic labelStyle, dynamic hintStyle, dynamic helperStyle, dynamic prefixStyle, dynamic suffixStyle, dynamic counterStyle}) => this;
  const InputDecorationThemeData();
  static InputDecorationThemeData lerp(InputDecorationThemeData? a, InputDecorationThemeData? b, double t) => a ?? const InputDecorationThemeData();
}

class Locale {
  final String languageCode;
  final String? countryCode;
  const Locale(this.languageCode, [this.countryCode]);
}

class ImageProvider {
  const ImageProvider();
  ImageStream resolve(dynamic configuration) => const ImageStream();
}

class ImageConfiguration {
  const ImageConfiguration({this.bundle, this.devicePixelRatio, this.locale, this.textDirection, this.size, this.platform});
  final dynamic bundle;
  final double? devicePixelRatio;
  final Locale? locale;
  final TextDirection? textDirection;
  final Size? size;
  final TargetPlatform? platform;
}

class ImageStream {
  const ImageStream();
  void addListener(ImageStreamListener listener) {}
  void removeListener(ImageStreamListener listener) {}
}

class ImageStreamListener {
  const ImageStreamListener(void Function(ImageInfo, bool) onImage, {void Function(dynamic, StackTrace?)? onError});
}

class ImageInfo {
  dynamic get image => null;

  const ImageInfo();
}

enum DecorationPosition {
  background, foreground
}

class Brightness { const Brightness(); static const Brightness dark = Brightness(); static const Brightness light = Brightness(); }
class TextDecoration { const TextDecoration(); static const TextDecoration none = TextDecoration(); static const TextDecoration underline = TextDecoration(); static const TextDecoration overline = TextDecoration(); static const TextDecoration lineThrough = TextDecoration(); }
class TextDecorationStyle { const TextDecorationStyle(); }
class FontWeight { const FontWeight(); static const FontWeight w100 = FontWeight(); static const FontWeight w200 = FontWeight(); static const FontWeight w300 = FontWeight(); static const FontWeight w800 = FontWeight(); static const FontWeight w900 = FontWeight(); static const FontWeight w400 = FontWeight(); static const FontWeight w500 = FontWeight(); static const FontWeight w600 = FontWeight(); static const FontWeight w700 = FontWeight(); static const FontWeight bold = FontWeight(); static const FontWeight normal = FontWeight(); }
class TextLeadingDistribution { const TextLeadingDistribution(); static const TextLeadingDistribution even = TextLeadingDistribution(); static const TextLeadingDistribution proportional = TextLeadingDistribution(); }
class TextSelectionThemeData {
  const TextSelectionThemeData();
  static TextSelectionThemeData lerp(a,b,t) => a ?? const TextSelectionThemeData();
  dynamic get selectionHandleColor => null;
}
class TabBarThemeData { const TabBarThemeData(); static TabBarThemeData lerp(a,b,t) => a ?? const TabBarThemeData(); }
class SearchViewThemeData { const SearchViewThemeData(); static SearchViewThemeData lerp(a,b,t) => a ?? const SearchViewThemeData(); }
class SearchBarThemeData { const SearchBarThemeData(); static SearchBarThemeData lerp(a,b,t) => a ?? const SearchBarThemeData(); }
class NoDefaultCupertinoThemeData extends CupertinoThemeData {
  const NoDefaultCupertinoThemeData();
  @override NoDefaultCupertinoThemeData noDefault() => this;
  @override NoDefaultCupertinoThemeData copyWith({Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll, Color? selectionHandleColor}) => this;
  dynamic get textTheme => null;
  dynamic get selectionHandleColor => null;
  dynamic get scaffoldBackgroundColor => null;
  dynamic get primaryContrastingColor => null;
  dynamic get primaryColor => null;
  dynamic get barBackgroundColor => null;
  Brightness get brightness => Brightness.light;
  dynamic get applyThemeToAll => null;
  dynamic resolveFrom(dynamic context) => this;
}

class NavigationDrawerThemeData { const NavigationDrawerThemeData(); static NavigationDrawerThemeData lerp(a,b,t) => a ?? const NavigationDrawerThemeData(); }
class IconButtonThemeData { const IconButtonThemeData({this.style}); final ButtonStyle? style; static IconButtonThemeData lerp(a,b,t) => a ?? const IconButtonThemeData(); }
class FontStyle { const FontStyle(); static const FontStyle italic = FontStyle(); static const FontStyle normal = FontStyle(); }
class ExpansionTileThemeData { const ExpansionTileThemeData(); static ExpansionTileThemeData lerp(a,b,t) => a ?? const ExpansionTileThemeData(); }
class CupertinoTextThemeData { const CupertinoTextThemeData(); }



class TextOverflow { const TextOverflow(); static const TextOverflow ellipsis = TextOverflow(); }

class Directionality { static dynamic maybeOf(dynamic context) => null; }




