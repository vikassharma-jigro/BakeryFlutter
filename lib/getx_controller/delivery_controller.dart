import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:bakerybrown/api_services/api_config.dart';
import 'package:flutter/material.dart';
import '../api_services/api_base_helper.dart';
import '../model/delivery_order_model.dart';
import '../model/notification_model.dart';


class DeliveryController extends GetxController {
  var isLoading = false.obs;
  var deliveryList = DeliveryOrderListModel().obs;


  Future<DeliveryOrderListModel>getDeliveryOrderListApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,deliveryOrderUrl);
    DeliveryOrderListModel modal = DeliveryOrderListModel.fromJson(response);
    deliveryList.value = modal;

    return modal;
  }

  var notificationList = NotificationListModel().obs;
  Future<NotificationListModel>getNotificationListApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,notificationListUrl);
    NotificationListModel modal = NotificationListModel.fromJson(response);
    notificationList.value = modal;

    return modal;
  }

  Future<DeliveryOrderListModel> getDispatchOrderApi({
    BuildContext? context,
    String? orderId,

  }) async {
    Map<String, dynamic> body = {

    };
    String url = "$dispatchOrderUrl/$orderId";
    var response = await ApiBaseHelper().putApiCall(
      false,
      url,
      context!,
      body,
    );

    DeliveryOrderListModel modal = DeliveryOrderListModel.fromJson(response);
    Fluttertoast.showToast(msg: modal.message??"",gravity: ToastGravity.CENTER);
    return modal;
  }

  Future<DeliveryOrderListModel> getDeliveredOrderApi({
    BuildContext? context,
    String? orderId,

  }) async {
    Map<String, dynamic> body = {

    };
    String url = "$deliveredOrderUrl/$orderId";
    var response = await ApiBaseHelper().putApiCall(
      false,
      url,
      context!,
      body,
    );

    DeliveryOrderListModel modal = DeliveryOrderListModel.fromJson(response);
    Fluttertoast.showToast(msg: modal.message??"",gravity: ToastGravity.CENTER);
    return modal;
  }

}
