import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';




class BulkOrderScreen extends StatefulWidget {
  const BulkOrderScreen({super.key});

  @override
  State<BulkOrderScreen> createState() => _BulkOrderScreenState();
}


class _BulkOrderScreenState extends State<BulkOrderScreen> {
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

                              text("B-ORD-102".tr,
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
                                child: text("pending".tr,
                                    textColor: redColor,
                                    fontFamily: FontFamily.poppinsMedium,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 5,),
                          text("golden_bakery".tr,
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
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text("750",
                                  textColor: brownColor,
                                  fontFamily: FontFamily.poppinsBold,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700
                              ),

                              text("pieces".tr,
                                  textColor: dTextColor,
                                  fontFamily: FontFamily.poppinsRegular,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          CommonButton(
                            text: "mark_dispatched".tr,
                            color: brownColor,

                            onPressed: () {
                              print("Button Pressed");
                            },

                            fontFamily: FontFamily.poppinsMedium,
                            fontWeight: FontWeight.w400,textColor: white,fontSize: 14,),
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

