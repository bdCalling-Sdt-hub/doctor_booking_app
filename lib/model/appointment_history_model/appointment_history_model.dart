// To parse this JSON data, do
//
//     final appointmentHistoryModel = appointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

AppointmentHistoryModel appointmentHistoryModelFromJson(String str) =>
    AppointmentHistoryModel.fromJson(json.decode(str));

class AppointmentHistoryModel {
  String? id;
  int? amount;
  String? transitionId;
  String? status;
  RId? doctorId;
  RId? userId;
  bool? paymentDoctor;
  int? doctorAmount;
  AppointmentId? appointmentId;
  String? createdAt;
  String? updatedAt;
  int? v;

  AppointmentHistoryModel({
    this.id,
    this.amount,
    this.transitionId,
    this.status,
    this.doctorId,
    this.userId,
    this.paymentDoctor,
    this.doctorAmount,
    this.appointmentId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) =>
      AppointmentHistoryModel(
        id: json["_id"],
        amount: json["amount"],
        transitionId: json["transitionId"],
        status: json["status"],
        doctorId:
            json["doctorId"] == null ? null : RId.fromJson(json["doctorId"]),
        userId: json["userId"] == null ? null : RId.fromJson(json["userId"]),
        paymentDoctor: json["payment_doctor"],
        doctorAmount: json["doctor_amount"],
        appointmentId: json["AppointmentId"] == null
            ? null
            : AppointmentId.fromJson(json["AppointmentId"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
      );
}

class AppointmentId {
  String? id;
  DateTime? date;

  AppointmentId({
    this.id,
    this.date,
  });

  factory AppointmentId.fromJson(Map<String, dynamic> json) => AppointmentId(
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date?.toIso8601String(),
      };
}

class RId {
  String? id;
  String? img;
  String? name;
  int? appointmentFee;
  String? email;
  String? location;
  String? phone;
  String? specialization;

  RId({
    this.id,
    this.img,
    this.name,
    this.appointmentFee,
    this.email,
    this.location,
    this.phone,
    this.specialization,
  });

  factory RId.fromJson(Map<String, dynamic> json) => RId(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        appointmentFee: json["appointment_fee"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        specialization: json["specialization"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "name": name,
        "appointment_fee": appointmentFee,
        "email": email,
        "location": location,
        "phone": phone,
        "specialization": specialization,
      };
}
