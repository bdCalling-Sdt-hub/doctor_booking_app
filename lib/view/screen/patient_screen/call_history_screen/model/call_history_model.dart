class CallHistoryDatum {
  String? id;
  RId? doctorId;
  RId? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CallHistoryDatum({
    this.id,
    this.doctorId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CallHistoryDatum.fromJson(Map<String, dynamic> json) =>
      CallHistoryDatum(
        id: json["_id"],
        doctorId:
            json["doctorId"] == null ? null : RId.fromJson(json["doctorId"]),
        userId: json["userId"] == null ? null : RId.fromJson(json["userId"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
  dynamic age;

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
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "specialization": specialization,
        "age": age,
      };
}
