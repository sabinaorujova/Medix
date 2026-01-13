class AppDurations {
  AppDurations._();

  static const Duration short = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration long = Duration(milliseconds: 600);
  
  static const Duration snackBar = Duration(seconds: 3);
  static const Duration toast = Duration(seconds: 2);
  
  static const Duration debounce = Duration(milliseconds: 300);
  static const Duration throttle = Duration(milliseconds: 500);
  
  static const Duration splashDelay = Duration(seconds: 2);
  static const Duration animation = Duration(milliseconds: 300);
}
