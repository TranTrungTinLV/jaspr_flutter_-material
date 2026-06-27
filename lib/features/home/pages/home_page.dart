import 'package:my_website_flutter/shared/components/material.dart';
import 'package:my_website_flutter/shared/components/mock_types.dart';
import 'package:my_website_flutter/shared/components/scaffold.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff0000FF),
      body: MaterialApp(),
    );
  }
}
