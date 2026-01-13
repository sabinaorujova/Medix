import 'dart:async';

class DateSelectionService {
  final _selectedIndexController = StreamController<int>.broadcast();


  Stream<int> get selectedIndexStream => _selectedIndexController.stream;


  void selectIndex(int index) {
    _selectedIndexController.add(index);
  }

  void dispose() {
    _selectedIndexController.close();
  }
}
