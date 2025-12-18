import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/widgets/wholesalerDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';

class Retailersledgerscreen extends StatefulWidget {
  const Retailersledgerscreen({super.key});

  @override
  State<Retailersledgerscreen> createState() => _RetailersledgerscreenState();
}

class _RetailersledgerscreenState extends State<Retailersledgerscreen> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> transactionType = [
    // All List
    {
      'id': 'All',
      'image': AppImages.paymentIcon,
      'payment': '+€5,200',
      'payment_type': 'Cash Payment',
      'date': 'Dec 15,2024',
      'time': '2:30 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': greenColor,
      'payment_status_color': greenColor,
    },
    {
      'id': 'All',
      'image': AppImages.cartIcon,
      'payment': '-€3,450',
      'payment_type': 'New Order',
      'date': 'Dec 14, 2024',
      'time': '11:15 AM',
      'payment_id': 'Payment for Order #ORD456',
      'color' : Colors.red,
      'payment_status_color': Colors.red,
    },
    {
      'id': 'All',
      'image': AppImages.paymentIcon,
      'payment': '+€8,750',
      'payment_type': 'Online Transfer',
      'date': 'Dec 12, 2024',
      'time': '4:45 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color' : Colors.blue,
      'payment_status_color': greenColor,
    },
    {
      'id': 'All',
      'image': AppImages.cartIcon,
      'payment': '-€2,450',
      'payment_type': 'New Order',
      'date': 'Dec 11, 2024',
      'time': '9:15 AM',
      'payment_id': 'Payment for Order #ORD456',
      'color' : Colors.red,
      'payment_status_color': Colors.red,
    },

    // Cash List
    {
      'id': 'Cash',
      'image': AppImages.paymentIcon,
      'payment': '+€5,200',
      'payment_type': 'Cash Payment',
      'date': 'Dec 15,2024',
      'time': '2:30 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': greenColor,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cash',
      'image': AppImages.paymentIcon,
      'payment': '+€2,100',
      'payment_type': 'Cash Payment',
      'date': 'Dec 14,2024',
      'time': '4:30 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': greenColor,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cash',
      'image': AppImages.paymentIcon,
      'payment': '+€3,450',
      'payment_type': 'Cash Payment',
      'date': 'Dec 13,2024',
      'time': '10:30 AM',
      'payment_id': 'Payment for Order #ORD456',
      'color': greenColor,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cash',
      'image': AppImages.paymentIcon,
      'payment': '+€8,750',
      'payment_type': 'Cash Payment',
      'date': 'Dec 11,2024',
      'time': '2:00 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': greenColor,
      'payment_status_color': greenColor,
    },

    // Online List
    {
      'id': 'Online',
      'image': AppImages.paymentIcon,
      'payment': '+€5,200',
      'payment_type': 'Online Transfer',
      'date': 'Dec 15,2024',
      'time': '2:30 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': Colors.blue,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Online',
      'image': AppImages.paymentIcon,
      'payment': '+€2,100',
      'payment_type': 'Online Transfer',
      'date': 'Dec 14,2024',
      'time': '4:30 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': Colors.blue,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Online',
      'image': AppImages.paymentIcon,
      'payment': '+€3,450',
      'payment_type': 'Online Transfer',
      'date': 'Dec 13,2024',
      'time': '10:30 AM',
      'payment_id': 'Payment for Order #ORD456',
      'color': Colors.blue,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Online',
      'image': AppImages.paymentIcon,
      'payment': '+€8,750',
      'payment_type': 'Online Transfer',
      'date': 'Dec 11,2024',
      'time': '2:00 PM',
      'payment_id': 'Payment for Order #ORD456',
      'color': Colors.blue,
      'payment_status_color': greenColor,
    },

    // Cheque List
    {
      'id': 'Cheque',
      'image': AppImages.paymentIcon,
      'payment': '+€5,200',
      'payment_type': 'Cheque Payment',
      'date': 'Dec 15,2024',
      'time': '2:30 PM',
      'payment_id': 'Cheque #123456 - HDFC Bank',
      'color': Colors.yellow,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cheque',
      'image': AppImages.paymentIcon,
      'payment': '+€2,100',
      'payment_type': 'Cheque Payment',
      'date': 'Dec 14,2024',
      'time': '4:30 PM',
      'payment_id': 'Cheque #123456 - HDFC Bank',
      'color': Colors.yellow,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cheque',
      'image': AppImages.paymentIcon,
      'payment': '+€3,450',
      'payment_type': 'Cheque Payment',
      'date': 'Dec 13,2024',
      'time': '10:30 AM',
      'payment_id': 'Cheque #123456 - HDFC Bank',
      'color': Colors.yellow,
      'payment_status_color': greenColor,
    },
    {
      'id': 'Cheque',
      'image': AppImages.paymentIcon,
      'payment': '+€8,750',
      'payment_type': 'Cheque Payment',
      'date': 'Dec 11,2024',
      'time': '2:00 PM',
      'payment_id': 'Cheque #123456 - HDFC Bank',
      'color': Colors.yellow,
      'payment_status_color': greenColor,
    },
  ];

  String get selectedId {
    if(selectedIndex == 0) return 'All';
    if(selectedIndex == 1) return 'Cash';
    if(selectedIndex == 2) return 'Online';
    if(selectedIndex == 3) return 'Cheque';
    return 'All';
  }

  List<Map<String, dynamic>> get filterPayment {
    if(selectedId == 'All') {
      return transactionType;
    }

    return transactionType.where((item) => item['id'] == selectedId).toList();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: text(
                "retailer_ledger".tr,
                isCentered: true,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.interBold,
                textColor: dark1BrownColor,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WholeSalerDashboard.AccountsLedgerCard(
                    context,
                    "pending_amount1".tr,
                    "€12,450",
                    Icons.watch_later,
                    Colors.red,
                  ),
                  WholeSalerDashboard.AccountsLedgerCard(
                    context,
                    "paid_amount".tr,
                    "€45,200",
                    Icons.check_circle,
                    greenColor,
                  ),
                ],
              ),
              SizedBox(height: 16),
        
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(
                                "total_outstanding".tr,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                textColor: dark1BrownColor,
                              ),
                              text(
                                "€57,650",
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                textColor: dark1BrownColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(
                              Icons.stacked_line_chart,
                              color: dark1BrownColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    text(
                      'Last Payment: Dec 15, 2024',
                      textColor: dark1BrownColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildFilter("all".tr, 0),
                  SizedBox(width: 10),
                  buildFilter("cash".tr, 1),
                  SizedBox(width: 10),
                  buildFilter("online".tr, 2),
                  SizedBox(width: 10),
                  buildFilter("cheque".tr, 3),
                ],
              ),
              SizedBox(height: 16),
        
              text(
                "transaction_history".tr,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.interBold,
                textColor: dark1BrownColor,
              ),
              SizedBox(height: 16),
        
              ListView.builder(
                itemCount: filterPayment.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index){

                    final data = filterPayment[index];

                    return Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: greenColor.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      AppImages.paymentIcon,
                                      width: 30,
                                      height: 30,
                                      color: data['color'],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
        
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      "${data['payment']}",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      textColor: data['payment_status_color'],
                                    ),
                                    text(
                                      "${data['payment_type']}",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      textColor: blackColor,
                                    ),
                                  ],
                                ),
                              ),
        
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    text(
                                      "${data['date']}",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      textColor: blackColor,
                                    ),
                                    text(
                                      "${data['time']}",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      textColor: blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          text(
                            "${data['payment_id']}",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.interRegular,
                            textColor: darkGreyColor,
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilter(String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? darkBrownColor : white,
          borderRadius: BorderRadius.circular(21),
          border: Border.all(color: darkBrownColor),
        ),
        child: text(
          label,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: isSelected ? white : blackColor,
        ),
      ),
    );
  }
}
