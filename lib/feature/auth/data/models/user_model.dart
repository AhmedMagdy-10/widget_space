import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:widget_space/feature/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.formFirebase(User user) {
    return UserModel(
      name:
          user.userMetadata!['name'] ??
          'No Name', // تأكد من وجود الاسم في userMetadata
      email: user.email!,
      uId: user.id,
    );
  }
}
