// To parse this JSON data, do
//
//     final doctorNotificationModel = doctorNotificationModelFromJson(jsonString);

import 'dart:convert';

DoctorNotificationModel doctorNotificationModelFromJson(String str) =>
    DoctorNotificationModel.fromJson(json.decode(str));

String doctorNotificationModelToJson(DoctorNotificationModel data) =>
    json.encode(data.toJson());

class DoctorNotificationModel {
  String? id;
  String? title;
  String? body;
  String? appointmentId;
  UserId? userId;
  String? doctorId;
  bool? isRead;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  DoctorNotificationModel({
    this.id,
    this.title,
    this.body,
    this.appointmentId,
    this.userId,
    this.doctorId,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DoctorNotificationModel.fromJson(Map<String, dynamic> json) =>
      DoctorNotificationModel(
        id: json["_id"],
        title: json["title"],
        body: json["body"],
        appointmentId: json["appointmentId"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        doctorId: json["doctorId"],
        isRead: json["isRead"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "body": body,
        "appointmentId": appointmentId,
        "userId": userId?.toJson(),
        "doctorId": doctorId,
        "isRead": isRead,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class UserId {
  String? id;
  String? name;
  String? email;
  String? location;
  String? phone;

  UserId({
    this.id,
    this.name,
    this.email,
    this.location,
    this.phone,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
      };
}
