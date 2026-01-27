import 'package:bakerybrown/api_services/response_handling_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../app_utils/shared_preferences.dart';
import '../main.dart';
import 'api_config.dart';

class ApiHandler {
  Dio? _dio;

  String deviceId = '';
  String deviceType = '';
  String deviceUniqueId = '';

  ApiHandler() {
    BaseOptions options = BaseOptions(
        baseUrl: BASE_URL, receiveTimeout: Duration(milliseconds: 300000), connectTimeout: Duration(milliseconds: 300000),);
    _dio = Dio(options);
    _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  /// ----------------------------------------------------------
  /// ADS API
  /// ----------------------------------------------------------
  /// put ads 

  Future<OnComplete> adsApi(dynamic fromData) async {
    try {
      ApiResponse apiResponse = await apiRequest(

          request: _dio!.post(
              wholesalerRetailerAddUrl,
            data: fromData,
              options:
               Options(
                  contentType: "application/from-data",
                  headers: {
                    "Authorization": "Bearer " + "${sp?.getString(SpUtil.ACCESS_TOKEN) ?? ""}",
                  }
      )) );
      if (apiResponse.status&&apiResponse.data!=null) {
        return OnComplete.success(apiResponse.data);
      } else {
        return OnComplete.error(
            apiResponse.messsage ?? "",);
      }
    } catch (e) {
      debugPrint("adsApi Error: ${e.toString()}"); // Log error details
      return OnComplete.error("Something went wrong!");
    }
  }





}
