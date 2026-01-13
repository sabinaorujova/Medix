import 'package:get_it/get_it.dart';
import 'package:nutri_plate/src/core/network/dio_client.dart';
import 'package:nutri_plate/src/features/auth/data/repositories/auth_repository.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/repositories/clinic_visit_repository.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/repositories/clinic_search_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_detail_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_filter_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_search_repository.dart';
import 'package:nutri_plate/src/features/hospital/data/repositories/hospital_city_repository.dart';
import 'package:nutri_plate/src/features/doctor/data/repositories/doctor_repository.dart';
import 'package:nutri_plate/src/features/doctor/data/repositories/doctor_detail_repository.dart';
import 'package:nutri_plate/src/features/appointment/data/repositories/appointment_repository.dart';
import 'package:nutri_plate/src/features/patient/data/repositories/patient_repository.dart';
import 'package:nutri_plate/src/features/payment/data/repositories/payment_repository.dart';
import 'package:nutri_plate/src/features/service/data/repositories/service_repository.dart';
import 'package:nutri_plate/src/features/pharmacy/data/repositories/pharmacy_repository.dart';
import 'package:nutri_plate/src/features/call/data/repositories/call_repository.dart';
import 'package:nutri_plate/src/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:nutri_plate/src/features/splash/data/repositories/splash_repository.dart';
import 'package:nutri_plate/src/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:nutri_plate/src/features/clinic_visit/presentation/viewmodels/clinic_visit_viewmodel.dart';
import 'package:nutri_plate/src/features/hospital/presentation/viewmodels/hospital_list_viewmodel.dart';
import 'package:nutri_plate/src/features/doctor/presentation/viewmodels/doctor_list_viewmodel.dart';

import 'package:nutri_plate/src/features/appointment/data/services/confirm_appointment_service.dart';
import 'package:nutri_plate/src/features/appointment/data/services/appointment_create_service.dart';
import 'package:nutri_plate/src/features/appointment/data/services/appointment_tips_service.dart';
import 'package:nutri_plate/src/features/patient/data/services/blood_list_service.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/services/clinic_visit_service.dart';
import 'package:nutri_plate/src/features/doctor/data/services/doctor_list_service.dart';
import 'package:nutri_plate/src/features/patient/data/services/gender_service.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_city_list_service.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_filter_service.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_list_service.dart';
import 'package:nutri_plate/src/features/hospital/data/services/hospital_search_service.dart';
import 'package:nutri_plate/src/features/patient/data/services/patient_create_service.dart';
import 'package:nutri_plate/src/features/auth/data/services/token_service.dart';

import '../../../features/home/data/services/home_service.dart';
import '../../../features/hospital/data/services/hospital_detail_service.dart';
import '../../../features/auth/data/services/login_service.dart';
import '../../../features/auth/data/services/register_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerLazySingleton(() => DioClient());


  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<ClinicVisitRepository>(
    () => ClinicVisitRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<ClinicSearchRepository>(
    () => ClinicSearchRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HospitalRepository>(
    () => HospitalRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HospitalDetailRepository>(
    () => HospitalDetailRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HospitalFilterRepository>(
    () => HospitalFilterRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HospitalSearchRepository>(
    () => HospitalSearchRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HospitalCityRepository>(
    () => HospitalCityRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<DoctorRepository>(
    () => DoctorRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<DoctorDetailRepository>(
    () => DoctorDetailRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<AppointmentRepository>(
    () => AppointmentRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<PatientRepository>(
    () => PatientRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<PaymentRepository>(
    () => PaymentRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<PharmacyRepository>(
    () => PharmacyRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<CallRepository>(
    () => CallRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepository(getIt<DioClient>()),
  );
  getIt.registerLazySingleton<SplashRepository>(
    () => SplashRepository(getIt<DioClient>()),
  );


  getIt.registerFactory<AuthViewModel>(
    () => AuthViewModel(getIt<AuthRepository>()),
  );
  getIt.registerFactory<ClinicVisitViewModel>(
    () => ClinicVisitViewModel(getIt<ClinicVisitRepository>()),
  );
  getIt.registerFactory<HospitalListViewModel>(
    () => HospitalListViewModel(getIt<HospitalRepository>()),
  );
  getIt.registerFactory<DoctorListViewModel>(
    () => DoctorListViewModel(getIt<DoctorRepository>()),
  );


  getIt.registerLazySingleton(() => RegisterService());
  getIt.registerLazySingleton(() => LoginService());
  getIt.registerLazySingleton(() => ClinicVisitService());
  getIt.registerLazySingleton(() => HospitalListService());
  getIt.registerLazySingleton(() => HospitalDetailService());
  getIt.registerLazySingleton(() => DoctorListService());
  getIt.registerLazySingleton(() => DoctorDetailService());
  getIt.registerLazySingleton(() => HospitalCityListService());
  getIt.registerLazySingleton(() => HospitalFilterService());
  getIt.registerLazySingleton(() => AppointmentTipsService());
  getIt.registerLazySingleton(() => PatientService());
  getIt.registerLazySingleton(() => TokenService());
  getIt.registerLazySingleton(() => GenderService());
  getIt.registerLazySingleton(() => BloodService());
  getIt.registerLazySingleton(() => AppointmentService());
  getIt.registerLazySingleton(() => HospitalSearchService());
  getIt.registerLazySingleton(() => AppointmentConfirmService());
}