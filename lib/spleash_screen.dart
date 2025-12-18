import 'package:bakerybrown/wholeSaler/dashboard_view/bottomNavigationWholsaler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'app_utils/app_colors.dart';
import 'app_utils/app_images.dart';
import 'app_utils/font_family.dart';
import 'app_utils/shared_preferences.dart';
import 'app_utils/text_widget.dart';
import 'auth_view/login_screen.dart';
import 'dashboard_view/bottom_navigation_screen.dart';
import 'delivery_Dashboard_view/bottom_navigation_screen.dart';
import 'main.dart';

class FirstSplash extends StatefulWidget {
  const FirstSplash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstSplashState();
}

class _FirstSplashState extends State<FirstSplash> {
String role = sp?.getString(SpUtil.ROLE)??"";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if(role=="retailer"){
        Get.to(DashboardScreen());
      }else if(role=="wholesaler"){
        Get.to(WholesalerDashBoardScreen());
      }else if(role=="delivery"){
        Get.to(DeliveryDashboardScreen());
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("role>>>${sp?.getString(SpUtil.ROLE) ?? ""}");
    return Scaffold(
      //backgroundColor: brownColor.withOpacity(.7),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splashIcon,
              height: 200,
              fit: BoxFit.cover,
            ),
            text(
              "Bakery",
              textColor: blackColor,
              fontSize: 32,
              fontFamily: FontFamily.poppinsBold,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
