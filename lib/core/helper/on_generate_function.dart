import 'package:flutter/material.dart';
import 'package:widget_space/feature/auth/presentation/view/login_view.dart';
import 'package:widget_space/feature/auth/presentation/view/sign_up_view.dart';
import 'package:widget_space/feature/home/Ui/views/home_view.dart';
import 'package:widget_space/feature/home/Ui/views/main_view.dart';
import 'package:widget_space/feature/splash/Ui/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
