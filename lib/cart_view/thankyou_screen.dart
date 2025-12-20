import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../app_utils/app_colors.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../dashboard_view/bottom_navigation_screen.dart';
import '../wholeSaler/dashboard_view/bottomNavigationWholsaler.dart';




class ThankyouScreen extends StatefulWidget {
final bool? isPlaceOrder;
  const ThankyouScreen({super.key,this.isPlaceOrder});

  @override
  State<ThankyouScreen> createState() => _ThankyouScreenState();
}


class _ThankyouScreenState extends State<ThankyouScreen> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:  Icon(Icons.arrow_back_ios,color: blackColor,),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Center(child: Image.asset(AppImages.thankCheckIcon,height: 100,)),
              SizedBox(height: 10,),
              text(
                "Thank You ",
                textColor: redColor,
                isCentered: true,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: FontFamily.interBold,
              ),
              text(
                "for your order",
                textColor: blackColor,
                isCentered: true,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: FontFamily.interBold,
              ),
              SizedBox(height: 100,),
              CommonButton(
                text: "Go to Home Page",
                color: brownColor,
                borderRadius: BorderRadius.circular(20),
                onPressed: () {
                  Get.to(() =>  widget.isPlaceOrder==true?WholesalerDashBoardScreen():DashboardScreen());
                },
                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,
                textColor: white,fontSize: 16,),
            ],
          ),
        ),
      ),
    );
  }

}

