import 'dart:async';

import 'package:cineverse/core/errors/failures.dart';
import 'package:cineverse/features/auth/domain/entities/user.dart';
import 'package:cineverse/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final StreamController<User?> _controller =
      StreamController<User?>.broadcast();
  static const String _keyIsLoggedIn = 'is_logged_in';

  AuthRepositoryImpl() {
    _init();
  }

  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(_keyIsLoggedIn) ?? false;
    if (isLoggedIn) {
      _controller.add(
        const User(
          id: 'mock_id',
          email: 'test@example.com',
          displayName: 'Test User',
          photoUrl: null,
        ),
      );
    } else {
      _controller.add(null);
    }
  }

  @override
  Stream<User?> get authStateChanges => _controller.stream;

  @override
  Future<Either<Failure, bool>> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return Right(prefs.getBool(_keyIsLoggedIn) ?? false);
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyIsLoggedIn, true);

      final user = const User(
        id: 'mock_id',
        email: 'test@example.com',
        displayName: 'Test User',
        photoUrl: null,
      );

      _controller.add(user);
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_keyIsLoggedIn, false);
      _controller.add(null);
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
