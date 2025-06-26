import 'package:bugger/bugger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget for the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bugger Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BuggerDemo(),
    );
  }
}

/// Demo page that triggers Bugger logging
class BuggerDemo extends StatelessWidget {
  const BuggerDemo({super.key});

  /// Call this to log styled debug output using Bugger
  void _triggerBuggerLog() {
    Bugger.log("🐞 This is a debug log using Bugger!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🐞 Bugger Log Demo')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _triggerBuggerLog, // 👈 Trigger log when pressed
          icon: const Icon(Icons.bug_report_outlined),
          label: const Text('Trigger Bugger Log'),
        ),
      ),
    );
  }
}
