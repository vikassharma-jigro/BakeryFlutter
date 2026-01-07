import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:bakerybrown/api_services/api_config.dart';
import 'package:flutter/material.dart';
import '../api_services/api_base_helper.dart';
import '../model/cart_item_model.dart';
import '../model/check_out_model.dart';
import '../model/invoice_model.dart';
import '../model/invoice_report_model.dart';
import '../model/product_wholsaler_model.dart';
import '../model/retailer_dashboard_model.dart';
import '../model/retailer_order_model.dart';
import '../model/wholesaler_dashboard_model.dart';


class ProductsController extends GetxController {
  var isLoading = false.obs;
  var productWholesalerList = ProductWholesalerListModel().obs;
  Future<ProductWholesalerListModel>getProductsWholesalerListApi({BuildContext? context,var search,var sort}) async {
    final url = "$productsWholesalerListUrl?search=$search&sort=$sort";
    var response = await ApiBaseHelper().getApiCall(context!,url);
    ProductWholesalerListModel modal = ProductWholesalerListModel.fromJson(response);
    productWholesalerList.value = modal;

    return modal;
  }

  var wholesalerProductList = ProductWholesalerListModel().obs;
  Future<ProductWholesalerListModel>getWholesalerProductListApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,wholesalerProductListUrl);
    ProductWholesalerListModel modal = ProductWholesalerListModel.fromJson(response);
    wholesalerProductList.value = modal;

    return modal;
  }

  Future<CartItemModel> getAddToCartApi({
    BuildContext? context,
    String? productId,
    var quantity,
    String? sellerId,

  }) async {
      Map<String, dynamic> body = {
        "productId": productId,
        "quantity": quantity,
        "sellerId": sellerId,
      };
      var response = await ApiBaseHelper().postApiCall(
        false,
        addCartUrl,
        context!,
        body,
      );

      CartItemModel modal = CartItemModel.fromJson(response);
      Fluttertoast.showToast(msg: modal.message??"",gravity: ToastGravity.CENTER);
      return modal;
  }
  var cartItemList = CartItemModel().obs;
  Future<CartItemModel>getCartItemUrl({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,getItemUrl);
    CartItemModel modal = CartItemModel.fromJson(response);
    cartItemList.value = modal;
    Fluttertoast.showToast(msg: modal.message??"",
    gravity: ToastGravity.CENTER
    );

    return modal;
  }

  Future<CartItemModel> getCartItemUpdateApi({
    BuildContext? context,
    String? productId,
    var quantity,

  }) async {
    Map<String, dynamic> body = {
      "itemId": productId,
      "quantityChange": quantity,
    };
    var response = await ApiBaseHelper().putApiCall(
      false,
      cartUpdateUrl,
      context!,
      body,
    );

    CartItemModel modal = CartItemModel.fromJson(response);
    Fluttertoast.showToast(msg: modal.message??"",
        gravity: ToastGravity.CENTER
    );
    return modal;
  }

  var checkoutData = CheckOutModel().obs;
  Future<CheckOutModel>getCheckOutApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,checkOutUrl);
    print("response>>>>${response}");
    CheckOutModel modal = CheckOutModel.fromJson(response);
   checkoutData.value = modal;

    return modal;
  }

  Future<CartItemModel> getPlaceOrderApi({
    BuildContext? context,
    String? addressId,

  }) async {
    Map<String, dynamic> body = {
      "addressId": addressId,
    };
    var response = await ApiBaseHelper().postApiCall(
      false,
      placeOrderUrl,
      context!,
      body,
    );

    CartItemModel modal = CartItemModel.fromJson(response);
    Fluttertoast.showToast(msg: modal.message??"",
        gravity: ToastGravity.CENTER
    );
    return modal;
  }
  var retailerOrderData = RetailerOrderModel().obs;
  Future<RetailerOrderModel>getRetailerOrderListApi({BuildContext? context,var from,var to}) async {
    final url = "$retailerOrderListUrl?fromDate=$from&toDate=$to";
    var response = await ApiBaseHelper().getApiCall(context!,url);

    RetailerOrderModel modal = RetailerOrderModel.fromJson(response);
    retailerOrderData.value = modal;

    return modal;
  }

  var wholesalerOrderData = RetailerOrderModel().obs;
  Future<RetailerOrderModel>getWholesalerOrderApi({BuildContext? context,var status}) async {
    final url = "$wholesalerOrderListUrl?status=$status";
    var response = await ApiBaseHelper().getApiCall(context!,url);
    RetailerOrderModel modal = RetailerOrderModel.fromJson(response);
    wholesalerOrderData.value = modal;
    return modal;
  }

  var retailerToWholesalerOrderData = RetailerOrderModel().obs;
  Future<RetailerOrderModel>getRetailerToWholesalerOrderApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,retailerToWholesalerOrderUrl);
    RetailerOrderModel modal = RetailerOrderModel.fromJson(response);
    retailerToWholesalerOrderData.value = modal;
    return modal;
  }

  var wholesalerDashboardData = WholesalerDashboardModel().obs;
  Future<WholesalerDashboardModel>getWholesalerDashboardApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,wholesalerDashboardUrl);
    WholesalerDashboardModel modal = WholesalerDashboardModel.fromJson(response);
    wholesalerDashboardData.value = modal;
    return modal;
  }
  var wholesalerInvoicedData = InvoiceModel().obs;
  Future<InvoiceModel>getWholesalerInvoiceApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,wholesalerInvoiceUrl);
    InvoiceModel modal = InvoiceModel.fromJson(response);
    wholesalerInvoicedData.value = modal;
    return modal;
  }

  var wholesalerInvoicedReportData = InvoiceReportModel().obs;
  Future<InvoiceReportModel>getWholesalerInvoiceReportApi({BuildContext? context,String? invoiceId}) async {
    String url = "$wholesalerInvoiceReportUrl/$invoiceId";
    var response = await ApiBaseHelper().getApiCall(context!,url);
    InvoiceReportModel modal = InvoiceReportModel.fromJson(response);
    wholesalerInvoicedReportData.value = modal;
    return modal;
  }

  var retailerDashboardData = RetailerDashboardModel().obs;
  Future<RetailerDashboardModel>getRetailerDashboardApi({BuildContext? context,String? invoiceId}) async {
    var response = await ApiBaseHelper().getApiCall(context!,retailerDashboardUrl);
    RetailerDashboardModel modal = RetailerDashboardModel.fromJson(response);
    retailerDashboardData.value = modal;
    return modal;
  }
}
