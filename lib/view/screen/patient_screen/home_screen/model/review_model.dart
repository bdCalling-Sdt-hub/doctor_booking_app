class ReviewDatum {
  String? id;
  Sender? sender;
  String? receiver;
  double? rating;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  ReviewDatum({
    this.id,
    this.sender,
    this.receiver,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewDatum.fromJson(Map<String, dynamic> json) => ReviewDatum(
        id: json["_id"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        receiver: json["receiver"],
        rating: json["rating"]?.toDouble(),
        comment: json["comment"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sender": sender?.toJson(),
        "receiver": receiver,
        "rating": rating,
        "comment": comment,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Sender {
  String? img;
  String? id;
  String? name;
  String? email;
  String? location;
  String? phone;
  String? age;

  Sender({
    this.img,
    this.id,
    this.name,
    this.email,
    this.location,
    this.phone,
    this.age,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        img: json["img"] ?? "",
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        location: json["location"],
        phone: json["phone"],
        age: json["age"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "_id": id,
        "name": name,
        "email": email,
        "location": location,
        "phone": phone,
        "age": age,
      };
}
