import 'package:bakerybrown/delivery_Dashboard_view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../app_utils/app_colors.dart';
import '../../app_utils/app_images.dart';
import '../../app_utils/font_family.dart';
import 'bulk_order_screen.dart';
import 'home_screen.dart';
import 'notification_screen.dart';




class DeliveryDashboardScreen extends StatefulWidget {
  String? id;
  bool? isFromHome;
  int?index;
  DeliveryDashboardScreen({Key? key, this.id, this.isFromHome = false,this.index})
      : super(key: key);

  @override
  State<DeliveryDashboardScreen> createState() => _DeliveryDashboardScreenState();
}

class _DeliveryDashboardScreenState extends State<DeliveryDashboardScreen> {
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
                BulkOrderScreen(),
                NotificationScreen(),
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
          unselectedItemColor: lightGrey,
          selectedFontSize: 20,
          unselectedFontSize: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: FontFamily.poppinsRegular,
              color: blackColor),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: FontFamily.poppinsRegular,
            color: darkBrownColor,
            overflow: TextOverflow.visible,
          ),
          onTap: (index) {
            _onTappedBar(index);
          },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.dHomeIcon,height: 20,color: _selectedIndex==0?dark1BrownColor:lightGrey,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.bulkIcon,height: 20,color: _selectedIndex==1?dark1BrownColor:lightGrey,),
              label: 'Bulk Order',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.dNotificationIcon,height: 20,color: _selectedIndex==2?dark1BrownColor:lightGrey,),
              label: 'Notification',
            ),

            BottomNavigationBarItem(
              icon: Image.asset(AppImages.dProfileIcon,height: 20,color: _selectedIndex==3?dark1BrownColor:lightGrey,),
              label: 'Account',
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
