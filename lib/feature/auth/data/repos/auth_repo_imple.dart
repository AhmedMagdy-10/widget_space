import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:widget_space/core/errors/custom_expection.dart';
import 'package:widget_space/core/errors/failures.dart';
import 'package:widget_space/core/services/database_service.dart';
import 'package:widget_space/core/services/firebase_auth_service.dart';
import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImple({
    required this.firebaseAuthService,
    required this.databaseService,
  });

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

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = UserEntity(
        email: user.email!,
        name: user.displayName ?? '',
        uId: user.uid,
      );

      return right(userEntity);
    } on CustomExpection catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(
          message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق. ',
        ),
      );
    }
  }

  // Future addUserData({required UserEntity user}) async {
  //   await databaseService.addData(
  //     path: BackendEndpoint.addUserData,
  //     data: UserModel.fromEntity(user).toMap(),
  //     documentId: user.uId,
  //   );
  // }

  // Future<UserEntity> getUserData({required String uid}) async {
  //   var userData = await databaseService.getData(
  //     path: BackendEndpoint.getUsersData,
  //     docuementId: uid,
  //   );
  //   return UserModel.fromJson(userData);
  // }

  // Future saveUserData({required UserEntity user}) async {
  //   var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
  //   // await Prefs.setString(kUserData, jsonData);
  // }
}
