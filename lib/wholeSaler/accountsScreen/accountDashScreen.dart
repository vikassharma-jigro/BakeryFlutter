import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/wholeSaler/accountsScreen/assetsScreen.dart';
import 'package:bakerybrown/wholeSaler/accountsScreen/liabilitiesScreen.dart';
import 'package:bakerybrown/wholeSaler/accountsScreen/retailersLedgerScreen.dart';
import 'package:bakerybrown/widgets/wholesalerDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class Accountdashscreen extends StatefulWidget {
  const Accountdashscreen({super.key});

  @override
  State<Accountdashscreen> createState() => _AccountdashscreenState();
}

class _AccountdashscreenState extends State<Accountdashscreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: text(
          "accounts_dashboard".tr,
          isCentered: true,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.interBold,
          textColor: blackColor,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(Retailersledgerscreen());
                    },
                    child: WholeSalerDashboard.AccountsDashBoard(
                      Icons.arrow_downward,
                      "€2,45,000",
                      "Amount to receive",
                      greenColor,
                      context,
                    ),
                  ),
                  WholeSalerDashboard.AccountsDashBoard(
                    Icons.arrow_upward,
                    "€1,89,500",
                    "Amount to pay supplier",
                    Colors.red,
                    context,
                  ),
                ],
              ),
              SizedBox(height: 6),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WholeSalerDashboard.AccountsDashBoard(
                    Icons.check,
                    "€8,75,000",
                    "Completed collections",
                    greenColor,
                    context,
                  ),
                  WholeSalerDashboard.AccountsDashBoard(
                    Icons.check_circle,
                    "€6,42,300",
                    "Factory payments done",
                    Colors.blue,
                    context,
                  ),
                ],
              ),
              SizedBox(height: 16),
        
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  children: [
                    Expanded(child: buildFilter("transactions".tr, 0)),
                     Expanded(child: buildFilter("assets".tr, 1)),
                    Expanded(child: buildFilter("liabilities".tr, 2)),
                  ],
                ),
              ),
              SizedBox(height: 16),
        
              text(
                "recent_transactions".tr,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.interBold,
                textColor: blackColor,
              ),
              SizedBox(height: 16),
        
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(17),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              "Sweet Treats Retail",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.interBold,
                              textColor: blackColor,
                            ),
                            text(
                              "€12,500",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.interBold,
                              textColor: blackColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(
                              "UPI • Today, 2:30 PM",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.interRegular,
                              textColor: darkGreyColor.withOpacity(0.5),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: greenColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: text(
                                "Paid",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.interRegular,
                                textColor: greenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilter(String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if( selectedIndex == 1){
            Get.to(Assetsscreen());
          }
          if(selectedIndex == 2){
            Get.to(Liabilitiesscreen());
          }
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? darkBrownColor : white,
            borderRadius: BorderRadius.circular(11),
            //border: Border.all(color: darkBrownColor),
          ),
          child: text(
            label,
            isCentered: true,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            textColor: isSelected ? white : blackColor,
          ),
        ),
    );
  }
}
