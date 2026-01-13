import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nutri_plate/src/core/utils/constants/app_colors.dart';
import '../../../components/pharmcay_details.dart/widgets/pharmacy_details_items.dart';
import '../../../components/pharmcay_details.dart/widgets/pharmacy_image.dart';
import '../../../components/pharmcay_details.dart/widgets/pharmacy_map.dart';
import '../../../components/pharmcay_details.dart/widgets/pharmacy_map_button.dart';

class PharmacyDetailsPage extends StatefulWidget {
  const PharmacyDetailsPage({
    Key? key,
    required this.pharmacyID,
  }) : super(key: key);

  final String pharmacyID;

  @override
  State<PharmacyDetailsPage> createState() => PharmacyDetailsPageState();
}

class PharmacyDetailsPageState extends State<PharmacyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backWhite,
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('pharmacy').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final pharmacyDatas = snapshot.data!;
            final pharmacyDetails = pharmacyDatas.docs
                .firstWhere((doc) => doc['pharmacyId'] == widget.pharmacyID);

            final pharmacyName = pharmacyDetails['name'];
            final location1 = pharmacyDetails['location'];
            final latitude = pharmacyDetails['latitude'];
            final longitude = pharmacyDetails['longitude'];
            final km = pharmacyDetails['km'];
            final image = pharmacyDetails['image'];
            final num = pharmacyDetails['num'];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PharmacyImage(image: image),
                Expanded(
                  child: PharmacyDetailsItems(
                    pharmacyID: widget.pharmacyID,
                    pharmacyName: pharmacyName,
                    location1: location1,
                    locationNum: km,
                    number: num,
                  ),
                ),
                PharmacyMapButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PharmacyMapPage(
                          latitude: latitude,
                          longitude: longitude,
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}