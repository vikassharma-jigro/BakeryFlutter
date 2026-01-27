import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../app_utils/app_images.dart';
import '../app_utils/shared_preferences.dart';
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
      authController.getProfileApi(context: context,status: sp?.getString(SpUtil.MEMBER_ID) ?? "");
    },);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Scaffold(
          backgroundColor: floralWhiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(175), // 👈 Yaha height set karo
            child: Container(
              color: brownColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16,top: 10),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: text(
                              "my_profile".tr,
                              textColor: white,
                              isCentered: true,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: FontFamily.poppinsBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(AppImages.dUserIcon,height: 70,)),

                      text(
                        authController.profileData.value.name??"",
                        textColor: white,
                        isCentered: true,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: FontFamily.poppinsBold,
                      ),
                      text(
                        authController.profileData.value.phone.toString()??"",
                        textColor: white,
                        isCentered: true,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: FontFamily.poppinsRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  text("edit_profile".tr,
                                      textColor: blackColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  text("payment_details".tr,
                                      textColor: blackColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      text("delivery_performance".tr,
                                          textColor: blackColor,
                                          fontFamily: FontFamily.poppinsMedium,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          text("248 orders",
                                              textColor: blackColor,
                                              fontFamily: FontFamily.poppinsRegular,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                          SizedBox(width: 15,),
                                          text("4.8",
                                              textColor: blackColor,
                                              fontFamily: FontFamily.poppinsRegular,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                          Icon(Icons.star,color: Colors.orange,size: 14,),SizedBox(width: 15,),
                                          text("€24,500",
                                              textColor: greenColor,
                                              fontFamily: FontFamily.poppinsRegular,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  text("payout_history".tr,
                                      textColor: blackColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  text("notification_settings".tr,
                                      textColor: blackColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    InkWell(
                      onTap: (){
                        _showLanguageDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppImages.dQuesIcon,height: 30,),
                                    SizedBox(width: 20,),
                                    text("language".tr,
                                        textColor: blackColor,
                                        fontFamily: FontFamily.poppinsMedium,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),


                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,size: 18,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),


                    SizedBox(height: 10,),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppImages.dQuesIcon,height: 30,),
                                  SizedBox(width: 20,),
                                  text("help_support".tr,
                                      textColor: blackColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),


                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,size: 18,),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),

                    InkWell(
                      onTap: (){
                        showDialogLogout(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppImages.dQuesIcon,height: 30,),
                                    SizedBox(width: 20,),
                                    text("logout".tr,
                                        textColor: redColor,
                                        fontFamily: FontFamily.poppinsMedium,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),


                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,size: 18,color: redColor,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        );
      }
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

