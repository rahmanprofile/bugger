import 'dart:convert';
import '../model/bugger_model.dart';
import 'package:http/http.dart' as http;

class Provider {

  Provider._privateConstructor();
  static final Provider instance = Provider._privateConstructor();

  Future<http.Response> insert({required BuggerModel payload}) async {
    final response = await http.post(Uri.parse(''),
      body: jsonEncode(payload.toJson()),
      headers: { "Content-Type": "application/json" }
    );
    return response;
  }

}

