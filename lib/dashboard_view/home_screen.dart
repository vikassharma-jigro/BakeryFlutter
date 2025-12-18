import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../app_utils/app_images.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import 'package:get/get.dart';

import '../cart_view/product_list_screen.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: blackColor, // <-- Drawer icon color
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                text("hello_retailer".tr,textColor: blackColor,fontFamily: FontFamily.interBold,fontSize: 24),
                    text("welcome_bakery".tr,textColor: darkGreyColor,fontFamily: FontFamily.interRegular,
                    fontWeight: FontWeight.w400,fontSize: 14),
              ],
            ),
            Image.asset(AppImages.homeIcon,height: 50,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  // Get.to(OutstandingBalanceScreen());
                },
                child: Card(
                  color: softIvoryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                          "pending_payments".tr,
                          textColor: darkGreyColor,
                          fontSize: 14,
                          fontFamily: FontFamily.interSansMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              "2,450",
                              textColor: darkBrownColor,
                              fontSize: 24,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w400,
                            ),
                            Image.asset(AppImages.walletIcon,height: 40,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                       // Get.to(RerailerAdvanceAmountScreen());
                      },
                      child: Card(
                        color: softIvoryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.rOrdersIcon,height: 50,),
                              SizedBox(height: 10,),
                              text(
                                "recent_orders".tr,
                                textColor: darkGreyColor,
                                fontSize: 12,
                                fontFamily: FontFamily.interSansMedium,
                                fontWeight: FontWeight.w500,
                              ),
                              text(
                                "24",
                                textColor: darkBrownColor,
                                fontSize: 20,
                                fontFamily: FontFamily.interBold ,
                                fontWeight: FontWeight.w600,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                       // Get.to(CurrentAmountCommissionScreen());
                      },
                      child: Card(
                        color: softIvoryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.starIcon,height: 50,),
                                 SizedBox(height: 10,),
                              text(
                                "top_selling".tr,
                                textColor: darkGreyColor,
                                fontSize: 12,
                                fontFamily: FontFamily.interSansMedium,
                                fontWeight: FontWeight.w500,
                              ),
                              text(
                                "top_selling".tr,
                                textColor: darkBrownColor,
                                fontSize: 20,
                                fontFamily: FontFamily.interBold ,
                                fontWeight: FontWeight.w600,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 15,),
              text(
                "quick_actions".tr,
                textColor: blackColor,
                fontSize: 18,
                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Get.to(ProductListScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: darkBrownColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: white,),
                      text(
                        "place_order".tr,
                        textColor: white,
                        fontSize: 18,
                        fontFamily: FontFamily.interBold,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: darkBrownColor)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history,color: brownColor,),
                    text(
                      "view_history".tr,
                      textColor: brownColor,
                      fontSize: 18,
                      fontFamily: FontFamily.interBold,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              text(
                "recent_activity".tr,
                textColor: blackColor,
                fontSize: 18,
                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,
              ),
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    // Get.to(OutstandingBalanceScreen());
                  },
                  child: Card(
                    color: softIvoryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppImages.walletIcon,height: 40,),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    "Order #1247 placed",
                                    textColor: blackColor,
                                    fontSize: 16,
                                    fontFamily: FontFamily.interSansMedium,
                                    fontWeight: FontWeight.w500,
                                  ),text(
                                    "2 hours ago",
                                    textColor: darkGreyColor,
                                    fontSize: 16,
                                    fontFamily: FontFamily.interSansMedium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}

