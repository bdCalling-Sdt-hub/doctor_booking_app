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
  DateTime? createdAt;
  DateTime? updatedAt;
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

  // Factory constructor to parse JSON data
  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) {
    // Properly handle doctorId and userId, ensuring they're parsed as objects
    return AppointmentHistoryModel(
      id: json["_id"] as String?,
      amount: json["amount"] as int?,
      transitionId: json["transitionId"] as String?,
      status: json["status"] as String?,
      doctorId:
          json["doctorId"] != null && json["doctorId"] is Map<String, dynamic>
              ? RId.fromJson(json["doctorId"] as Map<String, dynamic>)
              : null,
      userId: json["userId"] != null && json["userId"] is Map<String, dynamic>
          ? RId.fromJson(json["userId"] as Map<String, dynamic>)
          : null,
      paymentDoctor: json["payment_doctor"] as bool?,
      doctorAmount: json["doctor_amount"] as int?,
      appointmentId: json["AppointmentId"] as String?,
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      v: json["__v"] as int?,
    );
  }

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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

// Class to represent doctorId and userId
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

  factory RId.fromJson(Map<String, dynamic> json) {
    return RId(
      id: json["_id"] as String?,
      img: json["img"] as String?,
      name: json["name"] as String?,
      email: json["email"] as String?,
      location: json["location"] as String?,
      phone: json["phone"] as String?,
      specialization: json["specialization"] as String?,
    );
  }

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
