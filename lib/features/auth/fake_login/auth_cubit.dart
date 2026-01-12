import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String role;
  AuthAuthenticated(this.role);
}

class AuthUnauthenticated extends AuthState {}

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final SharedPreferences _prefs;

  AuthCubit(this._prefs) : super(AuthInitial());

  Future<void> checkAuth() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 1));

    final savedRole = _prefs.getString('user_role');

    if (savedRole != null) {
      emit(AuthAuthenticated(savedRole));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void devSetRole(String newRole) async {
    await _prefs.setString('user_role', newRole);
    emit(AuthAuthenticated(newRole));
  }

  void logout() async {
    await _prefs.remove('user_role');
    emit(AuthUnauthenticated());
  }
}
