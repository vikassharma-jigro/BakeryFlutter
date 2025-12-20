import 'dart:convert';
import 'dart:io';
import 'package:bakerybrown/model/auth_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:bakerybrown/api_services/api_config.dart';
import 'package:flutter/material.dart';
import '../api_services/api_base_helper.dart';
import '../model/cart_item_model.dart';
import '../model/check_out_model.dart';
import '../model/product_wholsaler_model.dart';


class ProductsController extends GetxController {
  var isLoading = false.obs;
  var productWholesalerList = ProductWholesalerListModel().obs;
  Future<ProductWholesalerListModel>getProductsWholesalerListApi({BuildContext? context}) async {
    var response = await ApiBaseHelper().getApiCall(context!,productsWholesalerListUrl);
    print("response>>>>${response}");
    ProductWholesalerListModel modal = ProductWholesalerListModel.fromJson(response);
    productWholesalerList.value = modal;

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
    print("response>>>>${response}");
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

}
