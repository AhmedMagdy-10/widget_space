import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:widget_space/core/helper/show_toast_state.dart';
import 'package:widget_space/core/services/get_it_service.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';
import 'package:widget_space/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:widget_space/feature/auth/presentation/manager/login_cubit/login_cubit_states.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/login_view_body.dart';
import 'package:widget_space/feature/home/Ui/views/main_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogInCubit>(
      create: (BuildContext context) => LogInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: BlocConsumer<LogInCubit, LogInCubitStates>(
          listener: (BuildContext context, LogInCubitStates state) {
            if (state is LogInSuccessState) {
              // Handle successful login, e.g., navigate to the home screen
              Navigator.pushReplacementNamed(context, MainView.routeName);
              showToast(
                text: ' تم تسجيل الدخول بنجاح',
                state: ToastStates.success,
              );
            } else if (state is LogInErrorState) {
              // Handle login error, e.g., show a snackbar with the error message
              showToast(text: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LogInLoadingState ? true : false,
              child: LoginViewBody(),
            );
          },
        ),
      ),
    );
  }
}
