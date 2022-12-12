import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<DonationModel> DonationFromJson(String str) => List<DonationModel>.from(
    json.decode(str).map((x) => DonationModel.fromJson(x)));

String DonationToJson(List<DonationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DonationModel {
  DonationModel({
    required this.pk,
    required this.waktu_isi,
    required this.jenis_barang,
    required this.amount,
    required this.shipping_method,
    required this.is_done,
  });
  int pk;
  String jenis_barang;
  String waktu_isi;
  int amount;
  String shipping_method;
  bool is_done;

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
        pk: json["pk"],
        waktu_isi: json['fields']["waktu_isi"],
        jenis_barang: json['fields']["jenis_barang"],
        amount: json['fields']["amount"],
        shipping_method: json['fields']["shipping_method"],
        is_done: json['fields']["is_done"],
      );


  Map<String, dynamic> toJson() => {
        "waktu_isi": waktu_isi,
        "jenis_barang": jenis_barang,
        "amount": amount,
        "shipping_method": shipping_method,
        "is_done": is_done,
      };
}
