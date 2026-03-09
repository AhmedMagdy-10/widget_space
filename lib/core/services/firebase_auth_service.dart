import 'package:firebase_auth/firebase_auth.dart';
import 'package:widget_space/core/errors/custom_expection.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String password,
    required String email,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExpection(
          message: 'كلمة المرور ضعيفة، يرجى اختيار كلمة مرور أقوى.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomExpection(message: 'البريد الإلكتروني مسجل مسبقاً.');
      } else {
        throw CustomExpection(
          message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق.',
        );
      }
    } catch (e) {
      throw CustomExpection(
        message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomExpection(
          message: 'لا يوجد مستخدم بهذا البريد الإلكتروني.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomExpection(message: 'كلمة المرور غير صحيحة.');
      } else {
        throw CustomExpection(
          message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق.',
        );
      }
    } catch (e) {
      throw CustomExpection(
        message: 'حصل خطأ غير متوقع، يرجى المحاولة في وقت لاحق.',
      );
    }
  }
}
