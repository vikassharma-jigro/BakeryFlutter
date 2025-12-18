import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/wholeSaler/routesMaping/createNewRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class Routesandmapping extends StatelessWidget {
  const Routesandmapping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrownColor.withOpacity(1),
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
              "routes_mapping".tr,
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
            icon: Icon(Icons.add, color: dark1BrownColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: dark1BrownColor),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/section.png", fit: BoxFit.cover, width: double.infinity,),
        
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 6,
                itemBuilder: (_, index){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text("Route A – North Zone", fontSize: 16, fontWeight: FontWeight.w700, textColor: dark1BrownColor),
                              Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(AppImages.shopHolder1Icon),
                                        text("12 Retailers", textColor: darkBrownColor, fontSize: 12, fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.watch_later, color: darkBrownColor,),
                                        text("2.5 hrs", textColor: darkBrownColor, fontSize: 12, fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
        
                            ],
                          ),
                          Spacer(),
                          Image.asset("assets/images/Vector.png"),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        decoration: BoxDecoration(
                          color: dark1BrownColor,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: text("view_route_details".tr, fontSize: 14, fontWeight: FontWeight.w600, isCentered: true),
                      )
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(Createnewroutes());
          },
        backgroundColor: dark1BrownColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, color: white,),
      ),
    );
  }
}
