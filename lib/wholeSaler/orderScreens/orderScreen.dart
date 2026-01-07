import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/wholeSaler/orderScreens/retailersOrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/product_controller.dart';
import '../../widgets/wholesalerDashboard.dart';


class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  final ProductsController productsController = Get.put(ProductsController());
  int selectedIndex = 0;

  @override
  void initState() {
    productsController.getWholesalerOrderApi(context: context,status: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        title: text(
          "orders".tr,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.interBold,
          textColor: dark1BrownColor,
        ),
        actions: [
          SvgPicture.asset(AppImages.notificationWholesaler),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(AppImages.imgIcon, width: 50, height: 50),
          ),
        ],
      ),
      body: Obx(
              () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WholeSalerDashboard.OrderScreenCards(
                          AppImages.cartIcon,
                          "247",
                          "orders".tr,
                          "total".tr,
                          dark1BrownColor,
                        ),
                      ),
                      Expanded(
                        child: WholeSalerDashboard.OrderScreenCards(
                          AppImages.catalogIcon,
                          "89",
                          "ready".tr,
                          "packed".tr,
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WholeSalerDashboard.OrderScreenCards(
                          AppImages.truckSvgIcon,
                          "156",
                          "orders".tr,
                          "shipped".tr,
                          Colors.deepOrange,
                        ),
                      ),
                      Expanded(
                        child: WholeSalerDashboard.OrderScreenCards(
                          AppImages.checkSvgIcon,
                          "189",
                          "delivered".tr,
                          "complete".tr,
                          greenColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 23),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Retailersorderscreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.group, color: dark1BrownColor),
                          SizedBox(width: 10),
                          text(
                            "retailer_orders_reports".tr,
                            textColor: dark1BrownColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.interBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      children: [
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.symmetric(horizontal: 82, vertical: 11),
                        //       decoration: BoxDecoration(
                        //         color: btnColor.withOpacity(0.4),
                        //         borderRadius: BorderRadius.circular(21),
                        //       ),
                        //       child: Row(
                        //         children: [
                        //           Icon(Icons.calendar_month, color: dark1BrownColor,),
                        //           text("this_week".tr, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                        //         ],
                        //       ),
                        //     ),
                        //     Spacer(),
                        //     Container(
                        //       padding: EdgeInsets.all(12),
                        //       decoration: BoxDecoration(
                        //         color: btnColor.withOpacity(0.4),
                        //         borderRadius: BorderRadius.circular(50),
                        //       ),
                        //       child: Icon(Icons.menu, color: dark1BrownColor,),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildFilter('all'.tr, 0),
                            buildFilter('Dispatched'.tr, 1),
                            buildFilter('packed'.tr, 2),
                            buildFilter('Delivered'.tr, 3),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 29),

                  productsController.wholesalerOrderData.value.count==0?
                      Column(
                        children: [
                          Center(child: Image.asset(AppImages.dataNotFoundIcon,height: 100,)),
                          SizedBox(height: 20,),
                          text("Data Not Found", fontSize: 16, fontWeight: FontWeight.w600, fontFamily: FontFamily.interBold, textColor: dark1BrownColor),

                        ],
                      )
                      :ListView.builder(
                    shrinkWrap: true,
                    itemCount: productsController.wholesalerOrderData.value.data?.length??0,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      var wholesalerOrderData = productsController.wholesalerOrderData.value.data?[index];
                      String iso = wholesalerOrderData?.createdAt??"";

                      String date = iso.split("T")[0];      // 2025-12-23
                      // String time = iso.split("T")[1]
                      //     .split(".")[0];
                      return WholeSalerDashboard.OrdersDetailsCard(
                        AppImages.homeIcon,
                        wholesalerOrderData?.Id??"",
                        wholesalerOrderData?.quantity.toString()??"",
                        wholesalerOrderData?.productName??"",
                        date,
                        wholesalerOrderData?.status??"",
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  Widget buildFilter(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        productsController.getWholesalerOrderApi(context: context,
            status:selectedIndex==0?"":selectedIndex==1?"dispatched":selectedIndex==2?"packed":"delivered");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selectedIndex == index ? darkBrownColor : btnColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(21),
        ),
        child: text(
          label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: selectedIndex == index ? white : dark1BrownColor,
        ),
      ),
    );
  }
}

