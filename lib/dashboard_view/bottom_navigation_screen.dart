import 'package:bakerybrown/dashboard_view/profile_screen.dart';
import 'package:bakerybrown/dashboard_view/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/font_family.dart';

import '../app_utils/app_images.dart';
import '../cart_view/order_list_screen.dart';
import 'accounts_screen.dart';
import 'home_screen.dart';




class DashboardScreen extends StatefulWidget {
  String? id;
  bool? isFromHome;
  int?index;
  DashboardScreen({Key? key, this.id, this.isFromHome = false,this.index})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _selectedIndex;
  final PageController _pageController = PageController();
  bool back_dialog = false;

  @override
  void initState() {
    _selectedIndex = widget.index??0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: white,
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const <Widget>[
                HomeScreen(),
                OrderListScreen(),
                //ReportScreen(),
                AccountsScreen(),
                ProfileScreen(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  Widget cancelButton(context) {
    return TextButton(
      child: const Text("NO"),
      onPressed: () {
        setState(() {
          back_dialog = false;
        });
      },
    );
  }

  Widget continueButton(context) {
    return TextButton(
      child: const Text("YES"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );
  }

  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          title: const Align(
              alignment: Alignment.center,
              child: Text('Do you want to quit app?',style: TextStyle(color: darkBrownColor,fontSize: 18,fontFamily: FontFamily.interRegular),)),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width/3,
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: darkBrownColor)
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Yes',style: TextStyle(color: darkBrownColor,fontSize: 18,fontFamily: FontFamily.interRegular),))),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width/3,
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),color: darkBrownColor,
                          border: Border.all(color: darkBrownColor)
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('No',style: TextStyle(color: white,fontSize: 18,fontFamily: FontFamily.interRegular),))),
                ),
              ],
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }

  _buildBottomNavigation(isMember) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation Bar
        BottomNavigationBar(
          backgroundColor: white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: darkBrownColor,
          unselectedItemColor: brownColor,
          selectedFontSize: 20,
          unselectedFontSize: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: blackColor),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: darkBrownColor,
            overflow: TextOverflow.visible,
          ),
          onTap: (index) {
            _onTappedBar(index);
          },
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: _selectedIndex==0?dark1BrownColor:textBrownColor,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.orderIcon,height: 20,color: _selectedIndex==1?dark1BrownColor:textBrownColor,),
              label: 'Order',
            ),
            // BottomNavigationBarItem(
            //   icon: Image.asset(AppImages.reportIcon,height: 20,color: _selectedIndex==2?dark1BrownColor:textBrownColor,),
            //   label: 'Report',
            // ),

            BottomNavigationBarItem(
              icon: Image.asset(AppImages.paymentIcon,height: 20,color: _selectedIndex==3?dark1BrownColor:textBrownColor,),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: _selectedIndex==4?dark1BrownColor:textBrownColor,),
              label: 'Profile',
            ),
          ],
        ),

        // 🔥 Center Circular Image Button
        // Positioned(
        //   bottom: 25, // bar ke upar thoda sa
        //   left: 0,
        //   right: 0,
        //   child: GestureDetector(
        //     onTap: () {
        //       _onTappedBar(2); // center index par switch karega
        //     },
        //     child: Container(
        //       height: 65,
        //       width: 65,
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         border: Border.all(color: white, width: 4),
        //         gradient: const LinearGradient(
        //           colors: [purpleGradientColor, pinkColor],
        //           begin: Alignment.topLeft,
        //           end: Alignment.bottomRight,
        //         ),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black12,
        //             blurRadius: 6,
        //             offset: Offset(0, 3),
        //           ),
        //         ],
        //       ),
        //       child: ClipOval(
        //         child: Icon(Icons.qr_code,size: 30,color: white,)
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void _onTappedBar(int value) {
    FocusScope.of(context).unfocus();
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }



}
