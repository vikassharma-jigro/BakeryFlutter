import 'package:bakerybrown/spleash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_utils/app_colors.dart';
import 'app_utils/app_translations.dart';
import 'app_utils/shared_preferences.dart';

SpUtil? sp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTranslations.init();
  // Transparent status bar with light icons
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ));
  sp = await SpUtil.getInstance();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(350, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(),

          locale: const Locale('en'), // ❗ Always use Get.deviceLocale OR stored locale
          fallbackLocale: const Locale('en'),

          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
            Locale('it'),
          ],
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: white),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          home: child // 👈 Gradient + SplashScreen
        );
      },
      child: const FirstSplash(),
    );

  }
}


