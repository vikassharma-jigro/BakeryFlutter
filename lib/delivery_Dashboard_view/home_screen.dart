import 'package:bakerybrown/delivery_Dashboard_view/total_delivered_screen.dart';
import 'package:bakerybrown/delivery_Dashboard_view/total_dispatched_screen.dart';
import 'package:bakerybrown/delivery_Dashboard_view/total_order_screen.dart';
import 'package:bakerybrown/getx_controller/delivery_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  void initState() {
    Future.microtask(() {
      deliveryController.getDeliveryOrderListApi(context: context);
    },);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: floralWhiteColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("delivery_dashboard".tr,textColor: brownColor,fontFamily: FontFamily.poppinsBold,fontSize: 20),
            text("order_management".tr,textColor: darkGreyColor,fontFamily: FontFamily.poppinsRegular,
                fontWeight: FontWeight.w400,fontSize: 12),
          ],
        ),
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      //Get.to(() => TotalOrderScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppImages.dTotalOrderIcon,height: 50,),
                              SizedBox(width: 10,),
                              text("total_orders".tr,
                              textColor: dTextColor,
                              fontFamily: FontFamily.poppinsMedium,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                              ),

                            ],
                          ),
                          SizedBox(height: 5,),
                          text(deliveryController.deliveryList.value.totalOrders.toString()??"",
                              textColor: blackColor,
                              fontFamily: FontFamily.poppinsBold,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                          text("for_delivery".tr,
                              textColor: dTextColor,
                              fontFamily: FontFamily.poppinsRegular,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      Get.to(() => TotalOrderScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppImages.dTotalOrderIcon,height: 50,),
                              SizedBox(width: 10,),
                              text("total_pending".tr,
                                  textColor: dTextColor,
                                  fontFamily: FontFamily.poppinsMedium,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                              ),

                            ],
                          ),
                          SizedBox(height: 5,),
                          text(deliveryController.deliveryList.value.pending.toString()??"",
                              textColor: blackColor,
                              fontFamily: FontFamily.poppinsBold,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                          text("for_delivery".tr,
                              textColor: dTextColor,
                              fontFamily: FontFamily.poppinsRegular,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ],
                      ),
                    ),
                  ),



                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Get.to(TotalDispatchedScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                                  Image.asset(AppImages.dispatchedIcon,height: 50,),
                                  SizedBox(width: 10,),
                                  text("dispatched".tr,
                                      textColor: dTextColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  ),

                                ],
                              ),
                              // Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: blueColor.withOpacity(.1)
                              //   ),
                              //   child: text("62.5%",
                              //       textColor: blueColor,
                              //       fontFamily: FontFamily.poppinsMedium,
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.w500
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          text(deliveryController.deliveryList.value.dispatched.toString()??"",
                              textColor: blackColor,
                              fontFamily: FontFamily.poppinsBold,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                          text("on_way".tr,
                              textColor: dTextColor,
                              fontFamily: FontFamily.poppinsRegular,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  InkWell(
                    onTap: (){
                      Get.to(TotalDeliveredScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                                  Image.asset(AppImages.deliveredIcon,height: 50,),
                                  SizedBox(width: 10,),
                                  text("delivered".tr,
                                      textColor: dTextColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  ),

                                ],
                              ),
                              // Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              //   decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(10),
                              //       color: greenColor.withOpacity(.1)
                              //   ),
                              //   child: text("37.5%",
                              //       textColor: greenColor,
                              //       fontFamily: FontFamily.poppinsMedium,
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.w500
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          text(deliveryController.deliveryList.value.delivered.toString()??"",
                              textColor: blackColor,
                              fontFamily: FontFamily.poppinsBold,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                          ),
                          text("completed_today".tr,
                              textColor: dTextColor,
                              fontFamily: FontFamily.poppinsRegular,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          );
        }
      ),
    );
  }
}

