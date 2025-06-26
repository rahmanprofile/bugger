# 🐞 Bugger

**Bugger** is a beautiful and developer-friendly logging utility for Flutter that formats logs in a clean, table-style view in the console. It helps identify exactly where the error occurred — file name, method, line number — with colors and optional body content.

> 🧪 Bugger logs only appear in `kDebugMode`. Silent in production (release) builds.

---

## ✨ Features

- ✅ Clean console output with table formatting
- 📍 Auto-detects file name, method name, line number, and source location
- 🌈 Colored output (green, yellow, red for info/warning/error)
- 📦 Silent in production (`kReleaseMode`)
- 🌐 GitHub link support (for contributing/open-source context)
- 🔄 Long lines auto-wrap for readability

---

## 🚀 Getting Started

### Add to your `pubspec.yaml`:

```yaml
dependencies:
  bugger: ^0.0.1
