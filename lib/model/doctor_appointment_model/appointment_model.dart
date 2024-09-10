// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) =>
    AppointmentModel.fromJson(json.decode(str));

class AppointmentModel {
  String? id;
  String? name;
  String? doctorId;
  UserId? userId;
  String? date;
  String? time;
  String? day;
  String? status;
  String? reason;
  String? appointmentType;
  String? desc;
  List<String>? prescription;
  bool? review;
  String? notes;
  bool? reSchedule;
  bool? paymentStatus;
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
    this.appointmentType,
    this.desc,
    this.prescription,
    this.review,
    this.notes,
    this.reSchedule,
    this.paymentStatus,
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
        date: json["date"],
        time: json["time"],
        day: json["day"],
        status: json["status"],
        reason: json["reason"],
        appointmentType: json["appointment_type"],
        desc: json["desc"],
        prescription: json["prescription"] == null
            ? []
            : List<String>.from(json["prescription"]!.map((x) => x)),
        review: json["review"],
        notes: json["notes"],
        reSchedule: json["reSchedule"],
        paymentStatus: json["payment_status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class UserId {
  dynamic age;
  String? id;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? img;

  UserId({
    this.age,
    this.id,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.img,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        age: json["age"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "_id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "img": img,
      };
}
