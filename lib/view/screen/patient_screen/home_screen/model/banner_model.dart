class BannerDatum {
  String? id;
  String? img;

  BannerDatum({
    this.id,
    this.img,
  });

  factory BannerDatum.fromJson(Map<String, dynamic> json) => BannerDatum(
        id: json["_id"] ?? "",
        img: json["img"] ?? "",
      );
}
