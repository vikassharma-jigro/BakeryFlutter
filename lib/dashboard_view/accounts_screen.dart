import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/custom_textFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';




class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}


class _AccountsScreenState extends State<AccountsScreen> {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
dynamic date;
dynamic dateTo;
  bool isOn = false;
  @override
  void initState() {
    super.initState();
  }
  List<Map<String, dynamic>> orderList = [
    {
      "name": "Jan 15, 2024 • 9:30 AM",
      "orderID": "#ORD-2461",
      "price": "€1,240",
      "orderStatus": "Paid",
      "itemName":"Cakes, Cookies, Donuts"
    },
    {
      "name": "Jan 14, 2024 • 2:15 PM",
      "orderID": "#ORD-2459",
      "price": "€1,240",
      "orderStatus": "Paid",
      "item":"10 Items",
      "itemName":"Bagels, Pastries"
    },
    {
      "name": "Jan 13, 2024 • 11:45 AM",
      "orderID": "#ORD-2460",
      "price": "€1,240",
      "orderStatus": "Pending",
      "item":"13 Items",
      "itemName":"Sourdough, Rolls"
    },
    {
      "name": "Jan 12, 2024 • 11:30 AM",
      "orderID": "#ORD-2434",
      "price": "€1,240",
      "orderStatus": "Pending",
      "item":"22 Items",
      "itemName":"Baguettes, Cupcakes"

    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   Row(
          children: [
            Expanded(
              child: text("accounts_payments".tr,
                  textColor: brownColor,
                  isCentered: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: FontFamily.interBold
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("total_factory".tr,
                            textColor: brownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: FontFamily.interSansMedium
                        ),
                        Image.asset(AppImages.checkIcon,height: 50,),
                      ],
                    ),
                    text("€70,000",
                        textColor: dark1BrownColor,
                        isCentered: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: FontFamily.interBold
                    ),
                    text("total_date".tr,
                        textColor: darkGreyColor,
                        isCentered: true,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: FontFamily.interRegular
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("pending_amount".tr,
                            textColor: brownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: FontFamily.interSansMedium
                        ),
                        Image.asset(AppImages.errorIcon,height: 50,),
                      ],
                    ),
                    text("€20,000",
                        textColor: dark1BrownColor,
                        isCentered: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: FontFamily.interBold
                    ),
                    text("remaining_balance".tr,
                        textColor: darkGreyColor,
                        isCentered: true,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: FontFamily.interRegular
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("today_cost_report".tr,
                            textColor: brownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: FontFamily.interSansMedium
                        ),
                        Image.asset(AppImages.calenderIcon,height: 50,),
                      ],
                    ),
                    text("€70,000",
                        textColor: dark1BrownColor,
                        isCentered: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: FontFamily.interBold
                    ),
                    text("cost_incurred_today".tr,
                        textColor: darkGreyColor,
                        isCentered: true,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: FontFamily.interRegular
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("daily_cost_report".tr,
                        textColor: dark1BrownColor,
                        isCentered: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: FontFamily.interBold
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Date",
                            textColor: dark1BrownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: FontFamily.interBold
                        ),
                        text("items".tr,
                            textColor: dark1BrownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: FontFamily.interBold
                        ),
                        text("cost".tr,
                            textColor: dark1BrownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: FontFamily.interBold
                        ),
                        text("status".tr,
                            textColor: dark1BrownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: FontFamily.interBold
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    ListView.builder(
                      itemCount: 5,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Nov 25",
                                textColor: darkGreyColor,
                                isCentered: true,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular
                            ),
                            SizedBox(width: 3,),
                            text("Flour, Sugar",
                                textColor: darkGreyColor,
                                isCentered: true,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular
                            ),
                            SizedBox(width: 3,),
                            //Spacer(),
                            text("€2,500",
                                textColor: dark1BrownColor,
                                isCentered: true,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular
                            ),
                            SizedBox(width: 20,),
                            //Spacer(),
                            text("Paid",
                                textColor: greenColor,
                                isCentered: true,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular
                            ),
                          ],
                        ),
                      );
                    },)
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lightBrownColor,),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.notificationIcon,height: 50,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text("payment_reminder".tr,
                                textColor: dark1BrownColor,
                                isCentered: true,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                fontFamily: FontFamily.interBold
                            ),
                            text("retailer_reminder_active".tr,
                                textColor: darkGreyColor,
                                isCentered: true,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("weekly_reminder".tr,
                            textColor: dark1BrownColor,
                            isCentered: true,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: FontFamily.interSansMedium
                        ),
         Switch(
          value: isOn,
          activeColor: white,          // Thumb color On
          activeTrackColor: dark1BrownColor,     // Track On
          inactiveThumbColor: white,   // Thumb Off
          inactiveTrackColor: lightBrownColor,    // Track Off
          onChanged: (val) {
            setState(() {
              isOn = val;
            });
          },
        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: white,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text("transaction_history".tr,
                        textColor: blackColor,
                        isCentered: true,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: FontFamily.interBold
                    ),
                    SizedBox(height: 10,),
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
                            fillColor: white,
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
                            fillColor: white,
                            borderRadius: 15,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),
                    ListView.builder(
                      itemCount: orderList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {

                        return Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: softIvoryColor,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(orderList[index]["name"],
                                      textColor: darkGreyColor,
                                      isCentered: true,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      fontFamily: FontFamily.interRegular
                                  ),
                                  text(orderList[index]["price"],
                                      textColor: dark1BrownColor,
                                      isCentered: true,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily: FontFamily.interBold
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  text(orderList[index]["orderID"],
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
                                        color: orderList[index]["orderStatus"]=="Pending"?redColor.withOpacity(.1):greenColor.withOpacity(.1)
                                    ),
                                    child: text(orderList[index]["orderStatus"],
                                        textColor: orderList[index]["orderStatus"]=="Pending"?redColor:greenColor,
                                        isCentered: true,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily: FontFamily.interBold
                                    ),
                                  ),


                                ],
                              ),

                              text(orderList[index]["itemName"],
                                  textColor: textBrown,
                                  isCentered: true,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  fontFamily: FontFamily.interRegular
                              ),

                            ],
                          ),
                        );
                      },),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

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
        print("date>>>>${date}");
        toController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      }
    });
  }
}
