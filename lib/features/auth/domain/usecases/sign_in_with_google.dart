import 'package:dartz/dartz.dart';
import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/auth/domain/repositories/auth_repository.dart';
import 'package:cineverse/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<Either<Failure, User>> call() async {
    return await repository.signInWithGoogle();
  }
}
