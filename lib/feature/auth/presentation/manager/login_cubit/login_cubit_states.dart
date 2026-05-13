import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';

abstract class LogInCubitStates {}

final class LogInInitialState extends LogInCubitStates {}

final class LogInLoadingState extends LogInCubitStates {}

final class LogInErrorState extends LogInCubitStates {
  final String message;

  LogInErrorState({required this.message});
}

final class LogInSuccessState extends LogInCubitStates {
  final UserEntity userEntity;

  LogInSuccessState({required this.userEntity});
}
