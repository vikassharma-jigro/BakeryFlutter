import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/showAlertMessage.dart';
import '../../app_utils/text_widget.dart';




class TotalDispatchedScreen extends StatefulWidget {
  const TotalDispatchedScreen({super.key});

  @override
  State<TotalDispatchedScreen> createState() => _TotalDispatchedScreenState();
}


class _TotalDispatchedScreenState extends State<TotalDispatchedScreen> {
  @override
  void initState() {
    super.initState();
  }
  List<String> statuses = List.generate(10, (_) => "dispatched".tr);
  List<String> btnTexts = List.generate(10, (_) => "mark_delivered".tr);
  List<bool> showButtons = List.generate(10, (_) => true);




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

                                text("B-ORD-102",
                                    textColor: brownColor,
                                    fontFamily: FontFamily.poppinsBold,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: status=="delivered".tr?greenColor.withOpacity(.1):redColor.withOpacity(.1)
                                  ),
                                  child: text(status,
                                      textColor: status=="delivered".tr?greenColor:brownColor,
                                      fontFamily: FontFamily.poppinsMedium,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 5,),
                            text("Golden Bakery Ltd",
                                textColor: dTextColor,
                                fontFamily: FontFamily.poppinsMedium,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            ),
                            SizedBox(height: 5,),
                            text("+1 (555) 234-5678",
                                textColor: dTextColor,
                                fontFamily: FontFamily.poppinsRegular,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),
                            SizedBox(height: 5,),
                            text("456 Oak Avenue Business Park, NY 10002",
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
                                  setState(() {
                                    showOtpDialog(context, statuses[index], index, statuses, showButtons);
                                    /*if (status == "Packed") {
                                      // First click
                                      status = "Dispatched";
                                      btnText = "Mark as Delivered";
                                    } else */if (status == "dispatched".tr) {
                                      // Second click
                                      status = "delivered".tr;
                                      showButton = false;  // Button hide
                                    }
                                  });
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
                    "Enter OTP Code",
                    textColor: blackColor,
                    fontSize: 14
                ),
                text(
                    "Please enter the 6-digit code sent to retailer's mobile number",
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
                  text: "Verify OTP",
                  color: brownColor,
                  onPressed: (){
                    print("Button Pressed");
                    if(_otpController.text.isEmpty){
                      ShowAlertDialog().showErrorAlert(context, "Please Enter Otp");

                    } else if (statuses[index] == "Dispatched") {
                      statuses[index] = "Delivered";
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
      statuses[index] = currentStatus == "Packed" ? "Dispatched" : "Delivered";

      if (currentStatus == "Dispatched") {
        showButtons[index] = false; // hide button if delivered
      }

      if (mounted) {
        // call setState to rebuild ListView
        (context as Element).markNeedsBuild();
      }
    }// dialog close hone ke baad safe dispose
  }
}

