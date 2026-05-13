import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';

abstract class SignUpCubitStates {}

final class SignUpInitialState extends SignUpCubitStates {}

final class SignUpLoadingState extends SignUpCubitStates {}

final class SignUpErrorState extends SignUpCubitStates {
  final String message;

  SignUpErrorState({required this.message});
}

final class SignUpSuccessState extends SignUpCubitStates {
  final UserEntity userEntity;

  SignUpSuccessState({required this.userEntity});
}
