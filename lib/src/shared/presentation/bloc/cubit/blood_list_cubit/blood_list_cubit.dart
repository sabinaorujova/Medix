import 'package:bloc/bloc.dart';
import 'package:nutri_plate/src/features/patient/data/services/blood_list_service.dart';
import '../../../../../core/helper/extensions/service_locator.dart';
import 'blood_list_state.dart';

class BloodListCubit extends Cubit<BloodState> {


  BloodListCubit() : super(BloodInitial());
  late final BloodService bloodService = getIt.get<BloodService>();
  Future<void> fetchBloodList() async {
    try {
      emit(BloodLoading());
      final bloodList = await bloodService.getBloodList();
      emit(BloodLoaded(bloodList));
    } catch (e) {
      emit(BloodError(e.toString()));
    }
  }
}