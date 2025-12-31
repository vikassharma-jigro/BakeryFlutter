import 'package:bakerybrown/api_services/api_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import '../../app_utils/text_widget.dart';
import '../../getx_controller/product_controller.dart';






class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}


class _MyProductScreenState extends State<MyProductScreen> {
  TextEditingController searchController = TextEditingController();
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    Future.microtask(() {
      productsController.getWholesalerProductListApi(context: context);
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
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: blackColor),
                  ),

                  Expanded(
                    child: text(
                      "Product List".tr,
                      textColor: brownColor,
                      isCentered: true,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: FontFamily.interBold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

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

              Obx(() {

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: productsController.wholesalerProductList.value.data?.length??0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var productData = productsController.wholesalerProductList.value.data?[index];
                    totalQty = productData?.count;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                child: CachedNetworkImage(
                                  imageUrl: "$IP${productData?.img??""}",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Image.asset(AppImages.multigrainbread,height: 60,),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                text(productData?.name??"",
                                    textColor: blackColor,fontWeight: FontWeight.w600,
                                    fontSize: 14,fontFamily: FontFamily.interBold
                                ),
                                Row(
                                  children: [
                                    text("€${productData?.price??""}",
                                        textColor: brownColor,fontWeight: FontWeight.w600,
                                        fontSize: 16,fontFamily: FontFamily.interBold
                                    ),
                                    SizedBox(width: 40,),
                                    text("Stock",
                                        textColor: greenColor,fontWeight: FontWeight.w600,
                                        fontSize: 16,fontFamily: FontFamily.interBold
                                    ),
                                  ],
                                ),


                                SizedBox(height: 10,),
                              ],
                            ),
                            Icon(Icons.edit,color: brownColor,),
                          ],
                        ),
                      ),
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

