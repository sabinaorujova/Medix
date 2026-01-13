import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/product_box/product_box.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text/space_text.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';

class PopularDoctorsList extends StatelessWidget {
  const PopularDoctorsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final doctorsList = snapshot.data!.docs;
        return Column(
          children: [
            const SpaceText(
              textLeft: AppTexts.popularDoctors,
              textRight: AppTexts.viewAll,
            ),
            SizedBox(
              height: 270.h,
              child: ListView.separated(
                itemCount: doctorsList.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final doctor = doctorsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {










                      },
                      child: ProductBox(
                        img: doctor['image'] ?? '',
                        name: doctor['name'] ?? '',
                        text1: doctor['field'] ?? '',
                        text2: doctor['reviewCount'] ?? '5',
                        text3: doctor['experence'] ?? '',
                        height: 244.h,
                        width: 176.w,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}