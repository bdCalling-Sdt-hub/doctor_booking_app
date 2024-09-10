// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

class ProfileModel {
  String? img;
  String? name;
  int? appointmentFee;
  String? email;
  String? dateOfBirth;
  String? location;
  String? phone;
  String? password;
  String? provider;
  String? gender;
  bool? block;
  String? role;
  bool? verified;
  int? access;
  AvailableDays? availableDays;
  AvailableFor? availableFor;
  String? license;
  String? licenseNo;
  String? specialization;
  String? experience;
  String? educationalBackground;
  String? currentAffiliation;
  int? rating;
  int? totalRated;
  bool? approved;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProfileModel({
    this.img,
    this.name,
    this.appointmentFee,
    this.email,
    this.dateOfBirth,
    this.location,
    this.phone,
    this.password,
    this.provider,
    this.gender,
    this.block,
    this.role,
    this.verified,
    this.access,
    this.availableDays,
    this.availableFor,
    this.license,
    this.licenseNo,
    this.specialization,
    this.experience,
    this.educationalBackground,
    this.currentAffiliation,
    this.rating,
    this.totalRated,
    this.approved,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        img: json["img"],
        name: json["name"],
        appointmentFee: json["appointment_fee"],
        email: json["email"],
        dateOfBirth: json["date_of_birth"],
        location: json["location"],
        phone: json["phone"],
        password: json["password"],
        provider: json["provider"],
        gender: json["gender"],
        block: json["block"],
        role: json["role"],
        verified: json["verified"],
        access: json["access"],
        availableDays: json["available_days"] == null
            ? null
            : AvailableDays.fromJson(json["available_days"]),
        availableFor: json["available_for"] == null
            ? null
            : AvailableFor.fromJson(json["available_for"]),
        license: json["license"],
        licenseNo: json["license_no"],
        specialization: json["specialization"],
        experience: json["experience"],
        educationalBackground: json["educational_background"],
        currentAffiliation: json["current_affiliation"],
        rating: json["rating"],
        totalRated: json["total_rated"],
        approved: json["approved"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class AvailableDays {
  List<String>? monday;
  List<String>? tuesday;
  List<String>? wednesday;
  List<String>? thursday;
  List<String>? friday;
  List<String>? saturday;
  List<String>? sunday;

  AvailableDays({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory AvailableDays.fromJson(Map<String, dynamic> json) => AvailableDays(
        monday: json["monday"] == null
            ? []
            : List<String>.from(json["monday"]!.map((x) => x)),
        tuesday: json["tuesday"] == null
            ? []
            : List<String>.from(json["tuesday"]!.map((x) => x)),
        wednesday: json["wednesday"] == null
            ? []
            : List<String>.from(json["wednesday"]!.map((x) => x)),
        thursday: json["thursday"] == null
            ? []
            : List<String>.from(json["thursday"]!.map((x) => x)),
        friday: json["friday"] == null
            ? []
            : List<String>.from(json["friday"]!.map((x) => x)),
        saturday: json["saturday"] == null
            ? []
            : List<String>.from(json["saturday"]!.map((x) => x)),
        sunday: json["sunday"] == null
            ? []
            : List<String>.from(json["sunday"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "monday":
            monday == null ? [] : List<dynamic>.from(monday!.map((x) => x)),
        "tuesday":
            tuesday == null ? [] : List<dynamic>.from(tuesday!.map((x) => x)),
        "wednesday": wednesday == null
            ? []
            : List<dynamic>.from(wednesday!.map((x) => x)),
        "thursday":
            thursday == null ? [] : List<dynamic>.from(thursday!.map((x) => x)),
        "friday":
            friday == null ? [] : List<dynamic>.from(friday!.map((x) => x)),
        "saturday":
            saturday == null ? [] : List<dynamic>.from(saturday!.map((x) => x)),
        "sunday":
            sunday == null ? [] : List<dynamic>.from(sunday!.map((x) => x)),
      };
}

class AvailableFor {
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  AvailableFor({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory AvailableFor.fromJson(Map<String, dynamic> json) => AvailableFor(
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
        saturday: json["saturday"],
        sunday: json["sunday"],
      );

  Map<String, dynamic> toJson() => {
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
        "saturday": saturday,
        "sunday": sunday,
      };
}
