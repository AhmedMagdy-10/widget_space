import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/core/services/get_it_service.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';
import 'package:widget_space/feature/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, 'حساب جديد'),
        body: SignUpViewBody(),
      ),
    );
  }
}
