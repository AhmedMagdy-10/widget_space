import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:widget_space/core/helper/show_toast_state.dart';
import 'package:widget_space/feature/auth/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:widget_space/feature/auth/presentation/manager/signup_cubit/sign_up_cubit_states.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpCubitStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(text: 'تم إنشاء الحساب بنجاح!', state: ToastStates.success);
          Navigator.pop(context);
        } else if (state is SignUpErrorState) {
          showToast(text: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          opacity: 0.2,
          inAsyncCall: state is SignUpLoadingState ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
