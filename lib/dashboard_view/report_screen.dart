
import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';




class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}


class _ReportScreenState extends State<ReportScreen> {

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  List<String> months = [
    "daily".tr,
    "weekly".tr,
    "monthly".tr,
  ];

  final List<String> products = [
    "croissant".tr,
    "muffin".tr,
    "sourdough".tr,
    "bagel".tr,
    "danish".tr
  ];

  final List<double> values = [520, 430, 390, 320, 280];

  final List<Color> barColors = [
    Color(0xFF7D4B27),
    Color(0xFF8E5A34),
    Color(0xFFA46C45),
    Color(0xFFB98265),
    Color(0xFFC99A7A),
  ];
  List<Map<String, dynamic>> productList = [
    {
      "name": "ciabatta".tr,
      "orderID": "540 sold",
      "icon": Icons.arrow_upward,
      "image": AppImages.cibattaIcon,

    },
    {
      "name": "sourdough_bread".tr,
      "orderID": "420 sold",
      "icon": Icons.arrow_upward,
      "image": AppImages.breadIcon,
    },
    {
      "name": "ciabatta".tr,
      "orderID": "380 sold",
      "icon": Icons.arrow_downward,
      "image": AppImages.breadIcon,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:   Row(
          children: [
            Expanded(
              child: text("reports_analysis".tr,
                  textColor: dark1BrownColor,
                  isCentered: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: months.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedIndex == index;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: isSelected?dark1BrownColor:softIvoryColor
                          ),
                          child: text(
                            months[index],
                            textColor: isSelected?white:dark1BrownColor,
                            isCentered: true,
                            fontSize: 15,
                            fontFamily: FontFamily.interSansMedium,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },),
              ),
              const SizedBox(height: 20),
              Card(
                color: white,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      text(
                          "high_products".tr,
                          textColor: dark1BrownColor,
                          fontSize: 18,
                          fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                      ),
                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: softIvoryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: SizedBox(
                          height: 260,
                          child: BarChart(
                            BarChartData(
                              maxY: 600,
                              minY: 0,

                              // ⬇ NO show: parameter
                              gridData: FlGridData(
                                drawVerticalLine: false,
                                horizontalInterval: 100,
                                getDrawingHorizontalLine: (value) => FlLine(
                                  color: Colors.grey[300],
                                  strokeWidth: 1,
                                ),
                              ),

                              borderData: FlBorderData(
                                border: Border.all(color: Colors.transparent),
                              ),

                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(

                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 100,
                                    reservedSize: 40,
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();

                                      // 🛑 SAFE GUARD: prevent crash
                                      if (index < 0 || index >= products.length) {
                                        return SizedBox.shrink();
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: text(
                                          products[index],
                                          textColor: blackColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: FontFamily.interRegular,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                              ),

                              barGroups: List.generate(products.length, (index) {
                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: values[index],
                                      width: 28,
                                      borderRadius: BorderRadius.circular(4),
                                      color: barColors[index],
                                    )
                                  ],
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              text(
                  "top_products".tr,
                  textColor: dark1BrownColor,
                  fontSize: 18,
                  fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: productList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: softIvoryColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: dark1BrownColor
                                ),
                                child: Center(
                                  child: text(
                                      "${index+1}",
                                      textColor: white,
                                      fontSize: 18,
                                      fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Image.asset(productList[index]["image"],height: 50,),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                      productList[index]["name"],
                                      textColor: brownColor,
                                      maxLine: 2,
                                      fontSize: 13,
                                      fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                                  ),
                                  text(
                                      productList[index]["orderID"],
                                      textColor: brownColor,
                                      fontSize: 16,
                                      fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(productList[index]["icon"],color: greenColor,),
                        ],
                      ),
                    ),
                  );
                },),

              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(
                            "category_analysis".tr,
                            textColor: dark1BrownColor,
                            fontSize: 18,
                            fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightWhiteColor,
                              border: Border.all(color: softIvoryColor)
                          ),
                          child: text(
                              "breads".tr,
                              textColor: dark1BrownColor,
                              fontSize: 14,
                              fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(AppImages.soldIcon,height: 40,),
                            text(
                                "1,240",
                                textColor: dark1BrownColor,
                                fontSize: 24,
                                fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                            ),
                            text(
                                "total_sold".tr,
                                textColor: dark1BrownColor,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(AppImages.dollerIcon,height: 30,),
                            text(
                                "8,420",
                                textColor: dark1BrownColor,
                                fontSize: 24,
                                fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                            ),
                            text(
                                "revenue".tr,
                                textColor: dark1BrownColor,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(AppImages.calenIcon,height: 30,),
                            text(
                                "186",
                                textColor: dark1BrownColor,
                                fontSize: 24,
                                fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                            ),
                            text(
                                "Avg. Daily",
                                textColor: dark1BrownColor,
                                fontSize: 12,
                                fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                            ),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              text(
                  "key_insights".tr,
                  textColor: dark1BrownColor,
                  fontSize: 18,
                  fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lightWhiteColor
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.starIcon,height: 40,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            "key_insights".tr,
                            textColor: dark1BrownColor,
                            fontSize: 18,
                            fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                        ),
                        text(
                            "focaccia".tr,
                            textColor: dark1BrownColor,
                            fontSize: 12,
                            fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: lightWhiteColor
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.questionIcon,height: 40,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            "fastest_growing".tr,
                            textColor: dark1BrownColor,
                            fontSize: 18,
                            fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                        ),
                        text(
                            "Ciabatta (+25%)",
                            textColor: dark1BrownColor,
                            fontSize: 12,
                            fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: lightWhiteColor
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.recordedIcon,height: 40,),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                            "most_reordered".tr,
                            textColor: dark1BrownColor,
                            fontSize: 18,
                            fontFamily: FontFamily.interBold,fontWeight: FontWeight.w600
                        ),
                        text(
                            "sourdough_bread".tr,
                            textColor: dark1BrownColor,
                            fontSize: 12,
                            fontFamily: FontFamily.interRegular,fontWeight: FontWeight.w400
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CommonButton(
                text: "download_report".tr,
                color: dark1BrownColor,
                onPressed: () {},
                fontFamily: FontFamily.interBold,
                fontWeight: FontWeight.w600,textColor: white,),
            ],
          ),
        ),
      ),

    );
  }
}
