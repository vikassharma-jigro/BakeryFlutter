import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/product_controller.dart';
import 'invoiceScreen.dart';

class InvoiceReportScreen extends StatefulWidget {
  const InvoiceReportScreen({super.key});
  @override
  State<InvoiceReportScreen> createState() => _InvoiceReportScreenState();
}

class _InvoiceReportScreenState extends State<InvoiceReportScreen> {
  final ProductsController productsController = Get.put(ProductsController());


  @override
  void initState() {
    Future.microtask(() {
      productsController.getWholesalerInvoiceApi(context: context);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
            text(
              "invoices_reports".tr,
              isCentered: true,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.interBold,
              textColor: dark1BrownColor,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download, color: dark1BrownColor),
          ),
        ],
      ),
      body: Obx(
         () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: List.generate(3, (index){
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: text("january".tr, textColor: dark1BrownColor, fontSize: 14, fontWeight: FontWeight.w400),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("all_retailers".tr, fontSize: 14, fontWeight: FontWeight.w500, textColor: blackColor),
                        Icon(Icons.keyboard_arrow_down_rounded),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 41, vertical: 12),
                    decoration: BoxDecoration(
                      color: dark1BrownColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: text("apply_filter".tr, fontSize: 16, fontWeight: FontWeight.w500, isCentered: true),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: softIvoryColor,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("recent_invoices".tr, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: FontFamily.interBold, textColor: dark1BrownColor),
                        SizedBox(height: 13,),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productsController.wholesalerInvoicedData.value.data?.length??0,
                          itemBuilder: (context, index) {
                          var invoiceData = productsController.wholesalerInvoicedData.value.data?[index];
                          String iso = invoiceData?.invoiceDate??"";

                          String date = iso.split("T")[0];
                          return  Container(
                              padding : EdgeInsets.all(12),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(21),
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: Column(
                                    crossAxisAlignment : CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      text(invoiceData?.invoiceId??"", fontWeight: FontWeight.w400, fontSize: 16, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
                                      text(invoiceData?.storeName??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                                      text(date, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                                      text("€${invoiceData?.amount??""}", fontWeight: FontWeight.w700, fontSize: 18, fontFamily: FontFamily.interBold, textColor: dark1BrownColor),
                                    ],
                                  ),),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: greenColor.withOpacity(0.2),
                                            ),
                                            child: text(invoiceData?.paymentStatus??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: blackColor)),
                                        SizedBox(height: 10,),
                                        InkWell(
                                          onTap: (){
                                            Get.to(InvoiceScreen(invoiceId: invoiceData?.invoiceId.toString(),));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: dark1BrownColor,
                                              ),
                                              child: text("view_invoice".tr, fontWeight: FontWeight.w600,
                                                  fontSize: 13, fontFamily: FontFamily.interBold,
                                                  textColor: white)),
                                        ),                          ],
                                    ),),
                                ],
                              )
                          );
                        },)

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Image.asset("assets/images/div-10.png", width: double.infinity, fit: BoxFit.cover,),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
