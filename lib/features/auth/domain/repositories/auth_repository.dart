import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
  Stream<User?> get authStateChanges;
  Future<Either<Failure, bool>> isSignedIn();
}
