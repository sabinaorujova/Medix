import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nutri_plate/src/shared/presentation/global_widgets/components/listview_rounded.dart';

import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'patient_rating_count.dart';

class DoctorsBox extends StatelessWidget {
  const DoctorsBox(
      {super.key,
      required this.name,
      this.colorBorder,
      this.onTap,
      required this.image,
      required this.field,
      required this.reviewCount,
      required this.experence,
      required this.index});
  final String name;
  final Color? colorBorder;
  final void Function(int index)? onTap;
  final String image;
  final String field;
  final int experence;
  final int index;

  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
            onTap: () => onTap?.call(index),
            child: ListviewRounded(
                colorBorder: colorBorder,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(image),
                      8.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.black16,
                            ),
                            8.verticalSpace,
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    field,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.greyopasity12,
                                  ),
                                ),
                                8.horizontalSpace,
                                Flexible(
                                  child: Text(
                                    '$reviewCount',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.naturalgrey12,
                                  ),
                                ),
                                8.horizontalSpace,
                              ],
                            ),
                            8.verticalSpace,
                            Text(
                              '$experence',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.naturalgrey12,
                            ),
                            16.verticalSpace,
                            Row(
                              children: [
                                const PatientRatingCount(
                                  icon: Icons.people_alt_rounded,
                                  color: AppColors.primaryFirst,
                                  count: 1000,
                                  text: AppTexts.patient,
                                ),
                                8.horizontalSpace,
                                const PatientRatingCount(
                                  icon: Icons.star,
                                  color: AppColors.orange,
                                  count: 4,
                                  text: 'Rating',
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}