// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromMap(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromMap(String str) =>
    WeatherModel.fromMap(json.decode(str));

String weatherModelToMap(WeatherModel data) => json.encode(data.toMap());

class WeatherModel {
  WeatherModel({
    this.tempC,
    this.tempF,
    this.condition,
  });

  double? tempC;
  double? tempF;
  Condition? condition;

  factory WeatherModel.fromMap(Map<String, dynamic> json) => WeatherModel(
        tempC: json["temp_c"] == null ? null : json["temp_c"].toDouble(),
        tempF: json["temp_f"] == null ? null : json["temp_f"].toDouble(),
        condition: json["condition"] == null
            ? null
            : Condition.fromMap(json["condition"]),
      );

  Map<String, dynamic> toMap() => {
        "temp_c": tempC == null ? null : tempC,
        "temp_f": tempF == null ? null : tempF,
        "condition": condition == null ? null : condition!.toMap(),
      };
}

class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;

  factory Condition.fromMap(Map<String, dynamic> json) => Condition(
        text: json["text"] == null ? null : json["text"],
        icon: json["icon"] == null ? null : json["icon"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toMap() => {
        "text": text == null ? null : text,
        "icon": icon == null ? null : icon,
        "code": code == null ? null : code,
      };
}
