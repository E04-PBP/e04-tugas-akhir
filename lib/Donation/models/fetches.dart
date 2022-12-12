import 'package:flutter/material.dart';
import 'package:iramakain/Donation/models/donationModels.dart';
import 'package:iramakain/Authentication/model/success_page_model.dart';
import 'package:iramakain/Profile/model/profile_page_model.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:iramakain/Donation/page/detaildonations.dart';

Future<List<DonationModel>> fetchDonationInfo(BuildContext context) async {
  List<DonationModel> listDonationInfo = [];
  final request = context.watch<CookieRequest>();

  var responseInfo =
      await request.get("https://irama-kain.up.railway.app/donation/json/");
  print(responseInfo);
  for (var x in responseInfo) {
    print("sampe sini");
    print(x);
    DonationModel object = DonationModel.fromJson(x);
    listDonationInfo.add(object);
    print("====================ini objek================");
    print(object);
  }
  // print(responseInfo);
  return listDonationInfo;
}

Future<List<DonationModel>> fetchDonationHist(BuildContext context) async {
  List<DonationModel> listDonationHistory = [];
  final request = context.watch<CookieRequest>();

  var responseHistory =
      await request.get("https://irama-kain.up.railway.app/donation/history/");
  for (var x in responseHistory) {
    DonationModel object = DonationModel.fromJson(x);
    listDonationHistory.add(object);
  }
  return listDonationHistory;
}

Future<DonationModel> fetchCurrent(BuildContext context, int pk) async {
  DonationModel current;
  final request = context.watch<CookieRequest>();
  List<DonationModel> listDonation = [];
  var response = await request
      .get("https://irama-kain.up.railway.app/donation/current/${pk}");
  print(response);
  for (var x in response) {
    DonationModel object = DonationModel.fromJson(x);
    listDonation.add(object);
  }
  current = listDonation[0];
  return current;
}

Future<SuccessModel> fetchToDo(BuildContext context) async {
  final request = context.watch<CookieRequest>();
  final response = await request
      .get("https://irama-kain.up.railway.app/Authentication/json/");

  SuccessModel fetched = SuccessModel.fromJson(response);

  return fetched;
}
Future<ProfileModel> fetchProfile(BuildContext context) async {
    final request = context.watch<CookieRequest>();
    final response = await request
        .get("https://irama-kain.up.railway.app/profile/get_profile");

    ProfileModel fetched = ProfileModel.fromJson(response);

    return fetched;
  }