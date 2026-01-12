import 'package:flutter/material.dart';

enum UserRole { driver, manager, recipient }

class AuthProvider extends ChangeNotifier {
  UserRole? _role;
  bool _isLoading = true;

  UserRole? get role => _role;
  bool get isLoading => _isLoading;

  AuthProvider() {
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));

    _role = UserRole.driver;
    _isLoading = false;
    notifyListeners();
  }

  void login(UserRole selectedRole) {
    _role = selectedRole;
    notifyListeners();
  }

  void logout() {
    _role = null;
    notifyListeners();
  }
}
