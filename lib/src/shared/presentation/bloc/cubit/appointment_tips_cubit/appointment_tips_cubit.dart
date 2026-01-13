import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../features/appointment/data/models/appointment_tips_model.dart';
import '../../../../../core/helper/extensions/service_locator.dart';
import '../../../../../features/appointment/data/services/appointment_tips_service.dart';

class AppointmentTipsCubit extends Cubit<List<AppointmentTips>> {
  final AppointmentTipsService _typeService =
      getIt.get<AppointmentTipsService>();

  AppointmentTipsCubit() : super([]);
Future<void> fetchAppointmentTypes(int doctorID) async {
  try {
    final appointmentTypes = await _typeService.fetchAppointmentTypes(doctorID);
    emit(appointmentTypes);
  } catch (e) {
    print('Error fetching appointment types: $e');
    emit([]);
  }
}

}