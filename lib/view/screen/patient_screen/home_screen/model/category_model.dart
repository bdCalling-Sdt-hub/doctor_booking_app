class CategoryDatum {
  String? id;
  String? name;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryDatum({
    this.id,
    this.name,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["_id"],
        name: json["name"],
        img: json["img"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "img": img,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
