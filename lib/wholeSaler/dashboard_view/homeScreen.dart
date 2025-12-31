import 'package:bakerybrown/app_utils/text_widget.dart';
import 'package:bakerybrown/wholeSaler/breadCatalog.dart';
import 'package:bakerybrown/wholeSaler/invoiceScreen/invoice&ReportsScreen.dart';
import 'package:bakerybrown/wholeSaler/invoiceScreen/invoiceScreen.dart';
import 'package:bakerybrown/wholeSaler/retailersScreens/retailersScreen.dart';
import 'package:bakerybrown/wholeSaler/routesMaping/routesAndMapping.dart';
import 'package:bakerybrown/widgets/wholesalerDashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../getx_controller/product_controller.dart';

class WholeSalerHomescreen extends StatefulWidget {
  const WholeSalerHomescreen({super.key});

  @override
  State<WholeSalerHomescreen> createState() => _WholeSalerHomescreenState();
}

class _WholeSalerHomescreenState extends State<WholeSalerHomescreen> {

  int selectedIndex = 0;
  final ProductsController productsController = Get.put(ProductsController());



  final List<String> products = [
    "ordered".tr,
    "delivered".tr,
  ];

  final List<double> values = [380, 130, 300, 200, 400, 320, 70];

  final List<Color> barColors = [
    Color(0xFF7D4B27),
    Color(0xFF8E5A34),
  ];
  @override
  void initState() {
    Future.microtask(() {
      productsController.getWholesalerDashboardApi(context: context);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Scaffold(
          backgroundColor: softIvoryColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70), // Fixed Size to the AppBar
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: AppBar(
                backgroundColor: white,
                automaticallyImplyLeading: false,
                iconTheme: const IconThemeData(
                  color: blackColor, // <-- Drawer icon color
                ),
                title: Row(
                  children: [
                    Image.asset(AppImages.homeIcon, height: 50),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        text(
                          "bakery".tr,
                          textColor: dark1BrownColor,
                          fontFamily: FontFamily.interBold,
                          fontSize: 24,
                        ),
                        text(
                          "Dec  27,2024",
                          textColor: darkBrownColor,
                          fontFamily: FontFamily.interRegular,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(AppImages.notificationWholesaler),
                    SizedBox(width: 10),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(AppImages.imgIcon),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cards made
                  // 1 Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WholeSalerDashboard.DashBoardCards(
                          AppImages.wallet1Icon,
                          productsController.wholesalerDashboardData.value.cards?.todaysOrders.toString()??"",
                          "today_order".tr,
                        ),
                      ),
                      Expanded(
                        child: WholeSalerDashboard.DashBoardCards(
                          AppImages.truckIcon,
                          "0",
                          "delivered_today".tr,
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: WholeSalerDashboard.DashBoardCards(
                          AppImages.disclaimerIcon,
                          "€${productsController.wholesalerDashboardData.value.cards?.pendingAmount.toString()??""}",
                          "pending_amount1".tr,
                        ),
                      ),
                      Expanded(
                        child: WholeSalerDashboard.DashBoardCards(
                          AppImages.shopHolderIcon,
                          productsController.wholesalerDashboardData.value.cards?.totalRetailers.toString()??"",
                          "total_retailers".tr,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),

                  // Quick Action Heading
                  text(
                    "quick_actions".tr,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.interRegular,
                    textColor: dark1BrownColor,
                  ),
                  SizedBox(height: 10),

                  // Quick Action Cards
                  // 2 Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WholeSalerDashboard.DashBoardQuickActionCards(
                        context,
                        AppImages.catalogIcon,
                        "catalog".tr,
                          (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Breadcatalog()));
                          },
                      ),
                      WholeSalerDashboard.DashBoardQuickActionCards(
                        context,
                        AppImages.profileIcon,
                        "add_retailer".tr,
                          (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RetailersScreen()));
                          },
                      ),
                      WholeSalerDashboard.DashBoardQuickActionCards(
                        context,
                        AppImages.locationIcon,
                        "routes".tr,
                          (){
                            Get.to(Routesandmapping());
                          },
                      ),
                      WholeSalerDashboard.DashBoardQuickActionCards(
                        context,
                        AppImages.invoiceIcon,
                        "invoice".tr,
                          (){
                            Get.to(InvoiceReportScreen());
                          },
                      ),
                    ],
                  ),
                  SizedBox(height: 32),

                  // Live Analytics
                  // 3 Section
                  Container(
                    padding: EdgeInsets.all(24),
                    width: MediaQuery.sizeOf(context).width,
                    //height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                          "live_analytics".tr,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.interBold,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        // Bar chart is apply
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: softIvoryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                           // height: 160,
                            child: AspectRatio(
                              aspectRatio: 1.3,
                              child: BarChart(
                                BarChartData(
                                  maxY: 450,
                                  barTouchData: BarTouchData(enabled: false),
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 100,
                                        reservedSize: 40,
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                                          return Text(
                                            days[value.toInt()],
                                            style: const TextStyle(fontSize: 10),
                                          );
                                        },
                                      ),
                                    ),
                                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                  ),
                                  gridData: FlGridData(show: false),
                                  borderData: FlBorderData(show: false),
                                  barGroups: List.generate(productsController.wholesalerDashboardData.value.analytics?.last7DaysRetailerOrders?.length??0, (index) {
                                    return BarChartGroupData(
                                      x: index,
                                      barRods: [
                                        BarChartRodData(
                                          toY: (productsController
                                        .wholesalerDashboardData
                                        .value
                                        .analytics!
                                        .last7DaysRetailerOrders![index]
                                        .orders ?? 0)
                                        .toDouble(),
                                          width: 18,
                                          borderRadius: BorderRadius.circular(4),
                                          color: Colors.brown,
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24,),

                        Divider(),
                        SizedBox(height: 17,),

                        text(
                          "top_selling_breads".tr,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.interBold,
                          textColor: dark1BrownColor,
                        ),
                        SizedBox(height: 10,),

                        WholeSalerDashboard.DashBoardBarChartDetails("white_bread".tr, "89"),

                        WholeSalerDashboard.DashBoardBarChartDetails("whole_wheat".tr, "76"),

                        WholeSalerDashboard.DashBoardBarChartDetails("multigrain".tr, "54"),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),

                  // Recent Activity
                  // 4 Section
                  Container(
                    padding: EdgeInsets.all(24),
                    width: MediaQuery.sizeOf(context).width,
                    //height: MediaQuery.sizeOf(context).height * 0.32,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("recent_activity".tr,
                            fontFamily: FontFamily.interBold,
                            fontWeight: FontWeight.w700, fontSize: 18,
                            textColor: dark1BrownColor),
                        SizedBox(height: 16,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: productsController.wholesalerDashboardData.value.recentActivity?.length??0,
                          itemBuilder: (context, index) {
                            var recentActivity = productsController.wholesalerDashboardData.value.recentActivity?[index];
                            String iso = recentActivity?.time??"";

                            String date = iso.split("T")[0];      // 2025-12-23
                            String time = iso.split("T")[1]
                                .split(".")[0];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(AppImages.cartAddIcon),
                                  SizedBox(width: 30,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      text(recentActivity?.type??"",
                                          fontFamily: FontFamily.interBold,
                                          fontWeight: FontWeight.w700, fontSize: 13,
                                          textColor: dark1BrownColor
                                      ),
                                      text(recentActivity?.message??"",
                                          fontFamily: FontFamily.interRegular,
                                          fontWeight: FontWeight.w400, fontSize: 13,
                                          textColor: lightGrey
                                      ),
                                      text(time,
                                          fontFamily: FontFamily.interSansMedium,
                                          fontWeight: FontWeight.w500, fontSize: 13,
                                          textColor: greenColor
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          );
                        },)
                        // WholeSalerDashboard.DashBoardRecentActivity(AppImages.profileTickIcon, "new_retailer_onboarded".tr, "2 hours ago"),
                        // SizedBox(height: 18,),
                        // Divider(),
                        //
                        // WholeSalerDashboard.DashBoardRecentActivity(AppImages.cartAddIcon, "new_orders_placed".tr, "4 hours ago"),
                        // SizedBox(height: 18,),
                        // Divider(),
                        //
                        // WholeSalerDashboard.DashBoardRecentActivity(AppImages.paymentAddIcon, "payment_received".tr, "6 hours ago"),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
