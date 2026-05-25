import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

/// Lightweight session flag for routing until [AuthBloc] is wired in the auth feature.
///
/// Router [redirect] listens to this notifier. Auth feature will sync bloc state here.
@lazySingleton
class AuthSession extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void setAuthenticated({required bool value}) {
    if (_isAuthenticated == value) {
      return;
    }
    _isAuthenticated = value;
    notifyListeners();
  }

  void markLoggedIn() => setAuthenticated(value: true);

  void markLoggedOut() => setAuthenticated(value: false);
}
