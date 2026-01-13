import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/core/utils/constants/app_paddings.dart';
import '../../../../features/clinic_visit/components/clinic_visit_page/widgets/clinic_visit_box.dart';
import '../../../../features/clinic_visit/data/models/clinic_search_model.dart' show ClinicSearchModel;
import '../../../../features/hospital/components/hospital_list_page/widgets/hospital_box.dart';
import '../../../../features/hospital/data/models/hospital_search_model.dart';
import '../../bloc/cubit/clinic_search/clinic_search_cubit.dart';
import '../../bloc/cubit/clinic_search/clinic_search_state.dart';
import '../../bloc/cubit/hospital_search/hospital_search_cubit.dart';
import '../../bloc/cubit/hospital_search/hospital_search_state.dart';


class ClinicSearchPage extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty) {
      return Container(color: AppColors.backWhite);
    }


    context.read<ClinicSearchCubit>().searchClinics(query);
    context.read<HospitalSearchCubit>().searchHospitals(query); 

    return MultiBlocListener(
      listeners: [
        BlocListener<ClinicSearchCubit, ClinicSearchState>(
          listener: (context, state) {
            if (state is ClinicSearchError) {

            }
          },
        ),
        BlocListener<HospitalSearchCubit, HospitalSearchState>(
          listener: (context, state) {
            if (state is HospitalSearchError) {

            }
          },
        ),
      ],
      child: BlocBuilder<ClinicSearchCubit, ClinicSearchState>(
        builder: (context, clinicState) {
          return BlocBuilder<HospitalSearchCubit, HospitalSearchState>(
            builder: (context, hospitalState) {
              final clinics = clinicState is ClinicSearchLoaded
                  ? clinicState.clinics
                      .where((clinic) => clinic.name!.toLowerCase().contains(query.toLowerCase()))
                      .toList()
                  : [];

              final hospitals = hospitalState is HospitalSearchLoaded
                  ? hospitalState.hospitals
                      .where((hospital) => hospital.name!.toLowerCase().contains(query.toLowerCase()))
                      .toList()
                  : [];

              final combinedResults = [...clinics, ...hospitals];

              return Container(
                color: AppColors.backWhite,
                child: ListView.builder(
                  itemCount: combinedResults.length,
                  itemBuilder: (context, index) {
                    final item = combinedResults[index];
                    return ListTile(
                      title: Text(item.name!),
                      onTap: () {
                        query = item.name!;
                        showResults(context);
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if (query.isEmpty) {
      return Container(color: AppColors.backWhite);
    }


    context.read<ClinicSearchCubit>().searchClinics(query);
    context.read<HospitalSearchCubit>().searchHospitals(query);

    return MultiBlocListener(
      listeners: [
        BlocListener<ClinicSearchCubit, ClinicSearchState>(
          listener: (context, state) {
            if (state is ClinicSearchError) {

            }
          },
        ),
        BlocListener<HospitalSearchCubit, HospitalSearchState>(
          listener: (context, state) {
            if (state is HospitalSearchError) {

            }
          },
        ),
      ],
      child: BlocBuilder<ClinicSearchCubit, ClinicSearchState>(
        builder: (context, clinicState) {
          return BlocBuilder<HospitalSearchCubit, HospitalSearchState>(
            builder: (context, hospitalState) {
              final clinics = clinicState is ClinicSearchLoaded
                  ? clinicState.clinics
                  : [];

              final hospitals = hospitalState is HospitalSearchLoaded
                  ? hospitalState.hospitals
                  : [];

              final combinedResults = [...clinics, ...hospitals];

              return Scaffold(
                backgroundColor: AppColors.backWhite,
                body: ListView.separated(
                  padding: AppPaddings.all12,
                  itemCount: combinedResults.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = combinedResults[index];
                    if (item is ClinicSearchModel) {
                      return ClinicVisitBox(
                        name: item.name!,
                        hospitalCount: item.numberOfHospitals!,
                        img: item.cover!,
                        index: item.id!,
                        maxPrice: item.maxPrice!,
                        minPrice: item.minPrice!,
                      );
                    } else if (item is HospitalSearchModel) {
                      return HospitalBox(
                        name: item.name!,
                        img: item.cover!,
                        location: item.address!,
                        index: item.id!,
                        price: item.price!,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}