import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widget_space/core/helper/on_generate_function.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/feature/auth/presentation/view/login_view.dart';
import 'package:widget_space/feature/splash/Ui/splash_screen.dart';

import 'generated/l10n.dart';

void main() {
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE0E5EC),
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seconderyColor),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: onGenerateFunction,
      initialRoute: SplashView.routeName,
    );
  }
}
