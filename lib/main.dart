import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_confirm_cubit.dart/confirm_appointment_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/appointment_create_cubit/appointment_create_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/blood_list_cubit/blood_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/gender_list.cubit/gender_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/home/home_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_filter/hospital_filter_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_search/hospital_search_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/login/login_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/patient_create/patient_create_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/register/register_cubit.dart';
import 'package:nutri_plate/src/features/appointment/data/models/confirm_appointment_hive_model.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/clinic_visit/data/services/clinic_search_service.dart';
import 'src/shared/presentation/bloc/cubit/clinic_search/clinic_search_cubit.dart';
import 'src/features/patient/data/models/patient_details_hive_model.dart';
import 'src/core/utils/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/core/utils/constants/app_themes.dart';
import 'src/core/helper/extensions/configs.dart';
import 'src/core/helper/extensions/service_locator.dart';
import 'src/core/router/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();

  await Hive.initFlutter();
  Hive.registerAdapter(PatientDetailsHiveModelAdapter());
  await Hive.openBox<PatientDetailsHiveModel>('patientDetailsBox');
  Hive.registerAdapter(ConfirmAppointmentHiveModelAdapter());
  await Hive.openBox<ConfirmAppointmentHiveModel>('appointmentDetailsBox');
  await Hive.openBox<String>('authBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.backWhite,
      statusBarIconBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
        designSize: const Size(380, 812),
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => RegisterCubit(),
              ),
              BlocProvider(
                  create: (context) =>
                      ClinicSearchCubit(ClinicSearchService())),
              BlocProvider(create: (context) => HospitalFilterCubit()),
              BlocProvider(create: (context) => PatientCubit()),
              BlocProvider(
                  create: (context) => GenderCubit()..fetchGenderList()),
              BlocProvider(
                  create: (context) => BloodListCubit()..fetchBloodList()),
              BlocProvider(create: (context) => AppointmentCubit()),
              BlocProvider(create: (context) => HospitalSearchCubit()),
              BlocProvider(create: (context) => DoctorsDetailsCubit()),
              BlocProvider(
                  create: (context) =>
                      ConfirmAppointmentCubit()..fetchAppointments()),
            ],
            child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: Configs.appName,
                theme: AppThemes.appTheme,
                routerConfig: router),
          );
        });
  }
}
