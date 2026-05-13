import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';
import 'package:widget_space/feature/auth/presentation/manager/signup_cubit/sign_up_cubit_states.dart';

class SignUpCubit extends Cubit<SignUpCubitStates> {
  SignUpCubit(this.authRepo) : super(SignUpInitialState());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignUpLoadingState());

    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(SignUpErrorState(message: failure.message)),
      (userEntity) => emit(SignUpSuccessState(userEntity: userEntity)),
    );
  }
}
