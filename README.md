# 🐞 Bugger

The best Flutter package for logging in a developer-friendly, table-style console layout.  
Elegant, colorful, and ideal for debugging with file, method, and line-level precision.

[![pub package](https://img.shields.io/pub/v/bugger.svg)](https://pub.dev/packages/bugger)
![Pub Points](https://img.shields.io/pub/points/bugger)
![Likes](https://img.shields.io/pub/likes/bugger)
[![GitHub Repo](https://img.shields.io/badge/github-rahmanprofile%2Fbugger-blue?logo=github)](https://github.com/rahmanprofile/bugger)

---

### 🧪 Sample Bugger Output

```console
╔════════════╦════════════════════════════════════════════════════════════════════╗
║ Field      ║ Value - [Bugger Detection]                                         ║
╠════════════╬════════════════════════════════════════════════════════════════════╣
║ 📍 Issue   ║ ☢️ This is a debug log using Bugger!                               ║
║ 📄 File    ║ main.dart                                                          ║
║ 📌 Line    ║ 32                                                                 ║
║ 🔧 Method  ║ [_triggerBuggerLog]                                                ║
║ 🔗 Location║ package:example/main.dart : At line - 32                           ║
║ 🌐 GitHub  ║ https://github.com/rahmanprofile/bugger.git                        ║
╚════════════╩════════════════════════════════════════════════════════════════════╝

## ✨ Features

- 🧾 Clean console output with **table formatting**
- 🧠 Auto-detects file name, method name, line and column number
- 🌈 Color-coded messages (`Info`, `Warning`, `Error`)
- 🚫 Logs only in `kDebugMode` — silent in release builds
- 🔗 GitHub source linking (optional)
- 📊 GitHub user score support (Repos, Followers, Contributions)
- 🔄 Long lines **auto-wrap** for better console readability
- 💡 Easy to use with optional tags, stack traces, and callbacks

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  bugger: ^0.0.3
