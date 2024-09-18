// To parse this JSON data, do
//
//     final doctorCallHistoryModel = doctorCallHistoryModelFromJson(jsonString);

import 'dart:convert';

DoctorCallHistoryModel doctorCallHistoryModelFromJson(String str) =>
    DoctorCallHistoryModel.fromJson(json.decode(str));

class DoctorCallHistoryModel {
  String? id;
  RId? doctorId;
  RId? userId;
  String? createdAt;
  String? updatedAt;
  int? v;

  DoctorCallHistoryModel({
    this.id,
    this.doctorId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DoctorCallHistoryModel.fromJson(Map<String, dynamic> json) =>
      DoctorCallHistoryModel(
        id: json["_id"],
        doctorId:
            json["doctorId"] == null ? null : RId.fromJson(json["doctorId"]),
        userId: json["userId"] == null ? null : RId.fromJson(json["userId"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );
}

class RId {
  String? id;
  String? img;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? specialization;
  int? age;

  RId({
    this.id,
    this.img,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.specialization,
    this.age,
  });

  factory RId.fromJson(Map<String, dynamic> json) => RId(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        specialization: json["specialization"],
        age: json["age"] ?? 0,
      );
}
