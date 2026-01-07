import 'package:bakerybrown/app_utils/app_colors.dart';
import 'package:bakerybrown/app_utils/app_images.dart';
import 'package:bakerybrown/app_utils/font_family.dart';
import 'package:bakerybrown/app_utils/text_widget.dart';
import 'package:bakerybrown/wholeSaler/retailersScreens/addRetailerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_utils/custom_textFiled.dart';
import '../../getx_controller/auth_controller.dart';
import '../../widgets/wholeSalerBreadCatalog.dart';

class RetailersScreen extends StatefulWidget {
  const RetailersScreen({super.key});

  @override
  State<RetailersScreen> createState() => _RetailersScreenState();
}

class _RetailersScreenState extends State<RetailersScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  int selectedIndex = 0;
  final AuthController authController = Get.put(AuthController());

  String getStatus() {
    if (selectedIndex == 1) return "active";
    if (selectedIndex == 2) return "inactive";
    if (selectedIndex == 3) return "pending";
    return "";
  }

  @override
  void initState() {
    Future.microtask(() {
      authController.page.value = 1;
      //authController.hasMore.value = true;
      authController.getRetailerListApi(
        context: context,
        status: "",
        search: "",
      );
    });
    super.initState();

    /// First API Call

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {

        if (!authController.isLoadingPage.value &&
            authController.hasMore.value &&
            authController.isFirstPageLoaded.value) {

          authController.getRetailerListApi(
            context: context,
            status: getStatus(),
            search: _searchController.text,
            isLoadMore: true,
          );
        }
      }
    });
    /// Pagination Listener
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        authController.getRetailerListApi(
        context: context,
          status: getStatus(),
          search: _searchController.text,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: Row(
          children: [
            // InkWell(
            //   onTap: () => Navigator.pop(context),
            //   child: Icon(Icons.arrow_back_ios, color: brownColor),
            // ),
            Expanded(
              child: text(
                "retailers".tr,
                isCentered: true,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.interBold,
                textColor: dark1BrownColor,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addretailerscreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 11),
              margin: const EdgeInsets.only(right: 21),
              decoration: BoxDecoration(
                color: dark1BrownColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add, color: white, size: 19),
                  const SizedBox(width: 5),
                  text(
                    "add_retailers".tr,
                    fontFamily: FontFamily.interRegular,
                    fontWeight: FontWeight.w500,
                    textColor: white,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            /// SEARCH
            CustomRoundTextField(
              controller: _searchController,
              hintText: "search_retailers".tr,
              borderColor: brownColor,
              fillColor: lightWhiteColor,
              onChanged: (v) {
                //authController.page.value = 1;
                //authController.hasMore.value = true;
                authController.getRetailerListApi(
                  context: context,
                  status: getStatus(),
                  isSearch: true,
                  search: v,
                );
              },
              // onTap: (){
              //   authController.page.value = 1;
              //   //authController.hasMore.value = true;
              //   authController.getRetailerListApi(
              //     context: context,
              //     status: getStatus(),
              //
              //     search: _searchController.text,
              //   );
              // },
            ),

            const SizedBox(height: 20),

            /// FILTER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFilter("all".tr, 0),
                buildFilter("active".tr, 1),
                buildFilter("inactive".tr, 2),
                buildFilter("pending".tr, 3),
              ],
            ),

            const SizedBox(height: 20),

            /// LIST + PAGINATION
            Expanded(
              child: Obx(() {
                final list =
                    authController.retailerListModel.value.data ?? [];
                if (list.isEmpty && !authController.isLoading.value) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.dataNotFoundIcon,height: 100,),
                        SizedBox(height: 20,),
                        text(
                          "Data Not Found",
                          textColor: brownColor,
                          fontSize: 18,
                          fontFamily: FontFamily.interBold,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: list.length + (authController.hasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {

                    // 🔹 Loader item
                    if (index == list.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final data = list[index];
                    final employeeList = data.employeeDetails ?? [];
                    final addressList = data.addresses??[];

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: employeeList.length,
                      itemBuilder: (context, itemIndex) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: addressList.length,
                          itemBuilder: (context, index) {
                          return RetailersDashBoard.retailersDetailsCard(
                            employeeList[itemIndex].shopName ?? "",
                                () {},
                            data.name ?? "",
                            data.phone?.toString() ?? "",
                            addressList[index].addressLine??"",
                            data.status ?? "",
                          );
                        },);
                      },
                    );
                  },
                );

              }),
            ),
          ],
        ),
      ),
    );
  }

  /// FILTER BUTTON
  Widget buildFilter(String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        authController.page.value = 1;
        authController.hasMore.value = true;

        authController.getRetailerListApi(
          context: context,
          status: getStatus(),
          search: _searchController.text,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? darkBrownColor : white,
          borderRadius: BorderRadius.circular(11),
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
