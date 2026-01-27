import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../app_utils/custom_textFiled.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/product_controller.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}


class _OrderListScreenState extends State<OrderListScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  dynamic date;
  dynamic dateTo;
  String? _selectedOption = 'newest_oldest'.tr;
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    Future.microtask(() {
      productsController.getRetailerOrderListApi(context: context,to: "",from: "");
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
          backgroundColor: softIvoryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120), // 👈 Yaha height set karo
              child: Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(
                              child: text(
                                "order_history".tr,
                                textColor: brownColor,
                                isCentered: true,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily: FontFamily.interBold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 130,
                              child: CustomRoundTextField(
                                readOnly: true,
                                controller:fromController,
                                onTap: (){
                                  calenderForGetDay(context);
                                },
                                keyboardType: TextInputType.name,
                                hintText: "from".tr,
                                borderColor: borderColor,
                                hintColor: blackColor,
                                hintSize: 10,
                                maxLines: 2,
                                fillColor: softIvoryColor,
                                borderRadius: 15,
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: CustomRoundTextField(
                                readOnly: true,
                                controller: toController,
                                onTap: (){
                                  calenderForGetDayTo(context);
                                },
                                keyboardType: TextInputType.name,
                                hintText: "to".tr,
                                borderColor: borderColor,
                                hintColor: blackColor,
                                hintSize: 10,
                                maxLines: 2,
                                fillColor: softIvoryColor,
                                borderRadius: 15,
                              ),
                            ),
                          ],
                        ),
                       /* Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: softIvoryColor,
                            border: Border.all(color: brownColor)
                          ),
                          child: Row(
                            children: [

                              DropdownButton<String>(
                                value: _selectedOption,
                                items: <String>['newest_oldest'.tr, 'oldest_newest'.tr].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: text(value,textColor: blackColor,fontSize: 14),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue!;
                                  });
                                },
                                underline: const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),


          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: productsController.retailerOrderData.value.data?.length??0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var retailerOrderData =  productsController.retailerOrderData.value.data?[index];
                      String iso = retailerOrderData?.createdAt??"";

                      String date = iso.split("T")[0];      // 2025-12-23
                      String time = iso.split("T")[1]
                          .split(".")[0];                   // 11:04:55
                      return Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: white,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text(retailerOrderData?.Id??"",
                                    textColor: dark1BrownColor,
                                    isCentered: true,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: FontFamily.interBold
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: retailerOrderData?.status=="packed"?darkBrownColor:dark1BrownColor
                                  ),
                                  child: text(retailerOrderData?.status?.capitalizeFirst??"",
                                      textColor: white,
                                      isCentered: true,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontFamily: FontFamily.interBold
                                  ),
                                ),


                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.calendar_month,color: brownColor,size: 15,),
                                SizedBox(width: 10,),
                                text("${date} ${time}",
                                    textColor: textBrown,
                                    isCentered: true,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: FontFamily.interRegular
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                text("${retailerOrderData?.quantity.toString()??""} item",
                                    textColor: textBrown,
                                    isCentered: true,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: FontFamily.interRegular
                                ),
                                SizedBox(width: 40,),
                                text(retailerOrderData?.productName??"",
                                    textColor: textBrown,
                                    isCentered: true,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: FontFamily.interRegular
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Divider(),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text("total_amount".tr,
                                    textColor: textBrown,
                                    isCentered: true,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: FontFamily.interRegular
                                ),
                                text("€${retailerOrderData?.totalAmount.toString()??""}",
                                    textColor: textBrownColor,
                                    isCentered: true,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: FontFamily.interBold
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },),
                ],
              ),
            ),
          ),

        );
      }
    );
  }

  calenderForGetDay(BuildContext context) async {
    return await showDatePicker(
        fieldHintText: "dd-MM-yyyy",
        keyboardType: TextInputType.name,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.blue,
              hintColor: Colors.blue,
              colorScheme: const ColorScheme.light(
                  primary: dark1BrownColor,
                  onSecondary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                  secondary: Colors.white),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? const Text(''),
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate != null) {
        date = DateFormat('yyyy-MM-dd').format(selectedDate);
        print("date>>>>${date}");
        fromController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
        //toController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      }
    });
  }
  calenderForGetDayTo(BuildContext context) async {
    return await showDatePicker(
        fieldHintText: "dd-MM-yyyy",
        keyboardType: TextInputType.name,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.blue,
              hintColor: Colors.blue,
              colorScheme: const ColorScheme.light(
                  primary: dark1BrownColor,
                  onSecondary: Colors.blue,
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                  secondary: Colors.white),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? const Text(''),
          );
        },
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate != null) {
        dateTo = DateFormat('yyyy-MM-dd').format(selectedDate);
        productsController.getRetailerOrderListApi(context: context,to: dateTo,from: date);
        toController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      }
    });
  }
}
