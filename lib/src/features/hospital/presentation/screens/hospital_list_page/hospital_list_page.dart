import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_filter/hospital_filter_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_list/hospital_list_state.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_city_list/hospital_city_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/hospital_list/hospital_list_cubit.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/my_app_bar.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/buttons/global_button.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/text_search_filter/text_search_filter.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_texts.dart';
import '../filter/filter_screen.dart';
import '../hospoital_page/hospital_page.dart';
import '../../../components/hospital_list_page/widgets/hospital_list.dart';

class HospitalListPage extends StatefulWidget {
  final String clinicId;

  const HospitalListPage({super.key, required this.clinicId});

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  String? selectedHospitalid;
  int? selectedHospitalIndex;

  @override
  void initState() {
    super.initState();
    context.read<HospitalListCubit>().getHospitals(widget.clinicId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralLight,
      appBar: const MyAppBar(
        indicatorPosition: 0.0,
        indicatorWidthRatio: 0.5,
        text: AppTexts.chooseHospital,
        number: '2',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextSearchFilter(
                text: AppTexts.hospitalList,
                filterOnTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: 'Kapat',
                    builder: (BuildContext context) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => HospitalCityListCubit()..getHospitalCityList(),
                          ),
                          BlocProvider(
                            create: (context) => HospitalFilterCubit()
                          ),
                        ],
                        child: const FilterScreen(),
                      );
                    },
                  );
                },
              ),
              8.verticalSpace,
              BlocBuilder<HospitalListCubit, HospitalListState>(
                builder: (context, state) {
                  if (state is HospitalListLoading ||
                      state is HospitalListInitial) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (state is HospitalListSuccess) {
                    return HospitalList(
                      onHospitalSelected: (index, id) {
                        setState(() {
                          selectedHospitalid = id;
                          selectedHospitalIndex = index;
                        });
                      },
                    );
                  } else {
                    return const Text("Error loading hospitals");
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlobalButton(
          onTap: () {
            if (selectedHospitalid != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HospitalDetailPage(hospitalId: selectedHospitalid!),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select a hospital first")),
              );
            }
          },
          title: AppTexts.continueButton,
          icon: Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}