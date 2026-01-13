import 'package:flutter/material.dart';
import 'package:nutri_plate/src/shared/presentation/global_widgets/appbar/custom_app_bar.dart';
import 'package:nutri_plate/src/features/home/components/home/widgets/listviews/services_list.dart';

class ServiceListPage extends StatelessWidget {
  const ServiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const ServicesList(),
    );
  }
}