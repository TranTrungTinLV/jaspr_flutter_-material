<div align="center">

<!-- HERO BANNER -->
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:1a1a2e,50:16213e,100:0f3460&height=220&section=header&text=Jaspr%20Material%20Bridge&fontSize=48&fontColor=e94560&fontAlignY=38&desc=Flutter%20Material%20Design%20%E2%86%92%20Jaspr%20Web%20Framework&descSize=18&descColor=a8b2d8&descAlignY=60&animation=fadeIn"/>
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:667eea,50:764ba2,100:f64f59&height=220&section=header&text=Jaspr%20Material%20Bridge&fontSize=48&fontColor=ffffff&fontAlignY=38&desc=Flutter%20Material%20Design%20%E2%86%92%20Jaspr%20Web%20Framework&descSize=18&descColor=ffffffcc&descAlignY=60&animation=fadeIn" alt="Jaspr Material Bridge"/>
</picture>

<br/>

[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Jaspr](https://img.shields.io/badge/Jaspr-FF6B6B?style=for-the-badge&logo=dart&logoColor=white)](https://jaspr.site)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

<br/>

> **Viết UI như Flutter · Chạy thuần web qua Jaspr**
> 
> *Một lớp tương thích mạnh mẽ giúp Flutter Material Design hoạt động hoàn hảo trên nền tảng web.*

</div>

---

## ✨ Tổng Quan

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                   │
│   Flutter Widget API  ──────────►  Jaspr Material Bridge         │
│                                          │                        │
│   Container()                            ▼                        │
│   Padding()           ─────────►   HTML + CSS Native             │
│   ThemeData()                            │                        │
│   BorderRadius()                         ▼                        │
│                                    Trình duyệt Web               │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

Trong Flutter thuần, các widget được render xuống **Skia/Impeller Canvas**. Còn Jaspr thì render trực tiếp ra **HTML & CSS**. Đây là vấn đề cốt lõi mà **Jaspr Material Bridge** giải quyết:

<div align="center">

| 🎯 Vấn đề | ✅ Giải pháp |
|:---:|:---:|
| Flutter widgets không hiểu DOM | Bridge bọc HTML thành Flutter API |
| Namespace conflicts | Tách biệt hoàn toàn, zero conflict |
| Phải học lại Jaspr từ đầu | Giữ nguyên Flutter syntax quen thuộc |

</div>

---

## 🎯 Jaspr gốc khác gì với Dự án này?

Để hiểu rõ giá trị của dự án này, hãy so sánh:

**1. Jaspr (Của tác giả gốc - Kilian Schulte):**
Jaspr cung cấp "động cơ" (Engine) như Component, State, BuildContext. Tuy nhiên, Jaspr **KHÔNG CÓ** các widget giao diện quen thuộc của Flutter. Nếu dùng Jaspr thuần, bạn phải code giao diện bằng HTML:
```dart
// Code Jaspr thuần (Sử dụng HTML/CSS)
return div(
  styles: Styles.box(padding: EdgeInsets.all(16), backgroundColor: Color.hex('#FF0000')),
  [ text('Xin chào') ]
);
```
Điều này khiến các lập trình viên Flutter gặp khó khăn vì họ quen với Widget API.

**2. Jaspr Material Bridge (Dự án này):**
Đây là một **"Nội thất sang trọng" (UI Framework)** được đặt lên trên Jaspr. Dự án đem trọn vẹn bộ thư viện giao diện đồ sộ (Material Design) của Flutter và "lắp" nó vào Jaspr. 
Nhờ đó, lập trình viên có thể code y hệt như đang làm app Flutter:
```dart
// Code sử dụng Jaspr Material Bridge!
return Container(
  padding: const EdgeInsets.all(16.0),
  color: Colors.red,
  child: Text('Xin chào'),
);
```

Dự án này là một **cây cầu nối (Bridge)** hoàn hảo giúp bất kỳ đoạn code UI Flutter nào cũng có thể chạy thẳng lên trình duyệt web thông qua Jaspr mà không cần phải viết HTML! 🚀

---

## 🚀 Hướng Dẫn Sử Dụng

### Yêu Cầu Hệ Thống

```
✓ Dart SDK  ≥ 3.0.0
✓ Jaspr CLI (latest)
✓ Trình duyệt hiện đại (Chrome, Firefox, Safari, Edge)
```

### Cài Đặt Nhanh

```bash
# 1. Clone repo
git clone https://github.com/your-org/jaspr_flutter_ material.git
cd jaspr_flutter_ material

# 2. Cài dependencies
dart pub get

# 3. Chạy development server
jaspr serve
```

---

## ⚡ Lệnh CLI Quan Trọng

<div align="center">

```
╔══════════════════════════════════════════════════════════════╗
║                    JASPR CLI COMMANDS                        ║
╠══════════════════════════════════════════════════════════════╣
║  jaspr serve    │  Dev server + Hot Reload                   ║
║  jaspr build    │  Production build (Dart → JS)              ║
║  jaspr clean    │  Xóa cache, build sạch lại                 ║
╚══════════════════════════════════════════════════════════════╝
```

</div>

### 🔥 `jaspr serve` — Development Server

```bash
jaspr serve
```

Khởi chạy môi trường phát triển với **Hot-Reload** tích hợp:

```
🟢 Server đang chạy tại  http://localhost:8080
🔄 Hot-Reload bật sẵn    — lưu file là cập nhật ngay
📦 Build mode            — Development
```

> **💡 Mẹo:** Nếu gặp lỗi `Connecting to the build daemon... Shutting down`, hãy chạy:
> ```bash
> jaspr clean && jaspr serve
> ```

---

### 📦 `jaspr build` — Production Build

```bash
jaspr build
```

Biên dịch toàn bộ dự án cho production:

```
Step 1/3  ████████████░░  Compiling Dart → JavaScript (client)
Step 2/3  ████████████████  Bundling assets
Step 3/3  ████████████████  Generating server executable
✅ Build completed → ./build/
```

Output tạo ra gồm:
- `build/web/` — Static files cho client/browser
- `build/server` — Server executable tối ưu hiệu suất

---

### 🧹 `jaspr clean` — Dọn Dẹp Cache

```bash
jaspr clean
```

Xóa sạch các thư mục cache:

```
🗑  Removing build/         ✓
🗑  Removing .dart_tool/    ✓
✅  Workspace sạch, sẵn sàng build lại!
```

> Hữu ích khi gặp lỗi biên dịch kỳ lạ hoặc muốn build hoàn toàn từ đầu.

---

### 🛠 Các Lệnh Tiện Ích Khác

| Lệnh | Mô Tả |
|------|--------|
| `jaspr create` | Tạo một dự án Jaspr mới |
| `jaspr convert-html` | Chuyển HTML thô → Jaspr Components |
| `jaspr doctor` | Kiểm tra môi trường & dependencies |
| `jaspr update` | Cập nhật Jaspr CLI lên phiên bản mới nhất |

---

## Cấu Trúc Dự Án

```
jaspr_flutter_ material/
│
├── 📁 lib/
│   ├── 📁 shared/
│   │   └── 📁 components/          ← TRÁI TIM CỦA DỰ ÁN
│   │       ├── container.dart      # Container widget → <div>
│   │       ├── padding.dart        # Padding widget → CSS padding
│   │       ├── theme_data.dart     # ThemeData → CSS variables
│   │       ├── border_radius.dart  # BorderRadius → border-radius
│   │       └── ...                 # Các widget khác
│   │
│   ├── 📄 app.dart                 # Root component
│   └── 📄 main.dart                # Entry point
│
├── 📁 web/                         # Static web assets
├── 📄 pubspec.yaml                 # Dependencies
└── 📄 README.md
```

### Thư Mục `lib/shared/components/`

Đây là **trái tim của dự án** — nơi mỗi Flutter widget được tái tạo thành một Jaspr Component thuần HTML:

```dart
// Flutter gốc                    // Jaspr Material Bridge
Container(                  →     div(styles: Styles.box(
  color: Colors.blue,               color: Color.named('blue'),
  padding: EdgeInsets.all(16),      padding: EdgeInsets.all(16),
  child: Text('Hello'),           ), [text('Hello')])
)
```

API **giống hệt Flutter** nhưng render ra **HTML/CSS chuẩn**.

---

## 🔧 Ví Dụ Nhanh

```dart
import 'package:my_website_flutter/shared/components/components.dart';

class MyPage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Hello từ Jaspr Material Bridge! 🎉',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
}
```

---

## 👨‍💻 Tác Giả & Lời Cảm Ơn (Authors & Acknowledgements)

**Phát triển dự án & Xây dựng Bridge:**
* **Tên:** TranTrungTinLV (aka Vi)
* **Email:** [trantintin1989@gmail.com](mailto:trantintin1989@gmail.com)
* **GitHub:** [@TranTrungTinLV](https://github.com/TranTrungTinLV)

**Tôn trọng & Tri ân các tác giả gốc (Original Authors):**
Dự án này sẽ không thể thành hiện thực nếu không có nền tảng tuyệt vời từ các tác giả đi trước. Xin trân trọng cảm ơn:
* **Đội ngũ Flutter (Google):** Đã tạo ra Material Design và kiến trúc Widget API tuyệt đỉnh. Các widget trong thư mục `lib/shared/components` được kế thừa và mô phỏng trực tiếp từ mã nguồn gốc của Flutter.
* **Kilian Schulte ([@schultek](https://github.com/schultek)):** Tác giả của framework [Jaspr](https://github.com/schultek/jaspr), nền tảng cốt lõi giúp mang tư duy Flutter lên Web một cách mạnh mẽ.

---

## 🤝 Đóng Góp

Mọi Pull Request đều được chào đón! Xem [CONTRIBUTING.md](CONTRIBUTING.md) để bắt đầu.

```bash
# Fork repo, rồi:
git checkout -b feature/ten-tinh-nang-moi
# ... code xong ...
git push origin feature/ten-tinh-nang-moi
# Mở Pull Request 🚀
```

---

<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://capsule-render.vercel.app/api?type=waving&color=0:1a1a2e,50:16213e,100:0f3460&height=100&section=footer"/>
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:667eea,50:764ba2,100:f64f59&height=100&section=footer" alt="footer"/>
</picture>

**Được xây dựng với ❤️ bằng Dart & Jaspr**

*"Viết một lần, chạy mọi nơi — giờ đây trên cả Web."*

</div>
