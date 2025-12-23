import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/showAlertMessage.dart';
import '../../app_utils/text_widget.dart';
import '../getx_controller/delivery_controller.dart';




class TotalOrderScreen extends StatefulWidget {
  const TotalOrderScreen({super.key});

  @override
  State<TotalOrderScreen> createState() => _TotalOrderScreenState();
}


class _TotalOrderScreenState extends State<TotalOrderScreen> {
  TextEditingController otpController = TextEditingController();
  final DeliveryController deliveryController = Get.put(DeliveryController());

  @override
  void initState() {
    super.initState();
  }
  List<String> statuses = List.generate(10, (_) => "packed".tr);
  List<String> btnTexts = List.generate(10, (_) => "mark_dispatched".tr);
  List<bool> showButtons = List.generate(10, (_) => true);
  // String status = "Packed";           // Status
  // String btnText = "Mark as Dispatched";
  // bool showButton = true;


  @override
  void dispose() {
    //_timer?.cancel();
    otpController.dispose();
    super.dispose();
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
      body: Obx(() {
          return deliveryController.deliveryList.value.totalPendingOrders!.isEmpty||deliveryController.deliveryList.value.totalPendingOrders==null?
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset(AppImages.dataNotFoundIcon,height: 150,)),
              SizedBox(height: 20,),
              text("Data Not Found",
                  textColor: dark1BrownColor,
                  fontFamily: FontFamily.interBold,
                  fontSize: 17,
                  fontWeight: FontWeight.w700
              ),
            ],
          )
          :SingleChildScrollView(
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
                      var deliverPendingOrder =  deliveryController.deliveryList.value.totalPendingOrders?[index];
                        String status = statuses[index];
                        String btnText = btnTexts[index];
                        bool showButton = showButtons[index];
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

                                    text(deliverPendingOrder?.orderId??"",
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
                                      child: text(deliverPendingOrder?.status??"",
                                          textColor: brownColor,
                                          fontFamily: FontFamily.poppinsMedium,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                text(deliverPendingOrder?.orderFrom?.name??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsMedium,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 5,),
                                text(deliverPendingOrder?.orderFrom?.contact.toString()??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 5,),
                                text(deliverPendingOrder?.deliveryAddress?.addressLine??"",
                                    textColor: dTextColor,
                                    fontFamily: FontFamily.poppinsRegular,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                                SizedBox(height: 15,),
                                if (showButton)
                                CommonButton(
                                  text: btnText,
                                  color: brownColor,
                                  onPressed: () {
                                    deliveryController.getDispatchOrderApi(context: context,orderId:deliverPendingOrder?.orderId.toString()).then((value) {
                                      if(value.success==true){
                                        deliveryController.getDeliveryOrderListApi(context: context);
                                      }
                                    },);

                                    // setState(() {
                                    //   if (status == "packed".tr) {
                                    //     statuses[index] = "dispatched".tr;
                                    //     btnTexts[index] = "mark_delivered".tr;
                                    //   } else if (status == "dispatched".tr) {
                                    //     showOtpDialog(context, statuses[index], index, statuses, showButtons);
                                    //     // statuses[index] = "Delivered";
                                    //     // showButtons[index] = false;
                                    //   }
                                    // });
                                  },
                                  fontFamily: FontFamily.poppinsMedium,
                                  fontWeight: FontWeight.w400,
                                  textColor: white,fontSize: 14,),
                                SizedBox(height: 12,),
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
  Future<void> showOtpDialog(BuildContext context,String currentStatus, int index, List<String> statuses, List<bool> showButtons) async {
    final TextEditingController _otpController = TextEditingController(); // dialog-local

    final resultOtp = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                text(
                  "enter_otp".tr,
                  textColor: blackColor,
                  fontSize: 14
                     ),
                text(
                  "please_enter_mobile_number".tr,
                  textColor: dTextColor,
                  fontSize: 13,
                  fontFamily: FontFamily.poppinsRegular
                     ),
                SizedBox(height: 15),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  enableActiveFill: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldWidth: (MediaQuery.of(context).size.width / 6) - 24,
                    activeFillColor: floralWhiteColor,
                    inactiveColor: brownColor,
                    inactiveFillColor: white,
                    selectedFillColor: lightBrownColor,
                  ),
                  onCompleted: (otp) {
                    Navigator.of(context).pop(otp); // return OTP
                  },
                ),
                SizedBox(height: 20),
                CommonButton(
                  text: "verify_otp".tr,
                  color: brownColor,
                  onPressed: (){
                    print("Button Pressed");
                    if(otpController.text.isEmpty){
                      ShowAlertDialog().showErrorAlert(context, "Please Enter Otp");

                    } else if (statuses[index] == "dispatched".tr) {
                      statuses[index] = "delivered".tr;
                      showButtons[index] = false; // hide button
                    }

                    Navigator.of(context).pop(); // close dialog
                    _otpController.dispose(); // dispose safely

                    if (mounted) setState(() {});  },

                  fontFamily: FontFamily.poppinsBold,
                  fontWeight: FontWeight.w600,textColor: white,),
              ],
            ),
          ),
        );
      },
    );

    _otpController.dispose();
    if (resultOtp != null && resultOtp.isNotEmpty) {
      // OTP enter hua → update status for this item
      statuses[index] = currentStatus == "packed".tr ? "dispatched".tr : "delivered".tr;

      if (currentStatus == "dispatched".tr) {
        showButtons[index] = false; // hide button if delivered
      }

      if (mounted) {
        // call setState to rebuild ListView
        (context as Element).markNeedsBuild();
      }
    }// dialog close hone ke baad safe dispose
  }


}

