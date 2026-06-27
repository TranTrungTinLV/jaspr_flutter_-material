import 'package:jaspr/jaspr.dart' ;

import 'features/home/pages/home_page.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return const HomePage();
  }
}
