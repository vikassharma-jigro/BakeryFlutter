import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../getx_controller/delivery_controller.dart';




class BulkOrderScreen extends StatefulWidget {
  const BulkOrderScreen({super.key});

  @override
  State<BulkOrderScreen> createState() => _BulkOrderScreenState();
}


class _BulkOrderScreenState extends State<BulkOrderScreen> {
  final DeliveryController deliveryController = Get.put(DeliveryController());

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
              child: text("bulk_orders".tr,textColor: brownColor,
                  fontFamily: FontFamily.poppinsBold,fontSize: 20,
                  isCentered: true
              ),
            ),
            Icon(Icons.filter_alt,color: brownColor,),
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
                    ListView.builder(
                      itemCount: deliveryController.deliveryList.value.totalPendingOrders?.length??0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var totalPendingOrderData = deliveryController.deliveryList.value.totalPendingOrders?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
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

                                  text(totalPendingOrderData?.orderId??"",
                                      textColor: brownColor,
                                      fontFamily: FontFamily.poppinsBold,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: redColor.withOpacity(.1)
                                    ),
                                    child: text(totalPendingOrderData?.status??"",
                                        textColor: redColor,
                                        fontFamily: FontFamily.poppinsMedium,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 5,),
                              text(totalPendingOrderData?.orderFrom?.name??"",
                                  textColor: dTextColor,
                                  fontFamily: FontFamily.poppinsMedium,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                              SizedBox(height: 5,),
                              text(totalPendingOrderData?.orderFrom?.contact.toString()??"",
                                  textColor: dTextColor,
                                  fontFamily: FontFamily.poppinsRegular,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 5,),
                              text(totalPendingOrderData?.deliveryAddress?.addressLine??"",
                                  textColor: dTextColor,
                                  fontFamily: FontFamily.poppinsRegular,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                              ),
                              SizedBox(height: 5,),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     text("750",
                              //         textColor: brownColor,
                              //         fontFamily: FontFamily.poppinsBold,
                              //         fontSize: 24,
                              //         fontWeight: FontWeight.w700
                              //     ),
                              //
                              //     text("pieces".tr,
                              //         textColor: dTextColor,
                              //         fontFamily: FontFamily.poppinsRegular,
                              //         fontSize: 12,
                              //         fontWeight: FontWeight.w400
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 10,),
                              // CommonButton(
                              //   text: "mark_dispatched".tr,
                              //   color: brownColor,
                              //
                              //   onPressed: () {
                              //     print("Button Pressed");
                              //   },
                              //
                              //   fontFamily: FontFamily.poppinsMedium,
                              //   fontWeight: FontWeight.w400,textColor: white,fontSize: 14,),
                            ],
                          ),
                        ),
                      );
                    },),

                    ///dispatch List
                    ListView.builder(
                      itemCount: deliveryController.deliveryList.value.dispatchOrders?.length??0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var dispatchOrderData = deliveryController.deliveryList.value.dispatchOrders?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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

                                    text(dispatchOrderData?.orderId??"",
                                        textColor: brownColor,
                                        fontFamily: FontFamily.poppinsBold,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: blueColor.withOpacity(.1)
                                      ),
                                      child: text(dispatchOrderData?.status??"",
                                          textColor: blueColor,
                                          fontFamily: FontFamily.poppinsMedium,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                text(dispatchOrderData?.orderFrom?.name??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                text(dispatchOrderData?.orderFrom?.contact.toString()??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 5,),
                                text(dispatchOrderData?.deliveryAddress?.addressLine??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     text("750",
                                //         textColor: brownColor,
                                //         fontFamily: FontFamily.poppinsBold,
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.w700
                                //     ),
                                //
                                //     text("pieces".tr,
                                //         textColor: dTextColor,
                                //         fontFamily: FontFamily.poppinsRegular,
                                //         fontSize: 12,
                                //         fontWeight: FontWeight.w400
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 10,),
                                // CommonButton(
                                //   text: "mark_dispatched".tr,
                                //   color: brownColor,
                                //
                                //   onPressed: () {
                                //     print("Button Pressed");
                                //   },
                                //
                                //   fontFamily: FontFamily.poppinsMedium,
                                //   fontWeight: FontWeight.w400,textColor: white,fontSize: 14,),
                              ],
                            ),
                          ),
                        );
                      },),

                    ///delivered List
                    ListView.builder(
                      itemCount: deliveryController.deliveryList.value.deliveredOrders?.length??0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var deliveredOrderData = deliveryController.deliveryList.value.deliveredOrders?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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

                                    text(deliveredOrderData?.orderId??"",
                                        textColor: brownColor,
                                        fontFamily: FontFamily.poppinsBold,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: greenColor.withOpacity(.1)
                                      ),
                                      child: text(deliveredOrderData?.status??"",
                                          textColor: greenColor,
                                          fontFamily: FontFamily.poppinsMedium,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrderData?.orderFrom?.name??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrderData?.orderFrom?.contact.toString()??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrderData?.deliveryAddress?.addressLine??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     text("750",
                                //         textColor: brownColor,
                                //         fontFamily: FontFamily.poppinsBold,
                                //         fontSize: 24,
                                //         fontWeight: FontWeight.w700
                                //     ),
                                //
                                //     text("pieces".tr,
                                //         textColor: dTextColor,
                                //         fontFamily: FontFamily.poppinsRegular,
                                //         fontSize: 12,
                                //         fontWeight: FontWeight.w400
                                //     ),
                                //   ],
                                // ),
                                // SizedBox(height: 10,),
                                // CommonButton(
                                //   text: "mark_dispatched".tr,
                                //   color: brownColor,
                                //
                                //   onPressed: () {
                                //     print("Button Pressed");
                                //   },
                                //
                                //   fontFamily: FontFamily.poppinsMedium,
                                //   fontWeight: FontWeight.w400,textColor: white,fontSize: 14,),
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
}

