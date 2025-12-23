import 'package:bakerybrown/api_services/api_config.dart';
import 'package:bakerybrown/cart_view/cart_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/app_colors.dart';
import '../app_utils/app_images.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/product_controller.dart';





class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}


class _ProductListScreenState extends State<ProductListScreen> {
  TextEditingController searchController = TextEditingController();
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    Future.microtask(() {
      productsController.getProductsWholesalerListApi(context: context);
    },);
    super.initState();
  }

  int? totalQty;

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: softIvoryColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(107), // 👈 Yaha height set karo
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: blackColor),
                      ),

                      text(
                        "bakery_catalog".tr,
                        textColor: brownColor,
                        isCentered: true,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: FontFamily.interBold,
                      ),

                      InkWell(
                        onTap: () {
                          Get.to(CartScreen(totalQty: totalQty.toString()));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(AppImages.cartIcon, height: 40),
                            // Positioned(
                            //   right: -10,
                            //   top: -5,
                            //   child: Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: softIvoryColor,
                            //     ),
                            //     child: text(
                            //       "${totalQty??"0"}",
                            //       textColor: brownColor,
                            //       isCentered: true,
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 10,
                            //       fontFamily: FontFamily.interBold,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: brownColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: brownColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: brownColor),
                      fillColor: softIvoryColor,
                      hintText: "search_products..".tr,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Obx(() {

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,        // 👉 2 items per row
                          childAspectRatio: 0.6,    // item height-controller
                          crossAxisSpacing: 10,

                        ),
                        itemCount: productsController.productWholesalerList.value.data?.length??0,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          var productData = productsController.productWholesalerList.value.data?[index];
                          totalQty = productData?.count;
                          print("ram");

                          return Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                  child: CachedNetworkImage(
                                    imageUrl: "$IP${productData?.img??""}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  )),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),bottomRight: Radius.circular(15)),
                                  color: white
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(productData?.name??"",
                                        textColor: blackColor,fontWeight: FontWeight.w600,
                                        fontSize: 14,fontFamily: FontFamily.interBold
                                    ),
                                    text("€${productData?.price??""}",
                                        textColor: brownColor,fontWeight: FontWeight.w600,
                                        fontSize: 16,fontFamily: FontFamily.interBold
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        text("${productData?.quantityPerUnit.toString()??""}${productData?.unit.toString()??""}",
                                            textColor: darkGreyColor,fontWeight: FontWeight.w600,
                                            fontSize: 10,fontFamily: FontFamily.interBold
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: white
                                          ),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // MINUS BTN
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (productData!.count > 0) productData.count--;
                                                  });
                                                },
                                                child: Icon(Icons.remove, size: 20,color: brownColor,),
                                              ),
                                              SizedBox(width: 4,),
                                              text(
                                                  productData?.count.toString()??"",
                                                  textColor: darkBrownColor,
                                                  fontSize: 13,fontFamily: FontFamily.interBold,
                                                  fontWeight: FontWeight.w600
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    productData?.count++;
                                                  });
                                                },
                                                child: Icon(Icons.add, size: 20,color: brownColor,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    CommonButton(
                                      text: "Add to Order",
                                      onPressed: (){
                                        productsController.getAddToCartApi(
                                          context: context,
                                          productId: productData?.productId.toString(),
                                          quantity: productData?.count,
                                          sellerId: productData?.sellerId.toString(),
                                        );
                                      },
                                      fontFamily: FontFamily.interBold,
                                      fontWeight: FontWeight.w600,
                                      color: dark1BrownColor,
                                    ),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },);
                    }
                  ),
                ],
              ),
            ),
          ),
        );

  }

}

