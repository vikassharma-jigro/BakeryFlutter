import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/dashboard_view/bottom_navigation_screen.dart';
import 'package:bakerybrown/delivery_Dashboard_view/bottom_navigation_screen.dart';
import 'package:bakerybrown/wholeSaler/dashboard_view/bottomNavigationWholsaler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_utils/custom_textFiled.dart';
import '../app_utils/font_family.dart';
import '../app_utils/shared_preferences.dart';
import '../app_utils/showAlertMessage.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/auth_controller.dart';
import '../main.dart';
import '../model/auth_model.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  TextEditingController memberIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscure = true;
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showLanguageDialog(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: lightSkyBlueColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(AppImages.backLoginIcon),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    AppImages.splashIcon,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 120,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: lightBrownColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        text(
                          "member_id".tr,
                          textColor: textBrownColor,
                          fontSize: 14,
                          fontFamily: FontFamily.poppinsMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10,),
                        CustomRoundTextField(
                          controller:memberIdController,
                          keyboardType: TextInputType.name,
                          hintText: "enter_id".tr,
                          borderColor: Colors.transparent,
                          hintColor: blackColor,
                          hintSize: 10,
                          maxLines: 2,
                          fillColor: txtFillColor,
                          borderRadius: 15,

                          //padding: const EdgeInsets.symmetric(vertical: 2),
                          //inputFormatters: [LengthLimitingTextInputFormatter(20),],
                        ),
                        SizedBox(height: 10,),
                        text(
                          "password".tr,
                          textColor: textBrownColor,
                          fontSize: 14,
                          fontFamily: FontFamily.poppinsMedium,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10,),
                        CustomRoundTextField(
                          isPassword: true,
                          obscure: _obscure,
                          controller:passwordController,
                          hintText: "enter_password".tr,
                          hintColor: blackColor,
                          borderColor: Colors.transparent,
                          hintSize: 10,
                          maxLines: 1,
                          fillColor: txtFillColor,
                          borderRadius: 15,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscure?Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscure = !_obscure;
                              });
                            },
                          ),
                          //padding: const EdgeInsets.symmetric(vertical: 2),
                          //inputFormatters: [LengthLimitingTextInputFormatter(20),],
                        ),

                        SizedBox(height: 20,),
                        CommonButton(
                          text: "login".tr,
                          color: brownColor,
                          onPressed: () async {
                            print("Button Pressed");

                            if (memberIdController.text.isEmpty) {
                              ShowAlertDialog().showErrorAlert(context, "Please Enter Your Email");
                              return;
                            } else if (passwordController.text.isEmpty) {
                              ShowAlertDialog().showErrorAlert(context, "Please Enter Your Password");
                              return;
                            }
                             await authController.getWholesalerLoginApi(
                              context: context,
                              email: memberIdController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            await Future.delayed(Duration(milliseconds: 500));
                            // Role from API
                            String? role = authController.authModel.value.employeeData?.role;
                            String? userEmail = authController.authModel.value.employeeData?.email;

                            if (role == null || role.isEmpty) {
                             // ShowAlertDialog().showErrorAlert(context, "Role not found!");
                              return;
                            }

                            // Save to SharedPreferences
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("isLoggedIn", true);
                            //await prefs.setString("role", role);
                            await prefs.setString("email", userEmail ?? "");
                            sp?.putString(SpUtil.ACCESS_TOKEN, authController.authModel.value.token ?? "");
                            sp?.putString(SpUtil.MEMBER_ID, authController.authModel.value.employeeData?.sId ?? "");
                            sp?.putString(SpUtil.ROLE, role);

                            // Navigate based on role
                            if (role == "retailer") {
                              Get.to(DashboardScreen());
                            } else if (role == "wholesaler") {
                              Get.to(WholesalerDashBoardScreen());
                            } else if (role == "delivery") {
                              Get.to(DeliveryDashboardScreen());
                            } else {
                              ShowAlertDialog().showErrorAlert(context, "Unknown role: $role");
                            }

                          },
                          fontFamily: FontFamily.poppinsBold,
                          fontWeight: FontWeight.w600,
                          textColor: white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            )
          ],
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

}
