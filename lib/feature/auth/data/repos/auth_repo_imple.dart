import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:widget_space/core/errors/custom_expection.dart';
import 'package:widget_space/core/errors/failures.dart';
import 'package:widget_space/core/services/firebase_auth_service.dart';
import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImple({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User user;

    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(
        email: user.email!,
        name: name,
        uId: user.uid,
      );
      return right(userEntity);
    } on CustomExpection catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق. ',
        ),
      );
    }
  }
}
