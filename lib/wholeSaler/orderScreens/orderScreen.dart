import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/wholeSaler/orderScreens/retailersOrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../widgets/wholesalerDashboard.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

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
      body: SingleChildScrollView(
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
                      "in_transit".tr,
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
              SizedBox(height: 29),

              ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return WholeSalerDashboard.OrdersDetailsCard(
                    AppImages.homeIcon,
                    "#ORD-2024-001",
                    "Fresh Baguettes × 50",
                    "Sunrise Bakery • SB001",
                    "Nov 27, 2024",
                    "Placed",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
