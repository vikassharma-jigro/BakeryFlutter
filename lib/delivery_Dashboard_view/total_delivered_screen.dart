import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../getx_controller/delivery_controller.dart';




class TotalDeliveredScreen extends StatefulWidget {
  const TotalDeliveredScreen({super.key});

  @override
  State<TotalDeliveredScreen> createState() => _TotalDeliveredScreenState();
}


class _TotalDeliveredScreenState extends State<TotalDeliveredScreen> {
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
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,color: brownColor,)),
            Expanded(
              child: text("delivery_management".tr,textColor: brownColor,
                  fontFamily: FontFamily.poppinsBold,fontSize: 20,
                  isCentered: true
              ),
            ),
            Icon(Icons.notifications,color: brownColor,),
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
                      itemCount: deliveryController.deliveryList.value.deliveredOrders?.length??0,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                       var deliveredOrders = deliveryController.deliveryList.value.deliveredOrders?[index];
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

                                    text(deliveredOrders?.orderId??"",
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
                                      child: text("delivered".tr,
                                          textColor: greenColor,
                                          fontFamily: FontFamily.poppinsMedium,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrders?.orderFrom?.name??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrders?.orderFrom?.contact.toString()??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 5,),
                                text(deliveredOrders?.deliveryAddress?.addressLine??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 15,),

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

