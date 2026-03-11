import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';
import 'package:widget_space/feature/auth/presentation/manager/login_cubit/login_cubit_states.dart';

class LogInCubit extends Cubit<LogInCubitStates> {
  LogInCubit(this.authRepo) : super(LogInInitialState());
  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LogInLoadingState());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LogInErrorState(message: failure.message)),
      (userEntity) => emit(LogInSuccessState(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LogInLoadingState());
    var result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(LogInErrorState(message: failure.message)),
      (userEntity) => emit(LogInSuccessState(userEntity: userEntity)),
    );
  }
}
