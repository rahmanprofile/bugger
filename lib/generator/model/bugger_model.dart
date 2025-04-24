import 'dart:convert';
import 'package:bugger/generator/model/device_model.dart';

BuggerModel buggerModelFromJson(String str) => BuggerModel.fromJson(json.decode(str));

String buggerModelToJson(BuggerModel data) => json.encode(data.toJson());

class BuggerModel {
  final String projectName;
  final String type;
  final String name;
  final int statusCode;
  final DateTime timestamp;
  final String userId;
  final String file;
  final int line;
  final DeviceModel device;

  BuggerModel({
    required this.projectName,
    required this.type,
    required this.name,
    required this.statusCode,
    required this.timestamp,
    required this.userId,
    required this.file,
    required this.device,
    required this.line,
  });

  factory BuggerModel.fromJson(Map<String, dynamic> json) => BuggerModel(
        projectName: json["projectName"],
        type: json["type"],
        name: json["name"],
        statusCode: json["statusCode"],
        timestamp: DateTime.parse(json["timestamp"]),
        userId: json["userId"],
        file: json["file"],
        line: json["line"],
        device: json['device'],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "projectName": projectName,
        "name": name,
        "statusCode": statusCode,
        "timestamp": timestamp.toIso8601String(),
        "userId": userId,
        "file": file,
        "line": line,
        "device": device,
      };
}
