import 'package:dio/dio.dart';
import '../app_utils/connectivity.dart';


class ApiResponse<T> {
  T? data;
  late bool status;
  late String? messsage;
  ApiResponse({
    this.data,
    required this.status,
    required this.messsage,
  });
}
class ApiResponse1<T> {
  //ApiCallState? apiCallState;
  T? data;
  String? message;

  ApiResponse1.success(this.data) ;

  ApiResponse1.loading() ;

  ApiResponse1.error(this.message) ;
  @override
  String toString() {
    return 'Message : $message \n Data : $data';
  }
}
Future<ApiResponse> apiRequest({required Future<dynamic> request}) async {
  try {
    if (isConnected.value) {
      Response response = await request;


      // Log the full response for debugging
      print("Response Data: ${response.data}");
      print("Response Status Code: ${response.statusCode}");
      print("request Status Code: ${request}");


      switch (response.statusCode) {
        case 200:
          return ApiResponse(
              status: true,
              messsage: (response.data != null && response.data.isNotEmpty)
                  ? response.data['message']
                  : "",
              data: (response.data != null && response.data.isNotEmpty)
                  ? response.data['data']
                  : "");

        case 201:
          return ApiResponse(
              status: response.data['status'],
              messsage:
                  (response.data.isNotEmpty) ? response.data['message'] : "",
              data: (response.data != null && response.data.isNotEmpty)
                  ? response.data['data']
                  : "");

        default:
          return ApiResponse(
              status: response.data['status'],
              messsage: (response.data.isNotEmpty)
                  ? response.data['message']
                  : "Something Went Wrong",
              data: (response.data.isNotEmpty) ? response.data : "");
      }
    } else {
      return ApiResponse(
        status: false,
        messsage: 'No internet connection',
      );
    }

    //here we can check the response status and show error message
  } on DioError catch (e) {
    print("DioError Response: ${e.response!.data}"); // Log error response

    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
   if (e.response != null) {
      switch (e.response!.statusCode) {
        case 401:
          return ApiResponse(
              status: false,
              messsage: (e.response!.data)
                  ? e.response!.data['message']
                  : "Something Went Wrong");

        case 400:
          return ApiResponse(
            status: false,
            messsage: e.response!.data['message'] ?? "",
          );

        case 403:
          return ApiResponse(
            status: false,
            messsage: e.response!.data['message'] ?? "",
          );
        case 404:
          return ApiResponse(
            status: false,
            messsage: e.response!.data['message'] ?? "",
          );
        case 422:
          return ApiResponse(
            status: false,
            messsage: e.response!.data['message'] ?? "",
          );
        case 500:
          return ApiResponse(
              status: false,
              messsage:
                  "It's a temporary server issue. Please try after sometime! ");

        default:
          return ApiResponse(
            status: false,
            messsage: e.response!.data['message'] ?? "",
          );
      }
    } else {
      return ApiResponse(
        status: false,
        messsage: 'Something went wrong!',
      );
    }
  }
}

class OnComplete<T> {
  T? data;
  bool isUnauthenticated;
  bool isSuccessed;
  String? message;
  int? statusCode;
  OnComplete(
      {this.data,
      required this.isSuccessed,
      this.message,
      this.statusCode,
      this.isUnauthenticated = false});
  factory OnComplete.success(T data, {String? messagee}) {
    return OnComplete(
        data: data,
        isSuccessed: true,
        isUnauthenticated: false,
        message: messagee);
  }
  factory OnComplete.successWithStatusCode(T data, int statusCode) {
    return OnComplete(
        data: data,
        isSuccessed: true,
        isUnauthenticated: false,
        statusCode: statusCode);
  }

  factory OnComplete.error(String message,) {
    return OnComplete(
      data: null,
      isSuccessed: false,
      message: message,
      isUnauthenticated: false,
    );
  }
}

enum CurrentState { loading, success, error, initial }

class DataState<T> {
  final T? data;
  final CurrentState state;
  final String? errorMessage;
  bool get isLoading => state == CurrentState.loading;
  bool get isInitail => state == CurrentState.initial;
  bool get isSuccess => state == CurrentState.success;
  bool get isError => state == CurrentState.error;

  DataState({this.data, required this.state, this.errorMessage});

  factory DataState.loading() {
    return DataState(
      state: CurrentState.loading,
      data: null,
    );
  }
  factory DataState.initial() {
    return DataState(state: CurrentState.initial, data: null);
  }
  factory DataState.success({required T data}) {
    return DataState(state: CurrentState.success, data: data);
  }

  factory DataState.error({required String message}) {
    return DataState(
        state: CurrentState.error, data: null, errorMessage: message);
  }
}
