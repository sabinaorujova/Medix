import 'dart:async';
import 'package:nutri_plate/src/core/utils/constants/app_durations.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({Duration? delay}) : delay = delay ?? AppDurations.debounce;

  void call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
