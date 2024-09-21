class PopularDoctorDatum {
  String? id;
  String? img;
  String? name;
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
  bool? isFavorite;
  int? access;
  AvailableDays? availableDays;
  AvailableFor? availableFor;
  String? license;
  String? specialization;
  String? experience;
  String? educationalBackground;
  String? currentAffiliation;
  num? rating;
  int? totalRated;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? appointmentFee;

  PopularDoctorDatum({
    this.id,
    this.img,
    this.name,
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
    this.isFavorite,
    this.access,
    this.availableDays,
    this.availableFor,
    this.license,
    this.specialization,
    this.experience,
    this.educationalBackground,
    this.currentAffiliation,
    this.rating,
    this.totalRated,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.appointmentFee,
  });

  factory PopularDoctorDatum.fromJson(Map<String, dynamic> json) {
    return PopularDoctorDatum(
      id: json["_id"],
      img: json["img"],
      name: json["name"],
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
      isFavorite: json["isFavorite"],
      access: json["access"],
      availableDays: json["available_days"] != null
          ? AvailableDays.fromJson(json["available_days"])
          : null,
      availableFor: json["available_for"] != null
          ? AvailableFor.fromJson(json["available_for"])
          : null,
      license: json["license"],
      specialization: json["specialization"],
      experience: json["experience"],
      educationalBackground: json["educational_background"],
      currentAffiliation: json["current_affiliation"],
      rating: json["rating"],
      totalRated: json["total_rated"],
      createdAt:
          json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt:
          json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      v: json["__v"],
      appointmentFee: json["appointment_fee"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "img": img,
      "name": name,
      "email": email,
      "date_of_birth": dateOfBirth,
      "location": location,
      "phone": phone,
      "password": password,
      "provider": provider,
      "gender": gender,
      "block": block,
      "role": role,
      "verified": verified,
      "isFavorite": isFavorite,
      "access": access,
      "available_days": availableDays?.toJson(),
      "available_for": availableFor?.toJson(),
      "license": license,
      "specialization": specialization,
      "experience": experience,
      "educational_background": educationalBackground,
      "current_affiliation": currentAffiliation,
      "rating": rating,
      "total_rated": totalRated,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "__v": v,
      "appointment_fee": appointmentFee,
    };
  }
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

  factory AvailableDays.fromJson(Map<String, dynamic> json) {
    return AvailableDays(
      monday: json["monday"] != null ? List<String>.from(json["monday"]) : [],
      tuesday:
          json["tuesday"] != null ? List<String>.from(json["tuesday"]) : [],
      wednesday:
          json["wednesday"] != null ? List<String>.from(json["wednesday"]) : [],
      thursday:
          json["thursday"] != null ? List<String>.from(json["thursday"]) : [],
      friday: json["friday"] != null ? List<String>.from(json["friday"]) : [],
      saturday:
          json["saturday"] != null ? List<String>.from(json["saturday"]) : [],
      sunday: json["sunday"] != null ? List<String>.from(json["sunday"]) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "monday": monday ?? [],
      "tuesday": tuesday ?? [],
      "wednesday": wednesday ?? [],
      "thursday": thursday ?? [],
      "friday": friday ?? [],
      "saturday": saturday ?? [],
      "sunday": sunday ?? [],
    };
  }

  List<dynamic> getTimesForDay(String day) {
    switch (day) {
      case 'Monday':
        return monday ?? [];
      case 'Tuesday':
        return tuesday ?? [];
      case 'Wednesday':
        return wednesday ?? [];
      case 'Thursday':
        return thursday ?? [];
      case 'Friday':
        return friday ?? [];
      case 'Saturday':
        return saturday ?? [];
      case 'Sunday':
        return sunday ?? [];
      default:
        return [];
    }
  }
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

  factory AvailableFor.fromJson(Map<String, dynamic> json) {
    return AvailableFor(
      monday: json["monday"],
      tuesday: json["tuesday"],
      wednesday: json["wednesday"],
      thursday: json["thursday"],
      friday: json["friday"],
      saturday: json["saturday"],
      sunday: json["sunday"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "monday": monday,
      "tuesday": tuesday,
      "wednesday": wednesday,
      "thursday": thursday,
      "friday": friday,
      "saturday": saturday,
      "sunday": sunday,
    };
  }
}
