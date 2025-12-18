
import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../auth_view/login_screen.dart';
import '../getx_controller/auth_controller.dart';
import '../main.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    Future.microtask(() {
      authController.getProfileApi(context: context,status: authController.authModel.value.employeeData?.sId);
    },);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   Row(
          children: [
            Expanded(
              child: text("my_profile".tr,
                  textColor: dark1BrownColor,
                  isCentered: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: FontFamily.interBold
              ),
            ),
            Icon(Icons.notifications,color: brownColor,),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical:15 ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: softIvoryColor
                ),
                child: Column(
                  children: [
                    Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AppImages.imgIcon,height: 100,)),
                    ),
                    SizedBox(height: 10,),
                    text(
                      authController.profileData.value.name??"",
                      textColor:dark1BrownColor,
                      isCentered: true,
                      fontSize: 24,
                      fontFamily: FontFamily.interBold,
                      fontWeight: FontWeight.w700,
                    ),
                    text(
                      authController.profileData.value.retailerDetails?.shopName??"",
                      textColor:dark1BrownColor,
                      isCentered: true,
                      fontSize: 16,
                      fontFamily: FontFamily.interSansMedium,
                      fontWeight: FontWeight.w400,
                    ),
                    text(
                      authController.profileData.value.phone.toString()??"",
                      textColor:textBrownColor,
                      isCentered: true,
                      fontSize: 14,
                      fontFamily: FontFamily.interRegular,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    border:Border.all(color: borderColor)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      "personal_details".tr,
                      textColor:blackColor,
                      isCentered: true,
                      fontSize: 18,
                      fontFamily: FontFamily.interBold,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "retailer_name".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.poppinsMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.name??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.poppinsMedium,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "shop_name".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.interSansMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.retailerDetails?.shopName??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "mobile_number".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.interSansMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.phone.toString()??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "email_id".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.interSansMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.email??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "address".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.interSansMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.address??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              "gst_number".tr,
                              textColor:brownColor,
                              isCentered: true,
                              fontSize: 12,
                              fontFamily: FontFamily.interSansMedium,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 10,),
                            text(
                              authController.profileData.value.retailerDetails?.gstNumber??"",
                              textColor:dark1BrownColor,
                              isCentered: true,
                              fontSize: 16,
                              fontFamily: FontFamily.interBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        _showLanguageDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(
                            "Change Languages",
                            textColor:dark1BrownColor,
                            isCentered: true,
                            fontSize: 16,
                            fontFamily: FontFamily.interBold,
                            fontWeight: FontWeight.w500,
                          ),
                          Icon(Icons.arrow_forward_ios_outlined,color: brownColor,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 50,),
              CommonButton(
                text: "logout".tr,
                color: dark1BrownColor,
                borderRadius: BorderRadius.circular(15),
                onPressed: (){
                  showDialogLogout(context);
                },

                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,textColor: white,fontSize: 20,),
            ],
          ),
        ),
      ),

    );
  }
  void _showLanguageDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text("Select Language"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.language),
                title: Text("English"),
                onTap: () {
                  Get.updateLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("Hindi (हिंदी)"),
                onTap: () {
                  Get.updateLocale(const Locale('hi'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("Italian (Italiano)"),
                onTap: () {
                  Get.updateLocale(const Locale('it'));
                  Navigator.pop(context);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> showDialogLogout(BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
          insetPadding: EdgeInsets.all(15),

          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: Builder(
            builder: (context) {

              return SizedBox(
                height: 180,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text("Logout!",style: TextStyle(color: blueColor,fontSize: 15,fontFamily: FontFamily.poppinsBold,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    const Divider(height: 2,thickness: .5,color: textBrown,),
                    const SizedBox(height: 20,),
                    const Text("Are you sure you want to",style: TextStyle(color: textBrown,fontSize: 12,fontFamily: FontFamily.poppinsBold,fontWeight: FontWeight.bold),),
                    const Text("Logout!",style: TextStyle(color: textBrown,fontSize: 12,fontFamily: FontFamily.poppinsBold,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.sizeOf(context).width/3,
                            padding: EdgeInsets.only(left: 25,right: 25),
                            //padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: blueColor)
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text("Cancel",style: TextStyle(color: blueColor,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: FontFamily.poppinsMedium),)),
                          ),
                        ),


                        GestureDetector(
                          onTap: () async {
                             sp?.clearImportantKeys();
                            Navigator.of(context).pushAndRemoveUntil(
                              CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return const LoginScreen();
                                },
                              ),
                                  (_) => false,
                            );

                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.sizeOf(context).width/3,
                            padding: const EdgeInsets.only(left: 40,right: 40),
                            //padding: const EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),color: blueColor,
                            ),
                            child: const Align(
                                alignment: Alignment.center,
                                child: Text("OK",style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 16,fontFamily: FontFamily.poppinsBold),)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
