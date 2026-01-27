import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/custom_textFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title:   Row(
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, color: dark1BrownColor,),
            ),
            Expanded(
              child: text("edit_profile".tr,
                  textColor: dark1BrownColor,
                  isCentered: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  fontFamily: FontFamily.interBold
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
          child: Column(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.asset(AppImages.imgIcon, width: 150, height: 150, fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 32,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: brownColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("full_name".tr, fontWeight: FontWeight.w400, fontSize: 12, textColor: dark1BrownColor),
                    SizedBox(height: 10,),
                    CustomRoundTextField(
                      controller: nameController,
                      fillColor: white,
                      hintSize: 12,
                      hintText: "enter_name".tr,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: brownColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("phone_number".tr, fontWeight: FontWeight.w400, fontSize: 12, textColor: dark1BrownColor),
                    SizedBox(height: 10,),
                    CustomRoundTextField(
                      controller: phoneController,
                      fillColor: white,
                      hintSize: 12,
                      hintText: "+91 98765 43210",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: brownColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("email_address".tr, fontWeight: FontWeight.w400, fontSize: 12, textColor: dark1BrownColor),
                    SizedBox(height: 10,),
                    CustomRoundTextField(
                      controller: emailController,
                      fillColor: white,
                      hintSize: 12,
                      hintText: "rajesh.kumar@bakery.com",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: brownColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("gst_number".tr, fontWeight: FontWeight.w400, fontSize: 12, textColor: dark1BrownColor),
                    SizedBox(height: 10,),
                    CustomRoundTextField(
                      controller: gstController,
                      fillColor: white,
                      hintSize: 12,
                      hintText: "29ABCDE1234F1Z5",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(color: brownColor),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("shop_address".tr, fontWeight: FontWeight.w400, fontSize: 12, textColor: dark1BrownColor),
                    SizedBox(height: 10,),
                    CustomRoundTextField(
                      controller: shopAddressController,
                      fillColor: white,
                      hintSize: 12,
                      hintText: "Shop No. 45, MG Road, Bangalore - 560001, Karnataka",
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),

              CommonButton(
                  text: "save_changes".tr,
                  onPressed: (){},
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w600,
                color: dark1BrownColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
