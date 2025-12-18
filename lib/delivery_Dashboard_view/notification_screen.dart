import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../app_utils/app_images.dart';




class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: floralWhiteColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title:  Row(
          children: [
            Expanded(
              child: text("notifications".tr,textColor: brownColor,
                  fontFamily: FontFamily.poppinsBold,fontSize: 20,
                  isCentered: true
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.dQuesIcon,height: 30,),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text("order_delivered".tr,
                                        textColor: brownColor,
                                        fontFamily: FontFamily.poppinsBold,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),
                                    text("order_customer".tr,
                                        textColor: dTextColor,
                                        fontFamily: FontFamily.poppinsRegular,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500
                                    ),
                                    SizedBox(height: 10,),
                                    text("5 min",
                                        textColor: dTextColor,
                                        fontFamily: FontFamily.poppinsRegular,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },)

              ],
            )
        ),
      ),
    );
  }
}

