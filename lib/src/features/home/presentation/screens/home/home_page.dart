import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_plate/src/features/home/components/home/widgets/views/home_view.dart';
import 'package:nutri_plate/src/shared/presentation/bloc/cubit/home/home_cubit.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import 'package:nutri_plate/src/features/home/components/home/widgets/views/appbar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsDetailsCubit(),
      child:const Scaffold(
          backgroundColor: AppColors.backWhite,
          appBar:  AppbarView(), 
          body: HomeView()
    ));
  }
}