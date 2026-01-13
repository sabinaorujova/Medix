/// Application string constants.
/// 
/// Contains all error messages, success messages, and common UI strings.
/// This helps with consistency and makes it easier to update messages.
class AppStrings {
  AppStrings._();

  static const String appName = 'Medix';
  
  static const String errorGeneric = 'An error occurred';
  static const String errorNetwork = 'Network connection error';
  static const String errorServer = 'Server error occurred';
  static const String errorAuthentication = 'Authentication failed';
  static const String errorValidation = 'Validation failed';
  static const String errorNotFound = 'Resource not found';
  
  static const String successLogin = 'Login successful';
  static const String successRegister = 'Registration successful';
  static const String successSave = 'Saved successfully';
  static const String successDelete = 'Deleted successfully';
  
  static const String loading = 'Loading...';
  static const String pleaseWait = 'Please wait...';
  
  static const String emptyEmail = 'Email cannot be empty';
  static const String invalidEmail = 'Invalid email format';
  static const String emptyPassword = 'Password cannot be empty';
  static const String invalidPassword = 'Password must be at least 6 characters';
  static const String passwordMismatch = 'Passwords do not match';
  
  static const String retry = 'Retry';
  static const String cancel = 'Cancel';
  static const String ok = 'OK';
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String confirm = 'Confirm';
  static const String delete = 'Delete';
  static const String save = 'Save';
  static const String edit = 'Edit';
  static const String close = 'Close';
}
