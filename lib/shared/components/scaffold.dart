import 'package:jaspr/dom.dart' hide Radius, BorderRadius, BoxShadow, Color, Padding, Transform, Border, Text, Shadow, Offset, VoidCallback;
import 'package:jaspr/dom.dart' as dom;
import 'package:jaspr/jaspr.dart' hide Padding, Transform, Color, Border, BorderRadius, Text;

import 'mock_types.dart';

class ScaffoldState {
  void openDrawer() {}
  void openEndDrawer() {}
}

class Scaffold extends StatelessComponent {
  static ScaffoldState of(BuildContext context) => ScaffoldState();
  const Scaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  final PreferredSizeWidget? appBar;
  final Component? body;
  final Component? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Component>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Component? drawer;
  final DrawerCallback? onDrawerChanged;
  final Component? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Component? bottomNavigationBar;
  final Component? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;

  @override
  Component build(BuildContext context) {
    return div(
      styles: Styles(
        display: Display.flex, // Default scaffold background in Flutter
        position: Position.relative(),
        width: 100.vw,
        height: 100.vh,
        overflow: Overflow.hidden,
        flexDirection: FlexDirection.column,
        backgroundColor: backgroundColor?.toJasprColor() ?? dom.Color('#FAFAFA'),
      ),
      [
        // AppBar
        if (appBar != null) appBar! as Component,

        // Body (flexible to fill remaining space)
        div(
          styles: Styles(
            position: Position.relative(),
            overflow: Overflow.only(x: OverflowValue.hidden, y: OverflowValue.auto),
            flex: Flex(basis: Unit.zero, grow: 1, shrink: 1),
          ),
          [if (body != null) body!],
        ),

        // Bottom Navigation Bar
        if (bottomNavigationBar != null) bottomNavigationBar!,

        // Floating Action Button (Positioned absolutely)
        if (floatingActionButton != null)
          div(
            styles: Styles(
              position: Position.absolute(bottom: Unit.pixels(16.0), right: Unit.pixels(16.0)),
              zIndex: ZIndex(1000),
            ),
            [floatingActionButton!],
          ),
      ],
    );
  }
}
