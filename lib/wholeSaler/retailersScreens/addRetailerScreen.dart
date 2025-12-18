import 'dart:io';

import 'package:bakerybrown/widgets/searchTextFiled.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/image_picker_mixin.dart';
import '../../app_utils/showAlertMessage.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/auth_controller.dart';

class Addretailerscreen extends StatefulWidget {
  Addretailerscreen({super.key});

  @override
  State<Addretailerscreen> createState() => _AddretailerscreenState();
}

class _AddretailerscreenState extends State<Addretailerscreen>with ImagePickerMixin {
  var shopNameController = TextEditingController();
  var ownerNameController = TextEditingController();
  var primaryPhoneController = TextEditingController();
  var altPhoneController = TextEditingController();
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var landmarkController = TextEditingController();
  var pincodeController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var gstNumberController = TextEditingController();
  var aadhaarNumberController = TextEditingController();
  var timerInputController = TextEditingController();
  var textCodeController = TextEditingController();
  File? aadhaarFront;
  File? aadhaarBack;
  File? licenseFile;
  File? ownerPhoto;
  File? shopImage;
  bool isValue = false;
  XFile? file;
  final AuthController authController = Get.put(AuthController());




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
                onTap: (){
                 Get.back();
                },
                child: Icon(Icons.arrow_back_ios,color: brownColor,)),
            Expanded(
              child: text(
                "add_new_retailer".tr,
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 21),
          child: Column(
            children: [
              // Basic Retailer Detail
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "basic_retailer_details".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: FontFamily.interBold,
                      textColor: dark1BrownColor,
                    ),
                    SizedBox(height: 16),

                    text(
                      'retailer_shop_name'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      shopNameController,
                      white,
                      white,
                      "enter_shop_name".tr,
                      false,
                      Colors.grey,
                      false,
                    ),
                    SizedBox(height: 16),

                    text(
                      'owner_name'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      ownerNameController,
                      white,
                      white,
                      "enter_owner_name".tr,
                      false,
                      Colors.grey,
                      false,
                    ),
                    SizedBox(height: 16),

                    text(
                      'primary_phone_number'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      primaryPhoneController,
                      white,
                      white,
                      "enter_phone_number".tr,
                      false,
                      Colors.grey,
                      false,
                        keyBoardInput: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ]
                    ),
                    SizedBox(height: 16),

                    text(
                      'alternate_phone'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      altPhoneController,
                      white,
                      white,
                      "enter_alternate_number".tr,
                      false,
                      Colors.grey,
                      false,
                        keyBoardInput: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ]

                    ),
                    SizedBox(height: 16),

                    text(
                      'email'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      mailController,
                      white,
                      white,
                      "enter_email_address".tr,
                      false,
                      Colors.grey,
                      false,
                      keyBoardInput: TextInputType.emailAddress

                    ),

                    SizedBox(height: 16),

                    text(
                      'password'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      passwordController,
                      white,
                      white,
                      "enter_password".tr,
                      false,
                      Colors.grey,
                      false,
                      //keyBoardInput: TextInputType.emailAddress

                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Shop Address Details
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "shop_address_details".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: FontFamily.interBold,
                      textColor: dark1BrownColor,
                    ),
                    SizedBox(height: 16),

                    text(
                      'full_address'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      addressController,
                      white,
                      white,
                      "enter_complete_address".tr,
                      false,
                      Colors.grey,
                      true,
                    ),
                    SizedBox(height: 16),

                    text(
                      'landmark'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      landmarkController,
                      white,
                      white,
                      "enter_landmark".tr,
                      false,
                      Colors.grey,
                      false,
                    ),
                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                  'pincode'.tr,
                                  fontFamily: FontFamily.interRegular,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: darkBrownColor,
                                ),
                                SizedBox(height: 5),
                                SearchTextField(
                                  pincodeController,
                                  white,
                                  white,
                                  "pincode".tr,
                                  false,
                                  Colors.grey,
                                  false,
                                  keyBoardInput: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(6),
                                    ]
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                  'city'.tr,
                                  fontFamily: FontFamily.interRegular,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: darkBrownColor,
                                ),
                                SizedBox(height: 5),
                                SearchTextField(
                                  cityController,
                                  white,
                                  white,
                                  "city".tr,
                                  false,
                                  Colors.grey,
                                  false,
                                ),
                                SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    text(
                      'state'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      stateController,
                      white,
                      white,
                      "enter_state".tr,
                      false,
                      Colors.grey,
                      false,
                    ),
                    SizedBox(height: 16),

                    text(
                      'Text Code',
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      textCodeController,
                      white,
                      white,
                      "Enter text code",
                      false,
                      Colors.grey,
                      false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // KYC Details
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "kyc_documents".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: FontFamily.interBold,
                      textColor: dark1BrownColor,
                    ),
                    SizedBox(height: 16),

                    text(
                      'Owner Identity Card Deatils'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    // SizedBox(height: 5),
                    // SearchTextField(
                    //   aadhaarNumberController,
                    //   white,
                    //   white,
                    //   "enter_aadhar_number".tr,
                    //   false,
                    //   Colors.grey,
                    //   false,
                    // ),
                    SizedBox(height: 16),

                    // Upload Aadhaar
                    InkWell(
                      onTap: () {
                        showImagePickerOptions(
                          onImagePicked: (file) {
                            setState(() {
                              aadhaarFront = file;
                            });
                          },
                        );
                      },
                      child: aadhaarFront != null
                          ? Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                            aadhaarFront!,
                            height: 100,
                            width: 300,
                            fit: BoxFit.cover,),
                            ),
                          )
                          :Container(
                        padding: EdgeInsets.symmetric(horizontal: 34, vertical: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: white,
                          border: Border.all(color: darkBrownColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 👇 If image exists → show image
                             Icon(Icons.upload_file_rounded, color: darkBrownColor),

                            SizedBox(width: 12),

                            text(
                               'upload_identity_card'.tr
                                  , // file name show
                              fontFamily: FontFamily.interRegular,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: darkBrownColor,
                              //overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Upload Aadhaar
                    InkWell(
                      onTap: () {
                        showImagePickerOptions(
                          onImagePicked: (file) {
                            setState(() {
                              aadhaarBack = file;
                            });
                          },
                        );
                      },
                      child: aadhaarBack != null
                          ? Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            aadhaarBack!,
                            height: 100,
                            width: 300,
                            fit: BoxFit.cover,),
                        ),
                      )
                          :Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: white,
                          border: Border.all(color: darkBrownColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload_file_rounded,
                              color: darkBrownColor,
                            ),
                            SizedBox(width: 12),
                            text(
                              'upload_tax_code'.tr,
                              fontFamily: FontFamily.interRegular,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: darkBrownColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Shop Information
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "shop_information".tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: FontFamily.interBold,
                      textColor: dark1BrownColor,
                    ),
                    SizedBox(height: 16),

                    text(
                      'shop_image'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(11),
                        color: darkBrownColor,
                      ),
                      child: InkWell(
                        onTap: (){
                          showImagePickerOptions(
                            onImagePicked: (file) {
                              setState(() {
                                shopImage = file;
                              });
                            },
                          );
                        },
                        child:  shopImage != null
                            ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              shopImage!,
                              height: 100,
                              width: 300,
                              fit: BoxFit.cover,),
                          ),
                        )
                            :Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: EdgeInsets.all(11),
                          child: Column(
                            children: [
                              Icon(
                                Icons.camera_enhance,
                                color: darkBrownColor,
                                size: 38,
                              ),
                              SizedBox(height: 10),
                              text(
                                'upload_shop_image'.tr,
                                fontFamily: FontFamily.interRegular,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                textColor: darkBrownColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    text(
                      'shop_timing'.tr,
                      fontFamily: FontFamily.interRegular,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textColor: darkBrownColor,
                    ),
                    SizedBox(height: 5),
                    SearchTextField(
                      timerInputController,
                      white,
                      white,
                      "e.g., 9:00 AM - 9:00 PM",
                      false,
                      brownColor,
                      false,
                    ),
                    SizedBox(height: 16),

                    Row(
                      children: [
                        text(
                          'retailer_active'.tr,
                          fontFamily: FontFamily.interBold,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: darkBrownColor,
                        ),
                        Spacer(),

                        Switch(
                          value: isValue,
                          activeThumbColor: darkBrownColor,
                          inactiveThumbColor: white,
                          onChanged: (value) {
                            setState(() {
                              isValue = value;
                              print("statyus>>>${isValue}");
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              
              CommonButton(text: "save_retailer".tr,
                onPressed: () {
                  if (shopNameController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter shop name");
                    return;
                  } else if (ownerNameController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter owner name");
                    return;
                  } else if (primaryPhoneController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter primary phone number");
                    return;
                  } else if (mailController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter email address");
                    return;
                  } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$')
                      .hasMatch(mailController.text.trim())) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please enter valid Gmail address");
                    return;
                  }else if (passwordController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter password");
                    return;
                  } else if (addressController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter address");
                    return;
                  } else if (pincodeController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter pincode");
                    return;
                  } else if (cityController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter city");
                    return;
                  } else if (stateController.text.isEmpty) {
                    ShowAlertDialog().showErrorAlert(
                        context, "Please Enter state");
                    return;
                  } else {
                    authController.getAds(context: context,
                        password: passwordController.text,
                        textCode: textCodeController.text,
                        email: mailController.text,address: {
                          "addressLine": addressController.text,"pincode": pincodeController.text,
                          "city": cityController.text,"state": stateController.text,"landmark":landmarkController.text,
                        },
                        retailerDetails: {"shopName" : shopNameController.text, "alternatePhone":altPhoneController.text,
                          "shopTiming":timerInputController.text,},
                        department: "sales",
                        //joiningDate: timerInputController.text,
                        name: ownerNameController.text,phone: primaryPhoneController.text,
                        role: "retailer",
                        status: isValue==true?"active":"inactive",
                        adharBackPhoto: aadhaarBack,
                        adharFrontPhoto: aadhaarFront,
                        shopImage: shopImage
                    ).then((value) {

                     Navigator.pop(context);
                    },);
                  }
                },

                fontFamily: FontFamily.interBold, fontWeight: FontWeight.w600, color: dark1BrownColor,),
            ],
          ),
        ),
      ),
    );
  }
}
