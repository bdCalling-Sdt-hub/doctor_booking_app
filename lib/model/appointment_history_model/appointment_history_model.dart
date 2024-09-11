// To parse this JSON data, do
//
//     final appointmentHistoryModel = appointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

AppointmentHistoryModel appointmentHistoryModelFromJson(String str) =>
    AppointmentHistoryModel.fromJson(json.decode(str));

String appointmentHistoryModelToJson(AppointmentHistoryModel data) =>
    json.encode(data.toJson());

class AppointmentHistoryModel {
  String? id;
  int? amount;
  String? transitionId;
  String? status;
  RId? doctorId;
  RId? userId;
  bool? paymentDoctor;
  int? doctorAmount;
  String? appointmentId;
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
        appointmentId: json["AppointmentId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "amount": amount,
        "transitionId": transitionId,
        "status": status,
        "doctorId": doctorId?.toJson(),
        "userId": userId?.toJson(),
        "payment_doctor": paymentDoctor,
        "doctor_amount": doctorAmount,
        "AppointmentId": appointmentId,
        "__v": v,
      };
}

class RId {
  String? id;
  String? img;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? specialization;

  RId({
    this.id,
    this.img,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.specialization,
  });

  factory RId.fromJson(Map<String, dynamic> json) => RId(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        specialization: json["specialization"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "specialization": specialization,
      };
}
