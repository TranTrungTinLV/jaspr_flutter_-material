import 'package:jaspr/jaspr.dart' hide Colors;
import 'package:my_website_flutter/shared/components/app_bar.dart';
import 'package:my_website_flutter/shared/components/colors.dart';
import 'package:my_website_flutter/shared/components/container.dart';
import 'package:my_website_flutter/shared/components/list_view.dart';
import 'package:my_website_flutter/shared/components/material.dart';
import 'package:my_website_flutter/shared/components/mock_types.dart';
import 'package:my_website_flutter/shared/components/scaffold.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFlutter("Jaspr x Flutter API"),
        backgroundColor: Colors.white,
        elevation: 4.0,
      ),
      body: MaterialApp(
        color: Color(0xFFF5F5F5),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFlutter("Xin chào, đây là Scaffold y chang Flutter!"),
                  TextFlutter("Với AppBar và Material được tái tạo hoàn toàn chuẩn xác."),
                  TextFlutter("Cuộn thử danh sách này nhé!"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Center(
          child: TextFlutter("+", style: TextStyle(color: Color(0xFFFFFFFF))),
        ),
      ),
    );
  }
}
