import 'package:flutter/foundation.dart';

/// Base ViewModel class for MVVM architecture.
/// 
/// Provides common state management functionality including:
/// - State management
/// - Loading state
/// - Error handling
/// 
/// Type parameter [T] represents the state type.
abstract class BaseViewModel<T> extends ChangeNotifier {
  T _state;
  bool _isLoading = false;
  String? _errorMessage;

  /// Creates a new [BaseViewModel] instance.
  /// 
  /// [initialState] - The initial state value.
  BaseViewModel(this._state);

  /// Gets the current state.
  T get state => _state;

  /// Indicates whether the ViewModel is currently loading.
  bool get isLoading => _isLoading;

  /// Gets the current error message, if any.
  String? get errorMessage => _errorMessage;

  /// Indicates whether there is an error.
  bool get hasError => _errorMessage != null;

  /// Updates the state and notifies listeners.
  /// 
  /// [newState] - The new state value.
  void setState(T newState) {
    _state = newState;
    notifyListeners();
  }

  /// Updates the loading state and notifies listeners.
  /// 
  /// [loading] - The new loading state.
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Sets an error message and notifies listeners.
  /// 
  /// [error] - The error message. Can be null to clear the error.
  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  /// Clears the error message and notifies listeners.
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}