import 'dart:convert';

SuccessModel successModelFromJson(String str) =>
    SuccessModel.fromJson(json.decode(str));

String successModelToJson(SuccessModel data) => json.encode(data.toJson());

class SuccessModel {
  SuccessModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
  });

  String firstName;
  String lastName;
  String gender;

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
      };
}
