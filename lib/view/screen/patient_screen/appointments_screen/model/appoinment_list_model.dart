class AppoinmentListModel {
  String? id;
  String? name;
  DoctorId? doctorId;
  String? userId;
  DateTime? date;
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

  AppoinmentListModel({
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

  factory AppoinmentListModel.fromJson(Map<String, dynamic> json) =>
      AppoinmentListModel(
        id: json["_id"],
        name: json["name"],
        doctorId: json["doctorId"] == null
            ? null
            : DoctorId.fromJson(json["doctorId"]),
        userId: json["userId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        day: json["day"],
        status: json["status"],
        reason: json["reason"],
        appointmentType: json["appointmentType"],
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

class DoctorId {
  String? id;
  String? img;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? specialization;

  DoctorId({
    this.id,
    this.img,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.specialization,
  });

  factory DoctorId.fromJson(Map<String, dynamic> json) => DoctorId(
        id: json["_id"],
        img: json["img"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        specialization: json["specialization"],
      );
}
