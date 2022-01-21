// To parse this JSON data, do
//
//     final contactModel = contactModelFromMap(jsonString);

import 'dart:convert';

InquiryModel contactModelFromMap(String str) =>
    InquiryModel.fromJson(json.decode(str));

String contactModelToMap(InquiryModel data) => json.encode(data.toJson());

class InquiryModel {
  InquiryModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.message,
    this.createdAt,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  String? message;
  dynamic createdAt;

  factory InquiryModel.fromJson(Map<String, dynamic> json) => InquiryModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"] == null ? null : json["phone"],
        message: json["message"] == null ? null : json["message"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "message": message == null ? null : message,
        "createdAt": createdAt == null ? null : createdAt,
      };
}
