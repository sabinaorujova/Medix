import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'popular_doctor_state.dart';

class HomeCubit extends Cubit<PopularDoctorState> {
  HomeCubit() : super(PopularDoctorInitial());
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> addDocumentAndGetId(
      String collectionName, Map<String, dynamic> data) async {
    try {
      DocumentReference documentReference =
          await _firestore.collection(collectionName).add(data);

      return documentReference.id;
    } catch (e) {
      log("An error occurred: $e");
      return null;
    }
  }
}