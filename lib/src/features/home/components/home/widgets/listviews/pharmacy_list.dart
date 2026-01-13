import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text/space_text.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/product_box/product_box.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/core/router/navigate.dart';

class PharmacyList extends StatelessWidget {
  const PharmacyList({super.key});

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
              SpaceText(
                onTap: () {
                  Navigate.to(context, 'pharmacy-list');
                },
                textLeft: AppTexts.pharmasy,
                textRight: AppTexts.viewAll,
              ),
              SizedBox(
                height: 213.h,
                child: ListView.separated(
                    itemCount: pharmacyList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      final pharmacy = pharmacyList[index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigate.to(context, 'pharmacy-details',
                                  pathParameters: {'pharmacyId': pharmacy.id});
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
              ),
            ],
          );
        });
  }
}
