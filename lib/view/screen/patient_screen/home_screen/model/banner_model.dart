class BannerDatum {
  String? id;
  String? order;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BannerDatum({
    this.id,
    this.order,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
        id: json["_id"],
        order: json["order"],
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
        "order": order,
        "img": img,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
