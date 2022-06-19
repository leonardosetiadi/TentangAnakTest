import 'package:flutter/foundation.dart';

/// Loading helper for stores
mixin SingleLoadingStoreMixin on ChangeNotifier {
  /// Loading state
  bool _isLoading = false;

  /// Loading getter
  bool get isLoading => _isLoading;

  /// Set loading state to true
  void $showLoading() {
    if (!_isLoading) {
      _isLoading = true;
      notifyListeners();
    }
  }

  /// Set loading state to true
  void $hideLoading() {
    if (_isLoading) {
      _isLoading = false;
      notifyListeners();
    }
  }
}

mixin KeyedLoadingStoreMixin<T> on ChangeNotifier {
  final Map<T, bool> _states = <T, bool>{};

  void $initialiseLoadingState(Set<T> keys) {
    _states.addEntries(keys.map((T key) => MapEntry<T, bool>(key, false)));
  }

  void $showLoading(T? key) {
    if (key == null) {
      return;
    }

    _states[key] = true;
    notifyListeners();
  }

  void $hideLoading(T? key) {
    if (key == null) {
      return;
    }

    _states[key] = false;
    notifyListeners();
  }

  bool $getLoading(T? key) {
    if (key == null) {
      return false;
    }

    return _states[key] ?? false;
  }

  bool get $anyLoading {
    return _states.values.any((bool loading) => loading);
  }
}

mixin SingleErrorMessageMixin on ChangeNotifier {
  /// Saves error message that comes from validation and service
  String? _errorMessage;

  /// Error message getter
  String? get errorMessage => _errorMessage;

  /// Setting error message to state
  void $setErrorMessage(String? errorMessage) {
    if (_errorMessage != errorMessage) {
      _errorMessage = errorMessage;
      notifyListeners();
    }
  }

  /// Remove error message
  void $clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
