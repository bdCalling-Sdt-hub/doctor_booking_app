class PaitentProfileModel {
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
  int? age;
  String? img;
  String? gender;

  PaitentProfileModel(
      {this.id,
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
      this.gender});

  factory PaitentProfileModel.fromJson(Map<String, dynamic> json) =>
      PaitentProfileModel(
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
        gender: json["gender"],
      );
}
