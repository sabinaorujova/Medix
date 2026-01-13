import 'package:bloc/bloc.dart';

class DateSelectionCubit extends Cubit<int> {
  DateSelectionCubit() : super(0);

  void selectIndex(int index) => emit(index);
}