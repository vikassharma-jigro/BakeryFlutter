import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/font_family.dart';
import 'package:bakerybrown/getx_controller/product_controller.dart';
import 'package:bakerybrown/wholeSaler/dashboard_view/cartview.dart';
import 'package:bakerybrown/widgets/searchTextFiled.dart';
import 'package:bakerybrown/widgets/wholeSalerBreadCatalog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_services/api_config.dart';
import '../app_utils/text_widget.dart';

class Breadcatalog extends StatefulWidget {
  Breadcatalog({super.key});

  @override
  State<Breadcatalog> createState() => _BreadcatalogState();
}

class _BreadcatalogState extends State<Breadcatalog> {
  var searchController = TextEditingController();
  final ProductsController productsController = Get.put(ProductsController());
  bool isSelected = false;
  int selectedIndex = 0;

  @override
  void initState() {
    Future.microtask(() {
      productsController.getProductsWholesalerListApi(context: context,sort: "",search: "");
    },);
    super.initState();
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
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios,color: brownColor,)),
            Expanded(
              child: text("bread_catalog".tr,
                  isCentered: true,
                  textColor: brownColor,
                  fontSize: 20,
                  fontFamily: FontFamily.interBold,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cartview()));
            },
              child: Image.asset(AppImages.cartIcon, width: 30, height: 30)),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Search Bar
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
              onChanged: (v){
                productsController.getProductsWholesalerListApi(context: context,search: searchController.text,sort: "");
              },
            ),

            SizedBox(height: 20),

            // Filter Row
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //
            //       buildFilter("A-Z", 0),
            //       SizedBox(width: 10),
            //
            //       buildFilter("Low to High", 1),
            //       SizedBox(width: 10),
            //
            //       buildFilter("High to Low", 2),
            //       SizedBox(width: 10),
            //
            //       // Toggle Switch
            //       // Container(
            //       //   padding: EdgeInsets.symmetric(horizontal: 12),
            //       //   decoration: BoxDecoration(
            //       //     color: Color(0xFFE5E7EB),
            //       //     borderRadius: BorderRadius.circular(21),
            //       //   ),
            //       //   child: Row(
            //       //     children: [
            //       //       text("in_stock".tr,
            //       //           fontSize: 14,
            //       //           fontWeight: FontWeight.w500,
            //       //           textColor: blackColor),
            //       //
            //       //       SizedBox(width: 5),
            //       //
            //       //       Transform.scale(
            //       //         scale: 0.7,
            //       //         child: Switch(
            //       //           value: isSelected,
            //       //           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //       //           activeColor: darkBrownColor,
            //       //           activeTrackColor: darkBrownColor.withOpacity(0.4),
            //       //           onChanged: (value) {
            //       //             setState(() {
            //       //               isSelected = value;
            //       //             });
            //       //           },
            //       //         ),
            //       //       ),
            //       //     ],
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),

           // SizedBox(height: 20),

            Obx(() {
                return Expanded(
                  child: GridView.builder(
                    itemCount: productsController.productWholesalerList.value.data?.length??0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.57,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                    ),

                    itemBuilder: (_, index) {
                      var productData = productsController.productWholesalerList.value.data?[index];
                      print("Ram>>>$productData");
                      return WholeSalerBreadCatalog.itemCards(
                        productData?.name??"",
                        //productData?.stock.toString()??"",
                        context,
                            () {
                          setState(() {
                            productData!.count++;
                          });
                        },
                            () {
                          if (productData!.count > 0) {
                            setState(() {
                              productData.count--;
                            });
                          }
                        },

                            () {},
                        "${productData?.quantityPerUnit.toString()??""} ${productData?.unit.toString()??""}",
                        "$IP${productData?.img??""}",
                        "€${productData?.price.toString()??""}",
                        int.parse(productData?.count.toString()??""),
                          productData?.productId.toString(),// LIVE COUNT
                          productData?.sellerId.toString(),// LIVE COUNT
                      );
                    },
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  // Filter Button Builder
  Widget buildFilter(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        productsController.getProductsWholesalerListApi(context: context,search: "",
            sort:selectedIndex==0?"":selectedIndex==1?"":"");

      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selectedIndex == index ? darkBrownColor : Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(21),
        ),
        child: text(
          label,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          textColor: selectedIndex == index ? white : blackColor,
        ),
      ),
    );
  }
}