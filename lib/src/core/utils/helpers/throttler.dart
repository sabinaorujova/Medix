import 'dart:async';
import 'package:nutri_plate/src/core/utils/constants/app_durations.dart';

class Throttler {
  final Duration delay;
  Timer? _timer;
  bool _isThrottled = false;

  Throttler({Duration? delay}) : delay = delay ?? AppDurations.throttle;

  void call(void Function() callback) {
    if (_isThrottled) return;

    _isThrottled = true;
    callback();

    _timer?.cancel();
    _timer = Timer(delay, () {
      _isThrottled = false;
    });
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
    _isThrottled = false;
  }
}
