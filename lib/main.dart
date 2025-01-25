
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wazzifni/features/user/auth/welcome/ui/welcome_screen.dart';
import 'core/constants/AppTheme.dart';
import 'core/constants/Keys.dart';
import 'core/constants/app_settings.dart';
import 'features/company/add_job/ui/add_job_screen.dart';
import 'features/company/company_home/ui/company_root_screen.dart';
import 'features/company/user_apply/ui/user_apply_screen.dart';
import 'features/user/filter/ui/filter_screen.dart';
import 'features/user/home/ui/root_screen.dart';
import 'features/user/search/ui/search_screen.dart';


void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // DartPluginRegistrant.ensureInitialized();

  // await Permission.notification.isDenied.then((value) {
  //   if (value) {
  //     Permission.notification.request();
  //   }
  // });

  runApp(
    Phoenix(
      child: EasyLocalization(
        startLocale: LANGUAGES['ar'],
        supportedLocales: LANGUAGES.values.toList(),
        path: "assets/lang",
        child: const Responsive(),
      ),
    ),
  );
}

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(100, 100),
      builder: (context,child) => const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      scrollBehavior: MyCustomScrollBehavior(),
      navigatorKey: Keys.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Wazzifni',
      theme: AppTheme.theme,
      home: const WelcomeScreen(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
