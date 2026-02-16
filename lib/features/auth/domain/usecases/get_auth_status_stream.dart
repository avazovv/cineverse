import 'package:cineverse/features/auth/domain/entities/user.dart';
import 'package:cineverse/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAuthStatusStream {
  final AuthRepository repository;

  GetAuthStatusStream(this.repository);

  Stream<User?> call() {
    return repository.authStateChanges;
  }
}
