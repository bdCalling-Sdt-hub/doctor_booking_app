class AppoinmentListModel {
  String? id;
  String? name;
  DoctorId? doctorId;
  String? userId;
  String? date;
  String? time;
  String? day;
  String? status;
  String? reason;
  String? appointmentType;
  String? desc;
  List<String>? prescription;
  List<String>? additionalTreatmentList;
  bool? review;
  String? notes;
  bool? reSchedule;
  bool? paymentStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? additionalFee;
  int? appointmentFee;

  List<Service>? services;

  AppoinmentListModel(
      {this.id,
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
      this.additionalTreatmentList,
      this.review,
      this.notes,
      this.reSchedule,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.additionalFee,
      this.appointmentFee,
      this.services});

  factory AppoinmentListModel.fromJson(Map<String, dynamic> json) =>
      AppoinmentListModel(
        id: json["_id"],
        name: json["name"],
        doctorId: json["doctorId"] == null
            ? null
            : DoctorId.fromJson(json["doctorId"]),
        userId: json["userId"],
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
        additionalTreatmentList: json["additionalTreatmentList"] == null
            ? []
            : List<String>.from(json["additionalTreatmentList"]!.map((x) => x)),
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
        additionalFee: json["additionalFee"] ?? 0,
        appointmentFee: json["appointment_fee"] ?? 0,
        services: json["services"] == null
            ? []
            : List<Service>.from(
                json["services"]!.map((x) => Service.fromJson(x))),
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
  int? appointmentFee;

  DoctorId(
      {this.id,
      this.img,
      this.name,
      this.email,
      this.location,
      this.phone,
      this.specialization,
      this.appointmentFee});

  factory DoctorId.fromJson(Map<String, dynamic> json) => DoctorId(
      id: json["_id"],
      img: json["img"],
      name: json["name"],
      email: json["email"],
      location: json["location"],
      phone: json["phone"],
      specialization: json["specialization"],
      appointmentFee: json["appointment_fee"]);
}

class Service {
  String? name;
  int? price;

  Service({
    this.name,
    this.price,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}
