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
    super.initState();

    /// FIRST API CALL
    Future.microtask(() {
      authController.page.value = 1;
      authController.hasMore.value = true;
      authController.getRetailerListApi(
        context: context,
        status: "",
        search: "",
      );
    });

    /// PAGINATION LISTENER (ONLY ONE)
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {

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
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,color: blackColor,)),
              text(
                "retailers".tr,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.interBold,
                textColor: dark1BrownColor,
              ),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Addretailerscreen()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: dark1BrownColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add, color: white, size: 18),
                  const SizedBox(width: 6),
                  text(
                    "add_retailers".tr,
                    textColor: white,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// SEARCH
            CustomRoundTextField(
              fillColor: white,
              borderRadius: 10,
              controller: _searchController,
              hintText: "search_retailers".tr,
              onChanged: (v) {
                authController.getRetailerListApi(
                  context: context,
                  status: getStatus(),
                  search: v,
                  isSearch: true,
                );
              },
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

                /// FIRST PAGE EMPTY
                if (list.isEmpty &&
                    !authController.isLoading.value &&
                    authController.page.value == 1) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.dataNotFoundIcon, height: 100),
                        const SizedBox(height: 20),
                        text(
                          "Data Not Found",
                          fontSize: 18,
                          textColor: brownColor,
                          fontFamily: FontFamily.interBold,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  itemCount:
                  list.length + (authController.hasMore.value ? 1 : 0),
                  itemBuilder: (context, index) {

                    /// FOOTER
                    if (index == list.length) {

                      if (authController.isLoadingPage.value) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      if (!authController.hasMore.value &&
                          authController.page.value > 1) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Center(
                            child: text(
                              "Page not available",
                              fontSize: 14,
                              textColor: brownColor,
                            ),
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    }

                    final data = list[index];
                    final employeeList = data.employeeDetails ?? [];
                    final addressList = data.addresses ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: employeeList.length,
                      itemBuilder: (context, empIndex) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: addressList.length,
                          itemBuilder: (context, addIndex) {
                            return RetailersDashBoard
                                .retailersDetailsCard(
                              employeeList[empIndex].shopName ?? "",
                                  () {},
                              data.name ?? "",
                              data.phone.toString() ?? "",
                              addressList[addIndex].addressLine ?? "",
                              data.status ?? "",
                            );
                          },
                        );
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
        setState(() => selectedIndex = index);

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
          textColor: isSelected ? white : blackColor,
        ),
      ),
    );
  }
}
