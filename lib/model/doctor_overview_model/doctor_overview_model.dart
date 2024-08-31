// To parse this JSON data, do
//
//     final doctorOverviewModel = doctorOverviewModelFromJson(jsonString);

import 'dart:convert';

DoctorOverviewModel doctorOverviewModelFromJson(String str) =>
    DoctorOverviewModel.fromJson(json.decode(str));

String doctorOverviewModelToJson(DoctorOverviewModel data) =>
    json.encode(data.toJson());

class DoctorOverviewModel {
  int? totalReceived;
  int? availableForReceive;
  TotalAppointment? totalAppointment;

  DoctorOverviewModel({
    this.totalReceived,
    this.availableForReceive,
    this.totalAppointment,
  });

  factory DoctorOverviewModel.fromJson(Map<String, dynamic> json) =>
      DoctorOverviewModel(
        totalReceived: json["total_received"],
        availableForReceive: json["available_for_receive"],
        totalAppointment: json["total_appointment"] == null
            ? null
            : TotalAppointment.fromJson(json["total_appointment"]),
      );

  Map<String, dynamic> toJson() => {
        "total_received": totalReceived,
        "available_for_receive": availableForReceive,
        "total_appointment": totalAppointment?.toJson(),
      };
}

class TotalAppointment {
  int? pending;
  int? accepted;
  int? rejected;
  int? completed;

  TotalAppointment({
    this.pending,
    this.accepted,
    this.rejected,
    this.completed,
  });

  factory TotalAppointment.fromJson(Map<String, dynamic> json) =>
      TotalAppointment(
        pending: json["pending"],
        accepted: json["accepted"],
        rejected: json["rejected"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "pending": pending,
        "accepted": accepted,
        "rejected": rejected,
        "completed": completed,
      };
}
