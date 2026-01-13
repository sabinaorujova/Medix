import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorDetailService {
  static Stream<DocumentSnapshot<Map<String, dynamic>>> getDoctorDetailsById(
      String doctorId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(doctorId)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getServices() {
    return FirebaseFirestore.instance.collection('services').snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getPharmacy() {
    return FirebaseFirestore.instance.collection('pharmacy').snapshots();
  }
}
