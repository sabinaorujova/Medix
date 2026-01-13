import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/home/home_cubit.dart' show DoctorsDetailsCubit;
import 'package:nutri_plate/src/shared/presentation/global_widgets/product_box/product_box.dart';
import 'package:nutri_plate/src/features/pharmacy/presentation/screens/pharmcay_details.dart/pharmacy_details_page.dart';

class PharmacyGridList extends StatelessWidget {
  const PharmacyGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('pharmacy').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }

          final pharmacyList = snapshot.data!.docs;

          return Column(
            children: [
              16.verticalSpace,
              GridView.builder(
                  itemCount: pharmacyList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final pharmacy = pharmacyList[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => DoctorsDetailsCubit(),
                                  child: PharmacyDetailsPage(
                                    pharmacyID: pharmacy.id,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ProductBox(
                            img: pharmacy['image'] ?? '',
                            name: pharmacy['name'] ?? '',
                            text1: pharmacy['location'] ?? '',
                            text2: pharmacy['km'] ?? '',
                            text3: pharmacy['shopping'] ?? '',
                          ),
                        ));
                  }),
            ],
          );
        });
  }
}