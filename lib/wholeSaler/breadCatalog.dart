import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/font_family.dart';
import 'package:bakerybrown/getx_controller/product_controller.dart';
import 'package:bakerybrown/wholeSaler/dashboard_view/cartview.dart';
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
  final ProductsController productsController =
  Get.put(ProductsController());

  int? totalQty = 0;

  @override
  void initState() {
    Future.microtask(() {
      productsController.getProductsWholesalerListApi(
          context: context, sort: "", search: "");
    });
    super.initState();
  }

  // ✅ TOTAL CALCULATION METHOD
  void calculateTotalQty() {
    totalQty = productsController.productWholesalerList.value.data
        ?.fold<int>(0, (sum, item) => sum + (item.count ?? 0)) ??
        0;
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
                child: Icon(Icons.arrow_back_ios, color: brownColor)),
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cartview()));
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Image.asset(AppImages.cartIcon, width: 40, height: 40),
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: brownColor,
                    ),
                    child: text(
                      "${totalQty ?? 0}",
                      textColor: white,
                      isCentered: true,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      fontFamily: FontFamily.interBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// 🔍 SEARCH
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
              onChanged: (v) {
                productsController.getProductsWholesalerListApi(
                    context: context,
                    search: searchController.text,
                    sort: "");
              },
            ),

            SizedBox(height: 20),

            /// 🛒 PRODUCT GRID
            Obx(() {
              var productList =
                  productsController.productWholesalerList.value.data;

              return Expanded(
                child: GridView.builder(
                  itemCount: productList?.length ?? 0,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.64,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (_, index) {
                    var productData = productList![index];

                    return WholeSalerBreadCatalog.itemCards(
                      productData.name ?? "",
                      context,

                      /// ➕ ADD
                          () {
                        setState(() {
                          productData.count =
                              (productData.count ?? 0) + 1;
                          calculateTotalQty();
                        });
                      },

                      /// ➖ REMOVE
                          () {
                        if ((productData.count ?? 0) > 0) {
                          setState(() {
                            productData.count =
                                productData.count! - 1;
                            calculateTotalQty();
                          });
                        }
                      },

                          () {},

                      "${productData.quantityPerUnit ?? ""} ${productData.unit ?? ""}",
                      "$IP${productData.img ?? ""}",
                      "€${productData.price ?? ""}",
                      productData.count ?? 0,
                      productData.productId.toString(),
                      productData.sellerId.toString(),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
