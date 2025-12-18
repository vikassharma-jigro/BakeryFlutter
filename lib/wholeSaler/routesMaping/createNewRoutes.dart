import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class Createnewroutes extends StatefulWidget {
  Createnewroutes({super.key});

  @override
  State<Createnewroutes> createState() => _CreatenewroutesState();
}

class _CreatenewroutesState extends State<Createnewroutes> {
  var controller1 = TextEditingController();

  var controller2 = TextEditingController();

  bool isValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBrownColor.withOpacity(1),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, color: dark1BrownColor),
            ),
            text(
              "create_new_route".tr,
              isCentered: true,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.interBold,
              textColor: dark1BrownColor,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check, color: dark1BrownColor),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("route_name".tr, fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                    SizedBox(height: 10,),
                    TextField(
                      controller: controller1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hint: Text("e.g., Route A / Morning Route"),
                      ),
                    ),
                    SizedBox(height: 20,),
                    text("select_delivery_zone".tr, fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("Choose delivery zone", fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    text("estimated_delivery".tr, fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text("--:-- --", fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                          Icon(Icons.watch_later),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    text("color_tag".tr, fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (index){
                        return Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
        
              text("add_retailers_route".tr, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: FontFamily.interBold, textColor: dark1BrownColor),
              SizedBox(height: 20,),
              TextField(
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  fillColor: white,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hint: Text("search_retailer_pincode".tr),
                ),
              ),
              SizedBox(height: 20,),
        
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index){
                    return Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: dark1BrownColor,
                      ),
                      child: text("filter_pincode".tr, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: FontFamily.interRegular),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20,),
        
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text("Sunrise Bakery", fontSize: 16, fontWeight: FontWeight.w600, textColor: brownColor),
                              text("Main Street Shop", fontSize: 14, fontWeight: FontWeight.w400, textColor: blackColor),
                              text("Pincode: 110001 • 2.3 km away", fontSize: 12, fontWeight: FontWeight.w400, textColor: darkGreyColor),
                            ],
                          )),
                          Spacer(),
                          Expanded(child:
                          Container(
                              child: Checkbox(
                                value: isValue,
                                activeColor: dark1BrownColor,
                                onChanged: (value) {
                                  setState(() {
                                    isValue = value!;
                                  });
                                },
                              )
                          )),
                        ],
                      ),
                    );
                  }),
              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("3 Retailers Selected", fontSize: 16, fontWeight: FontWeight.w600, textColor: brownColor),
                        text("Sunrise Bakery, Fresh Bread Corner, \nCity Bread Hub", fontSize: 14, fontWeight: FontWeight.w400, textColor: blackColor),
                      ],
                    ),
                    Container(
                      width: 40,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                        child: text("3"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Image.asset("assets/images/div-9.png", width: double.infinity,),
              SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 41, vertical: 12),
                decoration: BoxDecoration(
                  color: dark1BrownColor,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: text("save_route".tr, fontSize: 16, fontWeight: FontWeight.w500, isCentered: true),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 41, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: dark1BrownColor)
                ),
                child: text("cancel".tr, fontSize: 16, fontWeight: FontWeight.w500, isCentered: true, textColor: dark1BrownColor),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
