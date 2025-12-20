import 'package:bakerybrown/cart_view/checkout_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_services/api_config.dart';
import '../app_utils/app_colors.dart';
import '../app_utils/app_images.dart';
import '../app_utils/font_family.dart';
import '../app_utils/text_widget.dart';
import '../getx_controller/product_controller.dart';





class CartScreen extends StatefulWidget {
  final String? totalQty;
  const CartScreen({super.key,this.totalQty});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {
  TextEditingController searchController = TextEditingController();
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    Future.microtask(() {
      productsController.getCartItemUrl(context: context);
    },);
    super.initState();
  }
  bool isUpdating = false;
  List<int> qty = [];


  int? totalQty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softIvoryColor,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child:  Icon(Icons.arrow_back_ios,color: blackColor,),
            ),
            Expanded(
              child: text("cart_items".tr,
                  textColor: brownColor,
                  isCentered: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: FontFamily.interBold
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                text("${productsController.cartItemList.value.data?.totalItems??"0"} item",
                    textColor: brownColor,
                    isCentered: true,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: FontFamily.interBold
                ),
                InkWell(
                  onTap: (){
                    Get.to(CheckoutScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: brownColor
                    ),
                    child: text("review_order".tr,
                        textColor: softIvoryColor,
                        isCentered: true,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: FontFamily.interBold
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged:(i){
                  // _filterList(i);
                },
                // filterSearch,
                // });

                onSubmitted: (v) {
                  //_filterList(v);
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: brownColor),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: brownColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: brownColor),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  // Other decoration properties...


                  filled: true,

                  // search Icon ------------------
                  prefixIcon: GestureDetector(
                    onTap: () {
                      // filterSearch(searchController.text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 0, bottom: 5, top: 5),
                      child: const Icon(Icons.search, color: brownColor),
                    ),
                  ),
                  fillColor: softIvoryColor,
                  hintText: "Search Products..",
                  hintStyle: const TextStyle(fontSize: 16.0, color: brownColor, fontFamily: FontFamily.interRegular),
                  contentPadding: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 0),
                ),
              ),

              SizedBox(height: 15,),
            Obx(()  {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: productsController.cartItemList.value.data?.items?.length??0,
                    itemBuilder: (context, index) {
                      totalQty = qty.fold(0, (sum, item) => sum! + item);
                      var cartData = productsController.cartItemList.value.data?.items?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: white
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
                                        imageUrl: "$IP${cartData?.img??""}",width: 100,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      )),
                                  SizedBox(width: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      text(cartData?.name??"",
                                          textColor: blackColor,fontWeight: FontWeight.w600,
                                          fontSize: 14,fontFamily: FontFamily.interBold
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          text("€${cartData?.price??""}",
                                              textColor: brownColor,fontWeight: FontWeight.w600,
                                              fontSize: 16,fontFamily: FontFamily.interBold
                                          ),


                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          // MINUS BTN
                                          GestureDetector(
                                            onTap: () {
                                              if (cartData == null) return;
                                              if ((cartData.quantity ?? 0) <= 0) return; // ❌ negative na ho

                                              int oldQty = cartData.quantity ?? 0;

                                              setState(() {
                                                cartData.quantity = oldQty - 1;
                                              });

                                              int newQty = cartData.quantity!;
                                              int quantityChange = newQty - oldQty; // ✅ -1, -2 jitna minus hua

                                              productsController.getCartItemUpdateApi(
                                                context: context,
                                                productId: cartData.cartItemId,
                                                quantity: quantityChange, // ✅ negative value jayegi
                                              );
                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(40),
                                                    color: darkBrownColor
                                                ),
                                                child: Icon(Icons.remove, size: 20,color: white,)),
                                          ),

                                          SizedBox(width: 30,),

                                          // QUANTITY TEXT
                                          text(
                                              cartData?.quantity.toString()??"",
                                              textColor: darkBrownColor,
                                              fontSize: 15,fontFamily: FontFamily.interBold,
                                              fontWeight: FontWeight.w600
                                          ),
                                          SizedBox(width: 30,),
                                          // ADD BTN
                                          GestureDetector(
                                            onTap: () {
                                              if (cartData == null) return;

                                              int oldQty = cartData.quantity ?? 0;

                                              setState(() {
                                                cartData.quantity = oldQty + 1;
                                              });

                                              int newQty = cartData.quantity!;
                                              int quantityChange = newQty - oldQty; // ✅ dynamic change

                                              productsController.getCartItemUpdateApi(
                                                context: context,
                                                productId: cartData.cartItemId,
                                                quantity: quantityChange, // ✅ 1, 2, 3 jitna add hua
                                              );
                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(40),
                                                    color: darkBrownColor
                                                ),
                                                child: Icon(Icons.add, size: 20,color: white,)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
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

