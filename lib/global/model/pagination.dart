// To parse this JSON data, do
//
//     final paginationModel = paginationModelFromJson(jsonString);

import 'dart:convert';

PaginationModel paginationModelFromJson(String str) =>
    PaginationModel.fromJson(json.decode(str));

String paginationModelToJson(PaginationModel data) =>
    json.encode(data.toJson());

class PaginationModel {
  int? currentPage;
  int? itemsPerPage;
  int? totalItems;
  int? totalPages;

  PaginationModel({
    this.currentPage,
    this.itemsPerPage,
    this.totalItems,
    this.totalPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        currentPage: json["currentPage"],
        itemsPerPage: json["itemsPerPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "itemsPerPage": itemsPerPage,
        "totalItems": totalItems,
        "totalPages": totalPages,
      };
}
