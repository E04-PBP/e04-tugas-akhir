// To parse this JSON data, do
//
//     final marketplaceModel = marketplaceModelFromJson(jsonString);

import 'dart:convert';

MarketplaceModel marketplaceModelFromJson(String str) =>
    MarketplaceModel.fromJson(json.decode(str));

String marketplaceModelToJson(MarketplaceModel data) =>
    json.encode(data.toJson());

class MarketplaceModel {
  MarketplaceModel({
    required this.namaBaju,
    required this.size,
    required this.paymentMethod,
    required this.shippingMethod,
  });

  String namaBaju;
  String size;
  String paymentMethod;
  String shippingMethod;

  factory MarketplaceModel.fromJson(Map<String, dynamic> json) =>
      MarketplaceModel(
        namaBaju: json["nama_baju"],
        size: json["size"],
        paymentMethod: json["payment_method"],
        shippingMethod: json["shipping_method"],
      );

  Map<String, dynamic> toJson() => {
        "nama_baju": namaBaju,
        "size": size,
        "payment_method": paymentMethod,
        "shipping_method": shippingMethod,
      };
}
