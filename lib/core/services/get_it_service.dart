import 'package:get_it/get_it.dart';
import 'package:widget_space/core/services/firebase_auth_service.dart';
import 'package:widget_space/feature/auth/data/repos/auth_repo_imple.dart';
import 'package:widget_space/feature/auth/domain/repo/auth_repo.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImple(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
}
