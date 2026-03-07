import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';
import 'package:widget_space/feature/auth/presentation/manager/login_cubit/login_cubit_states.dart';

class LogInCubit extends Cubit<LogInCubitStates> {
  LogInCubit(this.authRepo) : super(LogInInitialState());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(LogInLoadingState());

    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    result.fold(
      (failure) => emit(LogInErrorState(message: failure.message)),
      (userEntity) => emit(LogInSuccessState(userEntity: userEntity)),
    );
  }
}
