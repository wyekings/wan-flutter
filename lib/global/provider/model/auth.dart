import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _authed;

  AuthProvider({required bool authed}) : _authed = authed;

  bool get authed => _authed;

  void login() => _updateAuthState(true);

  void logout() => _updateAuthState(false);

  void _updateAuthState(bool authed) {
    _authed = authed;
    notifyListeners();
  }
}
