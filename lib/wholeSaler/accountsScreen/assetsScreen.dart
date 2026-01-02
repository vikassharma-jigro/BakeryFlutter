import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/accounts_controller.dart';

class Assetsscreen extends StatefulWidget {
  const Assetsscreen({super.key});

  @override
  State<Assetsscreen> createState() => _AssetsscreenState();
}

class _AssetsscreenState extends State<Assetsscreen> {
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
              "assets".tr,
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 37),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.all(26),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: grey200Color, blurRadius: 2),
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
                                "€${accountsController.wholesalerAccountsData.value.assets?.totalRetailerPendingAmount??""}",
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
                                'From ${accountsController.wholesalerAccountsData.value.assets?.totalRetailersPendingCount??""} retailers',
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
                  Row(
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
                              "all_retailers".tr,
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
                  ),
                  SizedBox(height: 16),

                  // Short
                  Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(color: darkBrownColor),
                    ),
                    child: Row(
                      children: [
                        text(
                          "short_by".tr,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: dark1BrownColor,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=0;
                            });

                            accountsController.getWholesalerAccountsApi(context: context,assetSort: "desc");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: selectedIndex==0?dark1BrownColor:lightBrownColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: text(
                              "high_low".tr,
                              fontSize: 12,
                              textColor: selectedIndex==0?white:lightTextColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interRegular,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=1;
                            });
                            accountsController.getWholesalerAccountsApi(context: context,assetSort: "asc");
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: selectedIndex==1?dark1BrownColor:lightBrownColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: text(
                              "low_high".tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interRegular,
                              textColor: selectedIndex==1?white:lightTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // List of Item appears
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: accountsController.wholesalerAccountsData.value.assets?.list?.length??0,
                      itemBuilder: (context, index){
                      var assetsData = accountsController.wholesalerAccountsData.value.assets?.list?[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(11),
                            boxShadow: [BoxShadow(color: Colors.grey)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  text(
                                    assetsData?.shopName??"",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: FontFamily.interBold,
                                    textColor: blackColor,
                                  ),
                                  SizedBox(width: 16,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: redColor.withOpacity(.2),
                                    ),
                                    child: text("OVERDUE".tr, fontSize: 12, fontWeight: FontWeight.w500,textColor: redColor),
                                  ),
                                ],
                              ),
                              text("€${assetsData?.totalPending??""}", fontSize: 24, fontWeight: FontWeight.w700, fontFamily: FontFamily.interBold, textColor: blackColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.watch_later, color: dark1BrownColor,),
                                        text("Last: 12 Dec 2024", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                                      ],
                                    ),
                                  )),
                                  Expanded(child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.info, color: Colors.red,),
                                        text("Due: 20 Dec 2024", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: Colors.red),
                                      ],
                                    ),
                                  )),
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Image.asset(AppImages.paymentIcon, width: 30, height: 30,),
                                  SizedBox(width: 10,),
                                  text(assetsData?.lastPaidMode??"Manual", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
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
}
