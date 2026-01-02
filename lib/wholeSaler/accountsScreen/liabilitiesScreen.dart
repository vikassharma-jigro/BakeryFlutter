import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/accounts_controller.dart';

class Liabilitiesscreen extends StatefulWidget {
  const Liabilitiesscreen({super.key});

  @override
  State<Liabilitiesscreen> createState() => _LiabilitiesscreenState();
}

class _LiabilitiesscreenState extends State<Liabilitiesscreen> {
  final AccountsController accountsController = Get.put(AccountsController());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, color: dark1BrownColor),
            ),
            text(
              "liabilities".tr,
              isCentered: true,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.interBold,
              textColor: blackColor,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: dark1BrownColor),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(51),
            child: Image.asset(AppImages.imgIcon, width: 40, height: 40),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(
         () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Card(
                    elevation: .5,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 2),
                        ],
                        borderRadius: BorderRadius.circular(11),
                        gradient: LinearGradient(
                          begin: AlignmentGeometry.topLeft,
                          end: AlignmentGeometry.bottomRight,
                          colors: [Color(0XFFF5EFE7), Color(0XFFFAF8F5)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(
                                    "total_pending".tr,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: dark1BrownColor,
                                  ),

                                  Image.asset(AppImages.walletIcon,height: 40,),
                                ],
                              ),
                              text(
                                "€${accountsController.wholesalerAccountsData.value.liabilities?.totalLiabilities?.toStringAsFixed(2)}",
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                textColor: blackColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.group, color: dark1BrownColor),
                              SizedBox(width: 6),
                              text(
                                'total_payable'.tr,
                                textColor: dark1BrownColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // All retailers Details
                 /* Row(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        padding: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
                        decoration: BoxDecoration(
                          border: Border.all(color: darkBrownColor),
                          color: white,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppImages.shopHolder1Icon),
                            SizedBox(width: 10),
                            text(
                              "all_suppliers".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interRegular,
                              textColor: dark1BrownColor,
                            ),
                            Spacer(),
                            Icon(Icons.keyboard_arrow_down, color: dark1BrownColor),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: darkBrownColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.calendar_month, color: dark1BrownColor),
                      ),
                    ],
                  ),*/
                  SizedBox(height: 16),

                  // Short
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildFilter("all".tr, 0),
                        SizedBox(width: 10),
                        buildFilter("pending".tr, 1),
                        SizedBox(width: 10),
                        buildFilter("advance_pay".tr, 2),
                        SizedBox(width: 10),
                        buildFilter("Cancelled".tr, 3),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // List of Item appears
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: accountsController.wholesalerAccountsData.value.liabilities?.list?.length??0,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        var liabilitiesData = accountsController.wholesalerAccountsData.value.liabilities?.list?[index];
                        String iso = liabilitiesData?.createdAt??"";

                        String date = iso.split("T")[0];      // 2025-12-23
                        String time = iso.split("T")[1]
                            .split(".")[0];
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(11),
                            border: Border(
                              left: BorderSide(
                                color: liabilitiesData?.paymentStatus=="pending"?orangeColor:greenColor,
                                width: 4,
                              ),
                            ),
                            boxShadow: [BoxShadow(color: Colors.grey)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(
                                    liabilitiesData?.managerName??"",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamily.interBold,
                                    textColor: blackColor,
                                  ),
                                  SizedBox(width: 16,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: liabilitiesData?.paymentStatus=="pending"?paymentColor:greenColor.withOpacity(.2),
                                    ),
                                    child: text(liabilitiesData?.paymentStatus?.capitalizeFirst??"",
                                        fontSize: 12, fontWeight: FontWeight.w500,textColor: liabilitiesData?.paymentStatus=="pending"?redColor:greenColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              text("€${liabilitiesData?.totalAmount??""}", fontSize: 24, fontWeight: FontWeight.w700, fontFamily: FontFamily.interBold, textColor: blackColor),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Row(
                                    children: [
                                      Icon(Icons.watch_later, color: dark1BrownColor,),
                                      SizedBox(width: 10,),
                                      text(date, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                                    ],
                                  )),
                                  // Expanded(child: Row(
                                  //   children: [
                                  //     Icon(Icons.info, color: redColor),
                                  //     SizedBox(width: 10,),
                                  //     text("Due: 20 Dec 2024",
                                  //         fontSize: 12, fontWeight: FontWeight.w400,
                                  //         fontFamily: FontFamily.interRegular, textColor: redColor),
                                  //   ],
                                  // )),
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Image.asset(AppImages.paymentIcon, width: 30, height: 30,),
                                  SizedBox(width: 10,),
                                  text(liabilitiesData?.paymentMode?.capitalizeFirst??"", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget buildFilter(String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        accountsController.getWholesalerAccountsApi(context: context,assetSort: "",liabilityPaymentStatus:selectedIndex==0?"":selectedIndex==1?"pending":selectedIndex==2?"paid":"cancelled");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? darkBrownColor : white,
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: darkBrownColor),
        ),
        child: text(
          label,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.interRegular,
          textColor: isSelected ? white : blackColor,
        ),
      ),
    );
  }
}
