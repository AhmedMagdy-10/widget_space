import 'package:dartz/dartz.dart';
import 'package:widget_space/core/errors/failures.dart';

import '../entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failures, UserEntity>> signinWithGoogle();
  Future<Either<Failures, UserEntity>> signinWithFacebook();

  Future<Either<Failures, UserEntity>> signinWithApple();
}
