import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../api_services/api_config.dart';
import '../app_utils/app_colors.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/product_controller.dart';
final ProductsController productsController = Get.put(ProductsController());

class WholeSalerBreadCatalog {
  static Widget itemCards(
    String title,
    //String subTitle,
    BuildContext context,
    VoidCallback onIncrement,
    VoidCallback onDecrement,
    VoidCallback addOrderTap,
    String weight,
    String imgPath,
    String price,
    int count,
      String? productId,
      String? managerId,
  ) {
    return Container(
      //width: MediaQuery.sizeOf(context).width * 0.44,
      //height: MediaQuery.sizeOf(context).height * 0.4,
      //padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Item Image
          ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(21),
              topLeft: Radius.circular(21),
            ),
            child: CachedNetworkImage(
              imageUrl: imgPath,
              fit: BoxFit.cover,height: 120,width: 157,
              placeholder: (context, url) => Image.asset(AppImages.multigrainbread),
              errorWidget: (context, url, error) => Image.asset(AppImages.multigrainbread),
            ),
          ),
          // Container(
          //   height: 150,
          //   width: 100,
          //   padding: EdgeInsets.symmetric(horizontal: 60),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //       topRight: Radius.circular(21),
          //       topLeft: Radius.circular(21),
          //     ),
          //     image: DecorationImage(
          //       image: NetworkImage(imgPath),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Item Desc
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                     // padding: EdgeInsets.all(11),
                      width: 80,
                      child: text(
                        "${title}",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: blackColor,
                        fontFamily: FontFamily.interBold,
                      ),
                    ),
                    // Container(
                    //   width: 30,
                    //   //padding: EdgeInsets.all(11),
                    //   decoration: BoxDecoration(
                    //     color: greenColor.withOpacity(0.3),
                    //     borderRadius: BorderRadius.circular(21),
                    //   ),
                    //   child: Center(
                    //     child: text(
                    //       "${subTitle}",
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.w500,
                    //       textColor: greenColor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                //SizedBox(height: 8),
                text(
                  "${weight}",
                  fontSize: 12,
                  fontFamily: FontFamily.interRegular,
                  textColor: darkGreyColor.withOpacity(0.5),
                ),
                //SizedBox(height: 8),
                text(
                  "${price}",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.interBold,
                  textColor: dark1BrownColor,
                ),
                SizedBox(height: 10),

                Container(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  padding: EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: onDecrement,
                        child: text(
                          "-",
                          textColor: dark1BrownColor,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      text("${count}", textColor: blackColor, fontSize: 16),
                      Spacer(),
                      InkWell(
                        onTap: onIncrement,
                        child: text(
                          "+",
                          textColor: dark1BrownColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                InkWell(
                  onTap: (){
                    productsController.getAddToCartApi(
                      context: context,
                      productId: productId.toString(),
                      quantity: count,
                      sellerId: managerId,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: dark1BrownColor,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Center(
                      child: text(
                        "Add to order",
                        fontSize: 16,
                        fontFamily: FontFamily.interRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartViewItem {
  static Widget cartItems(
    int count,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
    String image,
    String title,
    String item_type,
    String price,
    String stock_details,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: white,
      ),
      child: Row(
        children: [
          // Image Placement
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Item Details
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("$title", fontSize: 16, textColor: dark1BrownColor),
                  text("$item_type", fontSize: 14, textColor: darkBrownColor),
                  text(
                    "$price",
                    fontSize: 18,
                    textColor: darkBrownColor,
                    fontWeight: FontWeight.w600,
                  ),
                  text("$stock_details", fontSize: 12, textColor: greenColor),
                ],
              ),
            ),
          ),
          // Item Count
          Expanded(
            flex: 2,
            child: Row(
              children: [
                InkWell(
                  onTap: onDecrement,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dark1BrownColor,
                    ),
                    child: Center(
                      child: text("-", textColor: white, fontSize: 20),
                    ),
                  ),
                ),
                Spacer(),
                text("$count", textColor: blackColor, fontSize: 16),
                Spacer(),
                InkWell(
                  onTap: onIncrement,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dark1BrownColor,
                    ),
                    child: Center(
                      child: text("+", textColor: white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RetailersDashBoard {
  static Widget retailersDetailsCard(
    String shopName,
    VoidCallback onShop,
    String ownerName,
    String phoneNumber,
    String address,
    String shopStatus,
  ) {
    return Container(
      padding: EdgeInsets.all(17),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: lightBoxColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              text(
                "$shopName",
                textColor: dark1BrownColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.interBold,
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: dark1BrownColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 3),
          text(
            "$ownerName",
            textColor: blackColor,
            fontFamily: FontFamily.interRegular,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Icon(Icons.phone, color: darkBrownColor),
              SizedBox(width: 3),
              text(
                "$phoneNumber",
                textColor: blackColor,
                fontFamily: FontFamily.interRegular,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Icon(Icons.location_on, color: darkBrownColor),
              SizedBox(width: 3),
              text(
                "$address",
                textColor: blackColor,
                fontFamily: FontFamily.interRegular,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(height: 3),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
              decoration: BoxDecoration(
                color: greenColor.withOpacity(.2),
                borderRadius: BorderRadius.circular(21),
              ),
              child: text(
                "$shopStatus",
                textColor: greenColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
