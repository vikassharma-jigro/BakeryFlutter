import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';

class Retailersorderscreen extends StatefulWidget {
  const Retailersorderscreen({super.key});

  @override
  State<Retailersorderscreen> createState() => _RetailersorderscreenState();
}

class _RetailersorderscreenState extends State<Retailersorderscreen> {
  
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrownColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios,color: dark1BrownColor,)),
            Expanded(
              child: text(
                "retailer_orders".tr,
                isCentered: true,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.interBold,
                textColor: dark1BrownColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Retailers Card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index){
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.27,
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Wrap(
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * 0.03,
                                  bottom: MediaQuery.sizeOf(context).height * 0.01,
                                ),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(AppImages.catalogIcon),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: double.infinity,
                                child: text(
                                  "42",
                                  textColor: dark1BrownColor,
                                  fontFamily: FontFamily.interRegular,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            text(
                              "total_orders".tr,
                              textColor: dark1BrownColor,
                              fontFamily: FontFamily.interRegular,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
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
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 82, vertical: 11),
                          decoration: BoxDecoration(
                            color: btnColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month, color: dark1BrownColor,),
                              text("this_week".tr, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: btnColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(Icons.menu, color: dark1BrownColor,),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildFilter('all'.tr, 0),
                        buildFilter('placed'.tr, 1),
                        buildFilter('packed'.tr, 2),
                        buildFilter('shipped'.tr, 3),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
        
              Column(
                children: List.generate(6, (index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            text("Order #ORD-2847", textColor: dark1BrownColor, fontWeight: FontWeight.w500, fontSize: 12),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.yellow.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: text("placed".tr, textColor: darkBrownColor, fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(height: 7,),
                        text("whole_wheat_bread".tr, textColor: dark1BrownColor, fontWeight: FontWeight.w600, fontSize: 14, fontFamily: FontFamily.interRegular),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppImages.catalogIcon),
                                  SizedBox(width: 7,),
                                  text("50 unit", textColor: blackColor, fontSize: 14, fontWeight: FontWeight.w500),
                                ],
                              ),
                            ),
                            SizedBox(width: 16,),
        
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month, color: dark1BrownColor,),
                                  SizedBox(width: 7,),
                                  text("Dec 28, 2024", textColor: dark1BrownColor, fontSize: 14, fontWeight: FontWeight.w500),
                                ],
                              ),
                            ),
                            Spacer(),
        
                            Icon(Icons.arrow_forward_ios_outlined, color: dark1BrownColor, size: 18,),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              )
        
        
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilter(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
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
