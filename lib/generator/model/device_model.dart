import 'dart:convert';

DeviceModel deviceModelFromJson(String str) => DeviceModel.fromJson(json.decode(str));

String deviceModelToJson(DeviceModel data) => json.encode(data.toJson());

class DeviceModel {
  final String brand;
  final String model;
  final String androidVersion;
  final int sdkInt;
  final String manufacturer;
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  DeviceModel({
    required this.brand,
    required this.model,
    required this.androidVersion,
    required this.sdkInt,
    required this.manufacturer,
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    brand: json["brand"],
    model: json["model"],
    androidVersion: json["androidVersion"],
    sdkInt: json["sdkInt"],
    manufacturer: json["manufacturer"],
    appName: json["appName"],
    packageName: json["packageName"],
    version: json["version"],
    buildNumber: json["buildNumber"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "model": model,
    "androidVersion": androidVersion,
    "sdkInt": sdkInt,
    "manufacturer": manufacturer,
    "appName": appName,
    "packageName": packageName,
    "version": version,
    "buildNumber": buildNumber,
  };
}
