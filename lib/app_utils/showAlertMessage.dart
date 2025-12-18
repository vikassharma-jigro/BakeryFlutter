import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_strings.dart';


class ShowAlertDialog {



  showErrorAlert(context, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.white,
                dialogTheme: DialogThemeData(backgroundColor: Colors.white)),
            child: CupertinoAlertDialog(
              title: const Text(
                AppStrings.appTitle,style: TextStyle(color: brownColor,fontWeight: FontWeight.bold),
              ),
              content: Text(
                "\n" + message + "\n",

              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [brownColor,brownColor],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        borderRadius: BorderRadius.circular(5),color: brownColor
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Close",style: TextStyle(color:white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            )));
  }


  showErrorAlertLogin(context, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.white,
                dialogTheme: DialogThemeData(backgroundColor: Colors.white)),
            child: CupertinoAlertDialog(
              title: const Text(
                AppStrings.appTitle,style: TextStyle(color: brownColor,fontWeight: FontWeight.bold),
              ),
              content: Text(
                "\n" + message + "\n",

              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),color: blackColor
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Ok",style: TextStyle(color:white,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ],
            )));
  }

}
