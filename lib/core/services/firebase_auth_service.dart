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
}
