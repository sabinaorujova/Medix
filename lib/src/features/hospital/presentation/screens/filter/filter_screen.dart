import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_city_list/hospital_city_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/inputs/global_inputs.dart';
import 'package:nutri_plate/src/core/utils/constants/app_text_style.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import 'package:nutri_plate/src/features/hospital/presentation/screens/filter/hospital_filter_screen.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_filter/hospital_filter_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import '../../../components/filter/widgets/filter_city.dart';
import '../../../components/filter/widgets/filter_title.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hospitalFilterCubit = context.read<HospitalFilterCubit>();

    String selectedCity = '';
    final TextEditingController minPriceController = TextEditingController();
    final TextEditingController maxPriceController = TextEditingController();
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FilterTitle(),
                  24.verticalSpace,
                  BlocBuilder<HospitalCityListCubit, HospitalCityListState>(
                    builder: (context, state) {
                      if (state is HospitalCityListLoading ||
                          state is HospitalCityListInitial) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      } else if (state is HospitalCityListSuccess) {
                        return const FilterCity();
                      } else {
                        return const Text("Error loading clinics");
                      }
                    },
                  ),

                  8.verticalSpace,
                  const Divider(),
                  Text(
                    AppTexts.minPrice,
                    style: AppTextStyles.primary16
                  ),
                  GlobalInput(
                    controller: minPriceController,
                  ),
                  8.verticalSpace,
                  Text(
                    AppTexts.maxPrice,
                    style: AppTextStyles.primary16
                  ),
                  GlobalInput(
                    controller: maxPriceController,
                  ),
                  8.verticalSpace,
                  GlobalButton(
                    onTap: () {
                      final minPrice = int.tryParse(minPriceController.text) ?? 0;
                      final maxPrice = int.tryParse(maxPriceController.text) ?? 10000;

                      hospitalFilterCubit.getFilters(selectedCity, minPrice, maxPrice);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HospitalFilterPage(),
                        ),
                      );
                    },
                    title: AppTexts.search,
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}