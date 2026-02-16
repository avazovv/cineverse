import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.signOut();
  }
}
