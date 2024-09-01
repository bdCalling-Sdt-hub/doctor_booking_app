class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? dateOfBirth;
  String? location;
  String? phone;
  String? password;
  String? provider;
  bool? block;
  String? role;
  int? access;
  bool? verified;
  List<String>? category;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? age;
  String? img;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.location,
    this.phone,
    this.password,
    this.provider,
    this.block,
    this.role,
    this.access,
    this.verified,
    this.category,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.age,
    this.img,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        dateOfBirth: json["date_of_birth"],
        location: json["location"],
        phone: json["phone"],
        password: json["password"],
        provider: json["provider"],
        block: json["block"],
        role: json["role"],
        access: json["access"],
        verified: json["verified"],
        category: json["category"] == null
            ? []
            : List<String>.from(json["category"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        age: json["age"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "date_of_birth": dateOfBirth,
        "location": location,
        "phone": phone,
        "password": password,
        "provider": provider,
        "block": block,
        "role": role,
        "access": access,
        "verified": verified,
        "category":
            category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "age": age,
        "img": img,
      };
}
