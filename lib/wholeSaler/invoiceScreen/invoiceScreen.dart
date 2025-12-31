import 'package:bakerybrown/wholeSaler/invoiceScreen/invoice&ReportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/product_controller.dart';

class InvoiceScreen extends StatefulWidget {
  final String? invoiceId;
  const InvoiceScreen({super.key,this.invoiceId});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final ProductsController productsController = Get.put(ProductsController());


@override
  void initState() {
    Future.microtask(() {
      productsController.getWholesalerInvoiceReportApi(context: context,invoiceId: widget.invoiceId);
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    String iso = productsController.wholesalerInvoicedReportData.value.data?.invoiceDate??"";
    String date = iso.split("T")[0];
    String dueIso = productsController.wholesalerInvoicedReportData.value.data?.dueDate??"";
    String dueDate = dueIso.split("T")[0];
    return Obx(
      () {
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
                text(
                  "invoice".tr,
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
                icon: Icon(Icons.more_vert, color: dark1BrownColor),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text("Invoice", fontWeight: FontWeight.w500, fontSize: 18, fontFamily: FontFamily.interBold, textColor: blackColor),
                                text("#${productsController.wholesalerInvoicedReportData.value.data?.invoiceId??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: dTextColor),
                                text("Invoice Date", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: dTextColor),
                                text("Due Date", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: dTextColor),
                              ],
                            )),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.cake, color: dark1BrownColor,),
                                SizedBox(height: 10,),
                                text(date, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: dTextColor),
                                SizedBox(height: 5,),
                                text(dueDate, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: dTextColor),
                              ],
                            )),
                      ],
                    )
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text("Sweet Dreams Bakery", fontWeight: FontWeight.w500, fontSize: 18, fontFamily: FontFamily.interBold, textColor: blackColor),
                          SizedBox(height: 13,),
                          text(productsController.wholesalerInvoicedReportData.value.data?.storeAddress?.addressLine??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          text(productsController.wholesalerInvoicedReportData.value.data?.storeAddress?.city??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          // text("Phone: +1 (555) 123-4567", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          // text("GST: 22AAAAA0000A1Z5", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                        ],
                      ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("retailer_details".tr, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: FontFamily.interBold, textColor: blackColor),
                        SizedBox(height: 13,),
                        text("Corner Cafe & Bistro", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: blackColor),
                        text(productsController.wholesalerInvoicedReportData.value.data?.storeAddress?.addressLine??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                        text(productsController.wholesalerInvoicedReportData.value.data?.storeAddress?.city??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                        text("Phone: ${productsController.wholesalerInvoicedReportData.value.data?.retailer?.phone??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                        //text("GST: 22BBBBB0000B1Z5", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("order_summary".tr, fontWeight: FontWeight.w500, fontSize: 18, fontFamily: FontFamily.interBold, textColor: blackColor),
                        SizedBox(height: 13,),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productsController.wholesalerInvoicedReportData.value.data?.items?.length??0,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                          var itemData = productsController.wholesalerInvoicedReportData.value.data?.items?[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(itemData?.name??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                                  text("${itemData?.quantity??""} × €${itemData?.pricePerUnit??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                                ],
                              ),
                              text("€${itemData?.total}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            ],
                          );
                        },),



                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("subtotal".tr, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            text("€${productsController.wholesalerInvoicedReportData.value.data?.orderSummary?.subTotal??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("${"tax"}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            text("€${productsController.wholesalerInvoicedReportData.value.data?.orderSummary?.tax??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("${"discount".tr}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            text("€${productsController.wholesalerInvoicedReportData.value.data?.orderSummary?.discount??""}", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: greenColor),
                          ],
                        ),

                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("grand_total".tr, fontWeight: FontWeight.w700, fontSize: 14, fontFamily: FontFamily.interBold, textColor: blackColor),
                            text("€${productsController.wholesalerInvoicedReportData.value.data?.orderSummary?.grandTotal??""}", fontWeight: FontWeight.w700, fontSize: 14, fontFamily: FontFamily.interBold, textColor: blackColor),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("payment_details".tr, fontWeight: FontWeight.w700, fontSize: 18, fontFamily: FontFamily.interBold, textColor: blackColor),
                            text(productsController.wholesalerInvoicedReportData.value.data?.payment?.status??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: greenColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("payment_method".tr, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            text(productsController.wholesalerInvoicedReportData.value.data?.payment?.method??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Ttransaction_id".tr, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                            text(productsController.wholesalerInvoicedReportData.value.data?.payment?.transactionId??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: darkGreyColor),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("payment_date".tr, fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: blackColor),
                            text(productsController.wholesalerInvoicedReportData.value.data?.payment?.paymentDate??"", fontWeight: FontWeight.w400, fontSize: 14, fontFamily: FontFamily.interRegular, textColor: blackColor),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.favorite, color: dark1BrownColor,),
                        text("thank_business".tr, fontSize: 16, fontWeight: FontWeight.w400, textColor: blackColor),
                        text("we_appreciate_partnership".tr, fontSize: 16, fontWeight: FontWeight.w400, textColor: blackColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.download),
                      text("download".tr, textColor: blackColor),
                    ],
                  )
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        text("share".tr, textColor: blackColor),
                      ],
                    )
                ),
                InkWell(
                  onTap: (){
                    //Get.to(InvoiceReportScreen());
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: dark1BrownColor,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.print, color: Colors.white,),
                          text("print".tr, textColor: white),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
