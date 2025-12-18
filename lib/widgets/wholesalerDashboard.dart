import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../app_utils/app_colors.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';

class WholeSalerDashboard{
  static Widget DashBoardCards(String imgPath, String title, String subTitle){
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imgPath, width: 48, height: 48,),
          SizedBox(height: 10,),
          text("${title}", fontSize: 24, textColor: dark1BrownColor ,fontWeight: FontWeight.w700, fontFamily: FontFamily.interRegular),
          SizedBox(height: 10,),
          text("${subTitle}", fontSize: 14, textColor: darkGreyColor ,fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular),
        ],
      ),
    );
  }

  static Widget OrderScreenCards(
      String imgPath,
      String title,
      String subTitle,
      String counterText,
      Color color
      ) {
    return Container(
      padding: EdgeInsets.all(21),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildImage(imgPath, color),
              SizedBox(width: 3),
              text(counterText,
                  fontSize: 13,
                  textColor: color,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.interRegular),
            ],
          ),
          SizedBox(height: 10),
          text(title,
              fontSize: 24,
              textColor: dark1BrownColor,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.interRegular),
          SizedBox(height: 10),
          text(subTitle,
              fontSize: 14,
              textColor: dark1BrownColor,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.interRegular),
        ],
      ),
    );
  }

  static Widget OrdersDetailsCard(String imgPath, String orderId, String orderDetails, String orderFrom, String date, String orderStatus){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(imgPath, width: 50, height: 50,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("$orderId", fontSize: 14, fontWeight: FontWeight.w600, fontFamily: FontFamily.interBold, textColor: blackColor),
                  text("$orderDetails", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor)
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: text("$orderStatus", textColor: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              text("$orderFrom", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
              Spacer(),
              text("$date", fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular, textColor: dark1BrownColor),
            ],
          ),
        ],
      ),
    );
  }

  static Widget DashBoardQuickActionCards(BuildContext context, String imgPath, String title, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(

         width: MediaQuery.sizeOf(context).width * 0.2,
         height: MediaQuery.sizeOf(context).width * 0.33,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: lightBoxColor,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.01,),
               // padding : EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 2,vertical: 15),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: SvgPicture.asset(imgPath)),
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.center,
              child: text("${title}", textColor: dark1BrownColor,
                  fontFamily: FontFamily.interRegular,
                  fontWeight: FontWeight.w500, fontSize: 12,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }

  static Widget ReatailerQuickActionCards(BuildContext context, String imgPath, String title, String subtitle, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.2,
        height: MediaQuery.sizeOf(context).width * 0.4,
        decoration: BoxDecoration(
          color: brownColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.03, bottom: MediaQuery.sizeOf(context).height * 0.01),
                  padding : EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Center(child: SvgPicture.asset(imgPath)),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    width: double.infinity,
                    child: text("${title}", textColor: dark1BrownColor, fontFamily: FontFamily.interRegular, fontWeight: FontWeight.w500, fontSize: 14, textAlign: TextAlign.center)),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget DashBoardBarChartDetails(String title, String unitNumbers){
    return Row(
      children: [
        text(
          "${title}",
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.interRegular,
          textColor: darkGreyColor,
        ),
        Spacer(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${unitNumbers} ",
                style: TextStyle(
                  color: dark1BrownColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: "units",
                style: TextStyle(
                  color: dark1BrownColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )

      ],
    );
  }

  static Widget DashBoardRecentActivity(String imgPath, String title, String subtitle){
    return Row(
      children: [
        Container(
          padding : EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightBrownColor.withOpacity(0.6),
          ),
          child: SvgPicture.asset(imgPath),
        ),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("${title}", textColor: blackColor, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: FontFamily.interRegular),
            text("${subtitle}", textColor: darkBrownColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: FontFamily.interRegular),
          ],
        ),
      ],
    );
  }

  static Widget AccountsDashBoard(IconData icon, String title, String subTitle, Color iconColor, BuildContext context){
    return Container(
      padding: EdgeInsets.all(21),
      width: MediaQuery.sizeOf(context).width * 0.45,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: white,
        border: Border.all(color: iconColor.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
              color: iconColor.withOpacity(0.3),
            ),
            child: Icon(icon, color: iconColor,),
          ),
          SizedBox(height: 10),
          text(
            "€2,45,000",
            fontSize: 24,
            textColor: blackColor,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.interBold,
          ),
          SizedBox(height: 10),
          text(
            "Amount to receive",
            fontSize: 12,
            textColor: blackColor,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.interRegular,
          ),
        ],
      ),
    );
  }

  static Widget AccountsLedgerCard(BuildContext context, String title, String price, IconData icons, Color color){
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                  "${title}",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  textColor: color,
                ),
                text(
                  "${price}",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  textColor: color,
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Icon(icons, color: color,),
              )
          ),
        ],
      ),
    );
  }

  // Helper that decides SVG or PNG/JPG
  static Widget _buildImage(String path, Color color) {
    if (path.toLowerCase().endsWith(".svg")) {
      return SvgPicture.asset(
        path,
        width: 40,
        height: 40,
        color: color,
      );
    } else {
      return Image.asset(
        path,
        width: 48,
        height: 48,
        fit: BoxFit.contain,
        color: color,
      );
    }
  }
}