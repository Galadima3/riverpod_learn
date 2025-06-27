# 📱 Riverpod Learn App

A Flutter project showcasing practical usage of key provider types introduced in **Riverpod v2**. This app is intended as a learning resource for understanding state management in Flutter using Riverpod.

---

## 🧠 What You'll Learn

This project demonstrates how to use the following Riverpod providers:

- `Provider` – for exposing immutable values.
- `NotifierProvider` – for managing simple synchronous state with a class-based approach.
- `AsyncNotifierProvider` – for handling asynchronous state logic with loading/error states.
- `StreamNotifierProvider` – for reactive stream-based logic using class-based streams.
- `FutureProvider` – to expose and manage futures.
- `StreamProvider` – to expose and manage streams.

Each implementation is isolated and structured for clarity and reusability.

---

## 🚀 Getting Started

To run this project locally:

```bash
git clone https://github.com/your-username/riverpod-learn-app.git
cd riverpod-learn-app
flutter pub get
flutter run
```

Ensure Flutter is installed and up-to-date on your machine:  
📎 [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

---

## 📁 Project Structure

```bash
lib/
├── models/
│   ├── counter.dart
│   └── user_model.dart
│
├── presentation/
│   ├── custom_button.dart
│   └── home_page.dart
│
├── providers/
│   ├── async_notifier_demo.dart
│   ├── future_provider_demo.dart
│   ├── notifier_provider_demo.dart
│   ├── provider_demo.dart
│   ├── stream_notifier_demo.dart
│   └── stream_provider_demo.dart
│
└── main.dart
```

---

## 🛠 Resources for Beginners

- 📘 [Write Your First Flutter App](https://docs.flutter.dev/get-started/codelab)
- 🍳 [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- 📖 [Riverpod Official Docs](https://riverpod.dev)

---

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Fork the repo
- Create a new feature branch
- Submit a pull request to improve or expand on any provider example

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
