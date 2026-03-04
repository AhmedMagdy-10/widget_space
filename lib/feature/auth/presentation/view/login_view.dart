import 'package:flutter/material.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginViewBody());
  }
}
