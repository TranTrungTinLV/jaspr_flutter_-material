import 'package:jaspr/server.dart';
import 'app.dart';

// Trong các bản Jaspr mới nhất, file options được gộp chung.
// Nếu trình dịch yêu cầu file options, ta sẽ import nó. 
// Nếu không, ta cứ khởi chạy mặc định.
void main() {
  Jaspr.initializeApp();

  runApp(Document(
    title: 'My Jaspr App',
    body: const App(),
  ));
}
