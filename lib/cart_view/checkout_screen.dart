import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../api_services/api_config.dart';
import '../app_utils/custom_textFiled.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/product_controller.dart';




class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}


class _CheckoutScreenState extends State<CheckoutScreen> {

  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    Future.microtask(() {
      productsController.getCheckOutApi(context: context );
    },);
    super.initState();
  }
  List<Map<String, dynamic>> orderList = [
    {
      "name": "Jan 15, 2024 • 9:30 AM",
      "orderID": "#ORD-2461",
      "price": "€1,240",
      "orderStatus": "Delivered",
      "item":"32 Items",
      "itemName":"Cakes, Cookies, Donuts"
    },
    {
      "name": "Jan 14, 2024 • 2:15 PM",
      "orderID": "#ORD-2459",
      "price": "€1,240",
      "orderStatus": "Received",
      "item":"10 Items",
      "itemName":"Bagels, Pastries"
    },
    {
      "name": "Jan 13, 2024 • 11:45 AM",
      "orderID": "#ORD-2460",
      "price": "€1,240",
      "orderStatus": "Received",
      "item":"13 Items",
      "itemName":"Sourdough, Rolls"
    },
    {
      "name": "Jan 12, 2024 • 11:30 AM",
      "orderID": "#ORD-2434",
      "price": "€1,240",
      "orderStatus": "Received",
      "item":"22 Items",
      "itemName":"Baguettes, Cupcakes"

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55), // 👈 Yaha height set karo
        child: Container(
          color: white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios,color: brownColor,)),
                      Expanded(
                        child: text(
                          "Checkout",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: FontFamily.interBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "Delivery Address",
                      textColor: brownColor,
                      isCentered: true,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: FontFamily.interSansMedium,
                    ),
                    Row(
                      children: [
                        text(
                          productsController.checkoutData.value.deliveryAddress??"",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: FontFamily.interRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                //margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "Order Summary",
                      textColor: darkBrownColor,
                      isCentered: true,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: FontFamily.interSansMedium,
                    ),
                    SizedBox(height: 20,),
                    ListView.builder(
                      itemCount: productsController.checkoutData.value.orderSummary?.length??0,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                       var checkOutData = productsController.checkoutData.value.orderSummary?[index];
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                        child: CachedNetworkImage(
                                          imageUrl: "$IP${checkOutData?.img??""}",width: 100,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        )),

                                    SizedBox(width: 20,),
                                    Column(
                                      children: [
                                        text(
                                          checkOutData?.name??"",
                                          textColor: darkBrownColor,
                                          isCentered: true,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: FontFamily.interSansMedium,
                                        ),
                                        text(
                                          "Qty : ${checkOutData?.quantity.toString()??""}",
                                          textColor: lightGrey,
                                          isCentered: true,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          fontFamily: FontFamily.interSansMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                text(
                                  "€${checkOutData?.price.toString()??""}",
                                  textColor: darkBrownColor,
                                  isCentered: true,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: FontFamily.interSansMedium,
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider()
                          ],
                        );
                      },),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "Bill Details",
                      textColor: darkBrownColor,
                      isCentered: true,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: FontFamily.interSansMedium,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "Item Total",
                          textColor: lightTextColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                        text(
                          "€${productsController.checkoutData.value.billDetails?.itemTotal.toString()??""}",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "Product price",
                          textColor: lightTextColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                        text(
                          "€${productsController.checkoutData.value.billDetails?.itemTotal.toString()??""}",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "Delivery Charge",
                          textColor: lightTextColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                        text(
                          "€${productsController.checkoutData.value.billDetails?.deliveryCharge!=null?productsController.checkoutData.value.billDetails?.deliveryCharge.toString()??"0":"0"}",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "Taxes & Fees",
                          textColor: lightTextColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                        text(
                          "€${productsController.checkoutData.value.billDetails?.tax.toString()??""}",
                          textColor: brownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(color: darkBrownColor,),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                          "Grand Total",
                          textColor: darkBrownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: FontFamily.interBold,
                        ),
                        text(
                          "€${productsController.checkoutData.value.billDetails?.grandTotal.toString()??""}",
                          textColor: dark1BrownColor,
                          isCentered: true,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: FontFamily.interBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CommonButton(
                text: "Place Order",
                color: brownColor,
                onPressed: () {

                },
                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,
                textColor: white,fontSize: 14,),
            ],
          ),
        ),
      ),

    );
  }

}
