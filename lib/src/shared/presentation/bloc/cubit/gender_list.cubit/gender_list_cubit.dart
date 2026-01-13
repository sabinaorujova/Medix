import 'package:bloc/bloc.dart';
import '../../../../../core/helper/extensions/service_locator.dart';
import '../../../../../features/patient/data/services/gender_service.dart';
import 'gender_list_state.dart';

class GenderCubit extends Cubit<GenderState> {


  GenderCubit() : super(GenderInitial());
  late final GenderService genderService = getIt.get<GenderService>();
  Future<void> fetchGenderList() async {
    try {
      emit(GenderLoading());
      final genderList = await genderService.getGenderList();
      emit(GenderLoaded(genderList));
    } catch (e) {
      emit(GenderError(e.toString()));
    }
  }
}