// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.poin,
    required this.gender,
    required this.email,
    required this.address,
    required this.kontak,
  });

  String firstName;
  String lastName;
  int poin;
  bool gender;
  String email;
  String address;
  String kontak;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        poin: json["poin"],
        gender: json["gender"],
        email: json["email"],
        address: json["address"],
        kontak: json["kontak"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "poin": poin,
        "gender": gender,
        "email": email,
        "address": address,
        "kontak": kontak,
      };
}
