import 'dart:async';
import 'package:cineverse/features/auth/domain/entities/user.dart';
import 'package:cineverse/features/auth/domain/usecases/get_auth_status_stream.dart';
import 'package:cineverse/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:cineverse/features/auth/domain/usecases/sign_out.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogle _signInWithGoogle;
  final SignOut _signOut;
  final GetAuthStatusStream _getAuthStatusStream;
  StreamSubscription<User?>? _authSubscription;

  AuthBloc(this._signInWithGoogle, this._signOut, this._getAuthStatusStream)
    : super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignOutEvent>(_onSignOut);
    on<AuthUserChanged>(_onAuthUserChanged);

    _authSubscription = _getAuthStatusStream().listen(
      (user) => add(AuthUserChanged(user)),
    );
  }

  void _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) {
    emit(AuthLoading());
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signInWithGoogle();
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(Authenticated(user)),
    );
  }

  Future<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    await _signOut();
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(Authenticated(event.user!));
    } else {
      emit(Unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
