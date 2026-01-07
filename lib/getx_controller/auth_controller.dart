import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:bakerybrown/api_services/api_config.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import '../api_services/api_base_helper.dart';
import 'package:http_parser/http_parser.dart';
import '../model/auth_model.dart';
import 'package:bakerybrown/api_services/api_handler.dart';

import '../model/profile_model.dart';
import '../model/retailers_add_list_model.dart';


class AuthController extends GetxController {
  var isLoading = false.obs;
  var authModel = AuthModel().obs;
  ApiHandler _apiHandler = ApiHandler();

  Future<AuthModel> getWholesalerLoginApi({
    BuildContext? context,
     String? email,
     String? password,

  }) async {
    try {
      isLoading(true);
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };
      var response = await ApiBaseHelper().postApiCall(
        false,
        wholesalerLoginUrl,
        context!,
        body,
      );

      AuthModel modal = AuthModel.fromJson(response);
      //modal.user?.otp = null;
      authModel.value = modal;

      // Fluttertoast.showToast(
      //   msg: /*modal.message*/"Hello",
      //   gravity: ToastGravity.CENTER,
      //   backgroundColor: blueColor,
      //   textColor: Colors.white,
      // );
      return modal;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Something went wrong: $e",
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return AuthModel();
    } finally {
      isLoading(false);
    }

  }
  Future<void> getAds({
    File? adharFrontPhoto,
    File? adharBackPhoto,
    File? shopImage,
    String? email,
    String? name,
    String? password,
    String? role,
    String? phone,
    String? department,
    String? status,
    String? joiningDate,
    String? shopName,
    String? alternatePhone,
    String? textCode,
    String? landmark,
    String? pincode,
    String? city,
    String? state,
    String? gstNumber,
    String? shopTiming,
    BuildContext? context,
    Map<String, dynamic>? retailerDetails,
    Map<String, dynamic>? address,
  }) async {
    var formData = FormData.fromMap({
      "name": name,
      "email": email,
      "password": password,
      "role":role,
      "phone": phone,
      "department":department,
      "status":status,
      "address": jsonEncode(address),
      //"joiningDate": joiningDate,
      "employeeDetails": jsonEncode(retailerDetails),
      "identityCardPhoto": (adharFrontPhoto != null && await File(adharFrontPhoto.path).exists())
          ? await MultipartFile.fromFile(
        adharFrontPhoto.path,
        filename: adharFrontPhoto.path.split('/').last,
      ) : "",

      "textCodePhoto": (adharBackPhoto != null && await File(adharBackPhoto.path).exists())
          ? await MultipartFile.fromFile(
        adharBackPhoto.path,
        filename: adharBackPhoto.path.split('/').last,
      ) : "",

      "shopImage": (shopImage != null && await File(shopImage.path).exists())
          ? await MultipartFile.fromFile(
        shopImage.path,
        filename: shopImage.path.split('/').last,
      ) : "",


    });

    if (adharFrontPhoto != null) {
      var length = await adharFrontPhoto.length();
      print("File Size: $length");
      String fileName = path.basename(adharFrontPhoto.path);
      print("File Name: $fileName");

      var multipartFile = await MultipartFile.fromFile(adharFrontPhoto.path,
          filename: fileName, contentType: MediaType("image", "jpg"));
      print("MultipartFile path: ${adharFrontPhoto.path}");
      print("MultipartFile filename: ${multipartFile.filename}");
      print("MultipartFile length: ${multipartFile.length}");
    }
    Map<String, dynamic> formDataMap = {};
    for (var field in formData.fields) {
      formDataMap[field.key] = field.value;
    }
    _apiHandler.adsApi(formData).then((value) {
      if (value.isSuccessed) {
        if (value.data == null) {
          print("message>>>${value.data}");
          Fluttertoast.showToast(msg: value.data);
        } else {
          Navigator.pop(context!);
          //showDialogInsurance(context, value.data['request_id']!);
         // notifyListeners();
        }
      } else {
      }

      //setLoading(false);
    });
  }
  var retailerListModel = RetailerListModel().obs;
  var page = 1.obs;
  var limit = 10;
  var isLoadingPage = false.obs;
  var hasMore = true.obs;
  var isFirstPageLoaded = false.obs;

  Future<RetailerListModel> getRetailerListApi({
    required BuildContext context,
    var status,
    var search,
    bool isLoadMore = false,
    bool isSearch = false,
  }) async {

    /// 🔄 STATUS / SEARCH RESET
    if (!isLoadMore || isSearch) {
      page.value = 1;
      hasMore.value = true;
      isFirstPageLoaded.value = false;
      retailerListModel.value.data?.clear();
    }

    /// 🚫 Page-1 poora load hone se pehle pagination block
    if (isLoadMore && !isFirstPageLoaded.value) {
      return retailerListModel.value;
    }

    if (isLoadingPage.value || !hasMore.value) {
      return retailerListModel.value;
    }

    isLoadingPage.value = true;

    String url =
        "$retailerAddListUrl"
        "?status=$status"
        "&search=$search"
        "&page=${page.value}"
        "&limit=$limit";

    var response = await ApiBaseHelper().getApiCall(context, url);
    RetailerListModel modal = RetailerListModel.fromJson(response);

    if (modal.data != null && modal.data!.isNotEmpty) {

      retailerListModel.value.data ??= [];
      retailerListModel.value.data!.addAll(modal.data!);

      page.value++;
      hasMore.value = modal.data!.length == limit;

      /// ✅ Page-1 fully handled
      if (page.value > 1) {
        isFirstPageLoaded.value = true;
      }

    } else {
      hasMore.value = false;
      isFirstPageLoaded.value = true;
    }

    isLoadingPage.value = false;
    return retailerListModel.value;
  }



  var profileData = ProfileData().obs;
  Future<ProfileModel>getProfileApi({BuildContext? context,var status,var search}) async {
    String url = "$profileUrl$status";
    var response = await ApiBaseHelper().getApiCall(context!,url);
    ProfileModel modal = ProfileModel.fromJson(response);
    profileData.value = modal.data!;

    return modal;
  }
}
