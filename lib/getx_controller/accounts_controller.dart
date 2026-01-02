import 'package:get/get.dart';
import 'package:bakerybrown/api_services/api_config.dart';
import 'package:flutter/material.dart';
import '../api_services/api_base_helper.dart';
import '../model/retailer_accounts_model.dart';
import '../model/wholesaler_accounts_model.dart';


class AccountsController extends GetxController {
  var isLoading = false.obs;
  var retailerAccountsData = RetailerAccountsModel().obs;


  Future<RetailerAccountsModel> getRetailerAccountsApi(
      {BuildContext? context,var from, var to}) async {
    final url = "$retailerAccountsUrl?fromDate=$from&toDate=$to";
    var response = await ApiBaseHelper().getApiCall(context!, url);
    RetailerAccountsModel modal = RetailerAccountsModel.fromJson(response);
    retailerAccountsData.value = modal;

    return modal;
  }

  var wholesalerAccountsData = WholesalerAccountsModel().obs;
  Future<WholesalerAccountsModel> getWholesalerAccountsApi(
      {BuildContext? context,var assetSort, var liabilityPaymentStatus,var orderPaymentType}) async {
    final url = "$wholesalerAccountsUrl?assetSort=$assetSort&liabilityPaymentStatus=$liabilityPaymentStatus&orderPaymentType=$orderPaymentType";
    var response = await ApiBaseHelper().getApiCall(context!, url);
    WholesalerAccountsModel modal = WholesalerAccountsModel.fromJson(response);
    wholesalerAccountsData.value = modal;

    return modal;
  }
}
