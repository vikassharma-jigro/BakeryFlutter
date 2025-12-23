import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../app_utils/app_images.dart';
import '../getx_controller/delivery_controller.dart';




class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen> {
  final DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  void initState() {
    Future.microtask(() {
      deliveryController.getNotificationListApi(context: context );
    },);
    super.initState();
  }

  DateTime? dateTime;


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
      body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: deliveryController.notificationList.value.data?.length??0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var notificationData = deliveryController.notificationList.value.data?[index];
                        dateTime = DateTime.parse(notificationData!.createdAt.toString()).toLocal();
                        String? notificationTime = getNotificationTime(dateTime!);
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
                                        text(notificationData.title??"",
                                            textColor: brownColor,
                                            fontFamily: FontFamily.poppinsBold,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700
                                        ),
                                        SizedBox(
                                          width: 240,
                                          child: text(notificationData.message??"",
                                              textColor: dTextColor,
                                              fontFamily: FontFamily.poppinsRegular,
                                              fontSize: 10,
                                              maxLine: 2,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        text(notificationTime,
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
          );
        }
      ),
    );
  }
  String getNotificationTime(DateTime dateTime) {
    DateTime now = DateTime.now();

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return "Today • ${_formatTime(dateTime)}";
    }

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day - 1) {
      return "Yesterday • ${_formatTime(dateTime)}";
    }

    return "${dateTime.day}/${dateTime.month}/${dateTime.year} • ${_formatTime(dateTime)}";
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}"
        ":${dateTime.minute.toString().padLeft(2, '0')} "
        "${dateTime.hour >= 12 ? "PM" : "AM"}";
  }

}

