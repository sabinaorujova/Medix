import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/appointment_calendar/appointment_calendar_page.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/appointment_personal_info/appointment_personal_info_page.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/book_appoinment/appointment_personal_information_page.dart';
import 'package:nutri_plate/src/features/appointment/presentation/screens/confirm_appointment/confirm_appointment_page.dart';
import 'package:nutri_plate/src/features/call/presentation/screens/call/call_page.dart';
import 'package:nutri_plate/src/features/clinic_visit/presentation/screens/clinic_visit_page/clinic_visit_page.dart';
import 'package:nutri_plate/src/features/doctor/presentation/screens/doctors_page/doctors_page.dart';
import 'package:nutri_plate/src/features/doctor/presentation/screens/doctor_profile/doctor_profile_page.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_detail/hospital_detail_page.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_list_page/hospital_list_page.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospoital_page/hospital_page.dart'
    as hospital_page show HospitalDetailPage;
import 'package:nutri_plate/src/features/hospital/presentation/screens/hospital_popup/hospital_pop_page.dart';
import 'package:nutri_plate/src/features/patient/presentation/screens/add_dependent/add_dependent_page.dart';
import 'package:nutri_plate/src/features/patient/presentation/screens/choose_patient/choose_patient_page.dart';
import 'package:nutri_plate/src/features/payment/presentation/screens/payment_metod/add_card/add_card_page.dart'
    show AddCardDetailsPage;
import 'package:nutri_plate/src/features/payment/presentation/screens/payment_method/payment_method_page.dart';
import 'package:nutri_plate/src/features/pharmacy/presentation/screens/pharmcay_details.dart/pharmacy_details_page.dart';
import 'package:nutri_plate/src/features/pharmacy/presentation/screens/pharmacy_list/pharmacy_list_page.dart';
import 'package:nutri_plate/src/features/service/presentation/screens/service_list/service_list_page.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/home/home_cubit.dart'
    show DoctorsDetailsCubit;
import '../route_constants.dart';

List<RouteBase> get featureRoutes => [
      GoRoute(
        path: RouteConstants.clinicVisit,
        name: RouteConstants.clinicVisitpage,
        builder: (context, state) => const ClinicVisitPage(),
      ),
      GoRoute(
        path: RouteConstants.pharmacyList,
        name: 'pharmacy-list',
        builder: (context, state) => const PharmacyListPage(),
      ),
      GoRoute(
        path: '${RouteConstants.pharmacyDetails}/:pharmacyId',
        name: 'pharmacy-details',
        builder: (context, state) {
          final pharmacyId = state.pathParameters['pharmacyId'] ?? '';
          return BlocProvider(
            create: (context) => DoctorsDetailsCubit(),
            child: PharmacyDetailsPage(pharmacyID: pharmacyId),
          );
        },
      ),
      GoRoute(
        path: RouteConstants.choosePatient,
        name: 'choose-patient',
        builder: (context, state) => const ChoosePatientPage(),
      ),
      GoRoute(
        path: RouteConstants.addDependent,
        name: 'add-dependent',
        builder: (context, state) => const AddDependentPage(),
      ),
      GoRoute(
        path: RouteConstants.paymentMethod,
        name: 'payment-method',
        builder: (context, state) => const PaymentMethodPage(),
      ),
      GoRoute(
        path: RouteConstants.addCard,
        name: 'add-card',
        builder: (context, state) => const AddCardDetailsPage(),
      ),
      GoRoute(
        path: RouteConstants.doctorsPage,
        name: 'doctors',
        builder: (context, state) {
          final hospitalId = state.uri.queryParameters['hospitalId'] ?? '';
          return DoctorsPage(hospitalId: hospitalId);
        },
      ),
      GoRoute(
        path: '${RouteConstants.doctorProfile}/:doctorId',
        name: 'doctor-profile',
        builder: (context, state) {
          final doctorIdStr = state.pathParameters['doctorId'] ?? '';
          final doctorId =
              doctorIdStr.isNotEmpty ? int.tryParse(doctorIdStr) ?? 0 : 0;
          return DoctorProfilePage(doctorId: doctorId);
        },
      ),
      GoRoute(
        path: RouteConstants.hospitalList,
        name: 'hospital-list',
        builder: (context, state) {
          final clinicId = state.uri.queryParameters['clinicId'] ?? '';
          return HospitalListPage(clinicId: clinicId);
        },
      ),
      GoRoute(
        path: '${RouteConstants.hospitalDetail}/:hospitalId',
        name: 'hospital-detail',
        builder: (context, state) {
          final hospitalId = state.pathParameters['hospitalId'] ?? '';
          return HospitalDetailPage(hospitalId: hospitalId);
        },
      ),
      GoRoute(
        path: RouteConstants.hospitalPage,
        name: 'hospital-page',
        builder: (context, state) =>
            const hospital_page.HospitalDetailPage(hospitalId: ''),
      ),
      GoRoute(
        path: RouteConstants.hospitalPopup,
        name: 'hospital-popup',
        builder: (context, state) => const HospitalPopPage(),
      ),
      GoRoute(
        path: RouteConstants.appointmentPersonalInfo,
        name: 'appointment-personal-info',
        builder: (context, state) => const AppointmentPersonalInfoPage(),
      ),
      GoRoute(
        path: RouteConstants.appointmentCalendar,
        name: 'appointment-calendar',
        builder: (context, state) {
          final doctorIdStr = state.uri.queryParameters['doctorId'] ?? '';
          final doctorId =
              doctorIdStr.isNotEmpty ? int.tryParse(doctorIdStr) ?? 0 : 0;
          return AppointmentCalendarPage(doctorId: doctorId);
        },
      ),
      GoRoute(
        path: RouteConstants.appointmentPersonalInformation,
        name: 'appointment-personal-information',
        builder: (context, state) => const AppointmentPersonalInformationPage(),
      ),
      GoRoute(
        path: RouteConstants.confirmAppointment,
        name: 'confirm-appointment',
        builder: (context, state) => const ConfirmAppointmentPage(),
      ),
      GoRoute(
        path: RouteConstants.callPage,
        name: 'call',
        builder: (context, state) {
          final callID = state.uri.queryParameters['callID'] ?? '';
          return CallPage(callID: callID);
        },
      ),
      GoRoute(
        path: RouteConstants.serviceList,
        name: 'service-list',
        builder: (context, state) => const ServiceListPage(),
      ),
    ];
