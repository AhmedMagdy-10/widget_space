import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:widget_space/core/errors/custom_expection.dart';
import 'package:widget_space/core/errors/failures.dart';
import 'package:widget_space/core/services/database_service.dart';
import 'package:widget_space/core/services/firebase_auth_service.dart';
import 'package:widget_space/core/services/shared_preferences.dart';
import 'package:widget_space/core/utils/backend_end_points.dart';
import 'package:widget_space/feature/auth/data/models/user_model.dart';
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
      await addUserData(user: userEntity);
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
      await saveUserData(user: userEntity);

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

  @override
  Future<Either<Failures, UserEntity>> signinWithGoogle() async {
    User user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExists(
        path: 'users',
        docuementId: user.uid,
      );

      if (isUserExist) {
        var fetchedUser = await getUserData(uid: user.uid);
        await saveUserData(user: fetchedUser);
      } else {
        await addUserData(user: userEntity);
        await saveUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      log('Exception in AuthRepoImpl.signinWithGoogle: ${e.toString()}');
    }
    return left(
      ServerFailure(message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق. '),
    );
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithFacebook() async {
    User user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      log('Exception in AuthRepoImpl.signinWithFacebook: ${e.toString()}');
    }
    return left(
      ServerFailure(message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق. '),
    );
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithApple() {
    // TODO: implement signinWithApple
    throw UnimplementedError();
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUsersData,
      docuementId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString('userData', jsonData);
  }
}
