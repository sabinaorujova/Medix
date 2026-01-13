/// API endpoint constants.
/// 
/// Contains all API endpoint URLs used throughout the application.
class EndPoints {
  EndPoints._();
  static const baseUrl = 'https://medix.pythonanywhere.com';


  static const registerUrl = '$baseUrl/accounts/register';
  static const loginUrl = '$baseUrl/accounts/login';


  static const clinicListUrl = '$baseUrl/clinic/list';


  static String hospitalListUrl(String clinicId) =>
      '$baseUrl/hospital/list/$clinicId';

  static const hospitalDetailUrl = '$baseUrl/hospital/detail';


  static String doctorListUrl(String hospitalId) =>
      '$baseUrl/doctor/list/$hospitalId';


  static const doctorDetailUrl = '$baseUrl/doctor/detail';


  static const hospitalCityListUrl = '$baseUrl/hospital/city/list';


    static const hospitalFilterListUrl = '$baseUrl/hospital/filter-list';
        static const typeUrl = '$baseUrl/appointment/type/list';


  static String appointmentTypeListUrl(int doctorId) =>
      '$baseUrl/appointment/type/list/$doctorId';


static const patientCreate = '$baseUrl/patient/create';

}