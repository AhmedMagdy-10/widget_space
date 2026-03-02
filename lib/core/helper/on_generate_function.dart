import 'package:flutter/material.dart';
import 'package:widget_space/feature/auth/presentation/view/sign_in_view.dart';
import 'package:widget_space/feature/splash/Ui/splash_screen.dart';

Route<dynamic>? onGenerateFunction(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    // Add more routes here as needed

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    // case SignUpView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SignUpView());
    default:
      return null;
  }
}
