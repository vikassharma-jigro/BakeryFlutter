import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/text_widget.dart';
import 'package:bakerybrown/wholeSaler/accountsScreen/my_product_screen.dart';
import 'package:bakerybrown/wholeSaler/profileScreens/editProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/shared_preferences.dart';
import '../../auth_view/login_screen.dart';
import '../../getx_controller/auth_controller.dart';
import '../../main.dart';
import '../profileScreens/notificationScreen.dart';

class Profilescreen extends StatefulWidget {
  Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  bool isValue = false;
  final AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    Future.microtask(() {
      authController.getProfileApi(context: context,status: sp?.getString(SpUtil.MEMBER_ID) ?? "");
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: text(
          "profile".tr,
          isCentered: true,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.interBold,
          textColor: dark1BrownColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: dark1BrownColor),
          ),
        ],
      ),
      body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                AppImages.imgIcon,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                  authController.profileData.value.name??"",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.interBold,
                                  textColor: dark1BrownColor,
                                ),
                                text(
                                  authController.profileData.value.role??"",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  textColor: darkGreyColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Phone
                        text(
                          "phone_number".tr,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: darkGreyColor,
                        ),
                        text(
                          authController.profileData.value.phone.toString()??"",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(height: 10),

                        // Phone
                        text(
                          "email_address".tr,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: darkGreyColor,
                        ),
                        text(
                          authController.profileData.value.email??"",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(height: 10),

                        // Phone
                        text(
                          "gst_number".tr,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: darkGreyColor,
                        ),
                        text(
                          authController.profileData.value.retailerDetails?.gstNumber??"",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(height: 10),

                        // Phone
                        text(
                          "business_address".tr,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textColor: darkGreyColor,
                        ),
                        text(
                          authController.profileData.value.address??"",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  text(
                    "account_settings".tr,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: dark1BrownColor,
                    fontFamily: FontFamily.interBold,
                  ),
                  SizedBox(height: 12),

                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(MyProductScreen());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.person, color: dark1BrownColor),
                              SizedBox(width: 10),
                              text(
                                "My Product".tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.interSansMedium,
                                textColor: dark1BrownColor,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined, size: 20),
                            ],
                          ),
                        ),

                        SizedBox(height: 10,),
                        Divider(),
                        InkWell(
                          onTap: (){
                            Get.to(EditProfileScreen());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.person, color: dark1BrownColor),
                              SizedBox(width: 10),
                              text(
                                "edit_profile".tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.interSansMedium,
                                textColor: dark1BrownColor,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined, size: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Divider(),

                        // Row(
                        //   children: [
                        //     Icon(Icons.lock, color: dark1BrownColor),
                        //     SizedBox(width: 10),
                        //     text(
                        //       "Change Password",
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w500,
                        //       fontFamily: FontFamily.interBold,
                        //       textColor: dark1BrownColor,
                        //     ),
                        //     Spacer(),
                        //     Icon(Icons.arrow_forward_ios_outlined, size: 20),
                        //   ],
                        // ),
                        // Divider(),
                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Get.to(NotificationScreen());
                          },
                          child: Row(
                            children: [
                              Icon(Icons.notifications, color: dark1BrownColor),
                              SizedBox(width: 10),
                              text(
                                "notification_settings".tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.interSansMedium,
                                textColor: dark1BrownColor,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined, size: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Divider(),

                        // Row(
                        //   children: [
                        //     Icon(Icons.cloud, color: dark1BrownColor),
                        //     SizedBox(width: 10),
                        //     text(
                        //       "cloud_backup".tr,
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w500,
                        //       fontFamily: FontFamily.interBold,
                        //       textColor: dark1BrownColor,
                        //     ),
                        //     Spacer(),
                        //     Icon(Icons.arrow_forward_ios_outlined, size: 20),
                        //   ],
                        // ),
                        // Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.wifi, color: dark1BrownColor),
                            SizedBox(width: 10),
                            text(
                              "offline_status".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interSansMedium,
                              textColor: dark1BrownColor,
                            ),
                            Spacer(),
                            Switch(
                              value: isValue,
                              activeColor: dark1BrownColor,
                              inactiveThumbColor: white,
                              onChanged: (value) {
                                isValue = value!;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.group, color: dark1BrownColor),
                            SizedBox(width: 10),
                            text(
                              "multi_access".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interSansMedium,
                              textColor: dark1BrownColor,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_outlined, size: 20),
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
                            children: [
                              Icon(Icons.g_translate_sharp, color: dark1BrownColor),
                              SizedBox(width: 10),
                              text(
                                "language".tr,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.interSansMedium,
                                textColor: dark1BrownColor,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined, size: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Icon(Icons.support_agent, color: dark1BrownColor),
                            SizedBox(width: 10),
                            text(
                              "contact_support".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.interSansMedium,
                              textColor: dark1BrownColor,
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_outlined, size: 20),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Divider(),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  CommonButton(text: "logout".tr,
                      color: dark1BrownColor,
                      textColor: white ,onPressed: (){
                    showDialogLogout(context);
                  }, fontFamily: FontFamily.interBold, fontWeight: FontWeight.w400)
                ],
              ),
            ),
          );
        }
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
