import 'package:dartz/dartz.dart';
import 'package:widget_space/core/errors/failures.dart';
import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImple extends AuthRepo {
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
}
