import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import '../model/bugger_model.dart';
import '../provider/provider.dart';

class Bugger {

  static final Bugger instance = Bugger._internal();
  bool _isInitialized = false;

  Bugger._internal();

  factory Bugger() {
    return instance;
  }

  /// Call this in your `main()` before using Bugger.
  String initialized() {
    _isInitialized = true;
    var init = "✅ Bugger is initialized and ready to report bugs.";
    debugPrint(init);
    return init;
  }

  /// Save records only if initialized, else show warning
  Future<String> insert({required BuggerModel payload}) async {
    if (!_isInitialized) {
      return "⚠️ Bugger is not initialized. Please call `Bugger().initialized()` in main() before using.";
    }
    try {
      final response = await Provider.instance.insert(payload: payload);
      if (response.statusCode == 200) {
        final catcher = jsonDecode(response.body)['message'];
        return catcher.toString();
      }
      final catcher = jsonDecode(response.body)['message'];
      return catcher.toString();
    } catch (e, trace) {
      log('trace: $e, $trace');
      throw ('🔥Bugger $e \n$trace');
    }
  }
}
