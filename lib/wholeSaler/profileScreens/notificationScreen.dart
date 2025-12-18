import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isValue = false;
  bool isValue1 = false;
  bool isValue2 = false;
  bool isValue3 = false;
  bool isValue4 = false;

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
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios, color: dark1BrownColor),
            ),
            Expanded(
              child: text(
                "notification_settings".tr,
                textColor: dark1BrownColor,
                isCentered: true,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: FontFamily.interBold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(
              "notification_preferences".tr,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: dark1BrownColor,
            ),
            SizedBox(height: 4),

            text(
              "manage_updates".tr,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textColor: brownColor,
            ),
            SizedBox(height: 24),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: brownColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.payment, color: dark1BrownColor),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        "payment_reminders".tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: dark1BrownColor,
                      ),
                      text(
                        "get_payments".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: brownColor,
                      ),
                    ],
                  ),
                  Spacer(),

                  Switch(
                    value: isValue,
                    activeColor: dark1BrownColor,
                    inactiveThumbColor: white,
                    onChanged: (value) {
                      setState(() {
                        isValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: brownColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.train_rounded, color: dark1BrownColor),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        "delivery_updates".tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: dark1BrownColor,
                      ),
                      text(
                        "track_delivery".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: brownColor,
                      ),
                    ],
                  ),
                  Spacer(),

                  Switch(
                    value: isValue1,
                    activeColor: dark1BrownColor,
                    inactiveThumbColor: white,
                    onChanged: (value) {
                      setState(() {
                        isValue1 = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: brownColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.info_outline, color: dark1BrownColor),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        "low_stock_alerts".tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: dark1BrownColor,
                      ),
                      text(
                        "know_favorites_are_running_out".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: brownColor,
                      ),
                    ],
                  ),
                  Spacer(),

                  Switch(
                    value: isValue,
                    activeColor: dark1BrownColor,
                    inactiveThumbColor: white,
                    onChanged: (value) {
                      setState(() {
                        isValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),

            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: brownColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.question_mark, color: dark1BrownColor),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        "new_product_notifications".tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: dark1BrownColor,
                      ),
                      text(
                        "be_items".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: brownColor,
                      ),
                    ],
                  ),
                  Spacer(),

                  Switch(
                    value: isValue,
                    activeColor: dark1BrownColor,
                    inactiveThumbColor: white,
                    onChanged: (value) {
                      setState(() {
                        isValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),

            text("delivery_preferences".tr, fontSize: 16, fontWeight: FontWeight.w500, textColor: dark1BrownColor),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: white,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: brownColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.watch_later, color: dark1BrownColor),
                  ),
                  SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        "quiet_hours".tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textColor: dark1BrownColor,
                      ),
                      text(
                        "no_notifications".tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: brownColor,
                      ),
                    ],
                  ),
                  Spacer(),

                  Switch(
                    value: isValue4,
                    activeColor: dark1BrownColor,
                    inactiveThumbColor: white,
                    onChanged: (value) {
                      setState(() {
                        isValue4 = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),

          ],
        ),
      ),
    );
  }
}
