import 'package:bugger/bugger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

class BuggerDemo extends StatefulWidget {
  const BuggerDemo({super.key});

  @override
  State<BuggerDemo> createState() => _BuggerDemoState();
}

class _BuggerDemoState extends State<BuggerDemo> {
  void triggerBuggerLog() {
    Bugger.log("🚨 Trigger a debug log using Bugger");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐞 Bugger Log Demo'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: triggerBuggerLog,
          icon: const Icon(Icons.bug_report_outlined),
          label: const Text('Trigger Bugger Log'),
        ),
      ),
    );
  }
}
