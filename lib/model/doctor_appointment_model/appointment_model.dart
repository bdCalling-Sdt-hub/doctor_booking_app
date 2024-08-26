// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

List<AppointmentModel> appointmentModelFromJson(String str) =>
    List<AppointmentModel>.from(
        json.decode(str).map((x) => AppointmentModel.fromJson(x)));

String appointmentModelToJson(List<AppointmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentModel {
  String? id;
  String? name;
  String? doctorId;
  UserId? userId;
  DateTime? date;
  String? time;
  String? day;
  String? status;
  String? reason;
  String? desc;
  List<dynamic>? prescription;
  bool? review;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  AppointmentModel({
    this.id,
    this.name,
    this.doctorId,
    this.userId,
    this.date,
    this.time,
    this.day,
    this.status,
    this.reason,
    this.desc,
    this.prescription,
    this.review,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        id: json["_id"],
        name: json["name"],
        doctorId: json["doctorId"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        day: json["day"],
        status: json["status"],
        reason: json["reason"],
        desc: json["desc"],
        prescription: json["prescription"] == null
            ? []
            : List<dynamic>.from(json["prescription"]!.map((x) => x)),
        review: json["review"],
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
        "name": name,
        "doctorId": doctorId,
        "userId": userId?.toJson(),
        "date": date?.toIso8601String(),
        "time": time,
        "day": day,
        "status": status,
        "reason": reason,
        "desc": desc,
        "prescription": prescription == null
            ? []
            : List<dynamic>.from(prescription!.map((x) => x)),
        "review": review,
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
