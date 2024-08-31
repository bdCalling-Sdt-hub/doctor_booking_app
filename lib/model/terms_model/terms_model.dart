// To parse this JSON data, do
//
//     final termsModel = termsModelFromJson(jsonString);

import 'dart:convert';

TermsModel termsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

String termsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  String? id;
  String? name;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  TermsModel({
    this.id,
    this.name,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        id: json["_id"],
        name: json["name"],
        value: json["value"],
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
        "value": value,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
