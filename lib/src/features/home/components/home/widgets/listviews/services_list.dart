import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/clinic_visit/clinic_visit_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/home/home_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text/space_text.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/clinic_visit/presentation/screens/clinic_visit_page/clinic_visit_page.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.of<DoctorsDetailsCubit>(context).getHomeServices(),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final services = snapshot.data?.docs;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpaceText(
                textLeft: AppTexts.sevices,
            textRight: AppTexts.viewAll,
              ),
              16.verticalSpace,
              SizedBox(
                height: 53.h,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => ClinicVisitCubit(),
                          child: const ClinicVisitPage(),
                        ),
                      ),
                    );
                  },
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: services!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        final service = services[index].data();
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                              height: 53.h,
                              width: 126.w,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    service['image'] ?? '',
                                    height: 22.7,
                                    width: 22.7,
                                  ),
                                  8.horizontalSpace,
                                  Text(
                                    service['name'],
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )),
                        );
                      }),
                ),
              ),
            ],
          );
        });
  }
}