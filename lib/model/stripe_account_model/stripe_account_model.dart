// To parse this JSON data, do
//
//     final stripeAccountModel = stripeAccountModelFromJson(jsonString);

import 'dart:convert';

StripeAccountModel stripeAccountModelFromJson(String str) => StripeAccountModel.fromJson(json.decode(str));

String stripeAccountModelToJson(StripeAccountModel data) => json.encode(data.toJson());

class StripeAccountModel {
    String? id;
    String? name;
    String? email;
    String? doctorId;
    String? stripeAccountId;
    String? kycBack;
    String? kycFront;
    String? address;
    DateTime? dob;
    AccountInformation? accountInformation;
    int? v;

    StripeAccountModel({
        this.id,
        this.name,
        this.email,
        this.doctorId,
        this.stripeAccountId,
        this.kycBack,
        this.kycFront,
        this.address,
        this.dob,
        this.accountInformation,
        this.v,
    });

    factory StripeAccountModel.fromJson(Map<String, dynamic> json) => StripeAccountModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        doctorId: json["doctorId"],
        stripeAccountId: json["stripeAccountId"],
        kycBack: json["kycBack"],
        kycFront: json["kycFront"],
        address: json["address"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        accountInformation: json["accountInformation"] == null ? null : AccountInformation.fromJson(json["accountInformation"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "doctorId": doctorId,
        "stripeAccountId": stripeAccountId,
        "kycBack": kycBack,
        "kycFront": kycFront,
        "address": address,
        "dob": dob?.toIso8601String(),
        "accountInformation": accountInformation?.toJson(),
        "__v": v,
    };
}

class AccountInformation {
    String? stripeAccountId;
    String? externalAccountId;
    bool? status;
    String? id;

    AccountInformation({
        this.stripeAccountId,
        this.externalAccountId,
        this.status,
        this.id,
    });

    factory AccountInformation.fromJson(Map<String, dynamic> json) => AccountInformation(
        stripeAccountId: json["stripeAccountId"],
        externalAccountId: json["externalAccountId"],
        status: json["status"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "stripeAccountId": stripeAccountId,
        "externalAccountId": externalAccountId,
        "status": status,
        "_id": id,
    };
}
