import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kerja_mudah/core/languages/l10n.dart';
import 'package:kerja_mudah/core/routes/routes.dart';
import 'package:kerja_mudah/features/onboard/presentation/pages/onboard_screen.dart';
import 'package:kerja_mudah/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale = Locale('en');

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          navigatorKey: Get.key,
          title: 'Kerja Mudah',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          locale: locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // home: OnBoardScreen(),
          getPages: AppRoutes.pages,
          initialRoute: AppRoutesName.ONBOARD,
        );
      },
    );
  }
}
