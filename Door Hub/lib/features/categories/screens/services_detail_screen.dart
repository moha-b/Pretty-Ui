import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/containers/primary_container.dart';
import '../../../core/common/texts/custom_header_text.dart';
import '../../../core/utils/app_typography.dart';
import '../../home/data/services_model.dart';
import '../data/property_type.dart';
import '../screens/widgets/detail_image_header.dart';
import '../screens/widgets/property_type_card.dart';
import '../screens/widgets/quantity_card.dart';
import '../screens/widgets/service_sheet.dart';

class ServicesDetailView extends StatefulWidget {
  final ServicesModel services;
  const ServicesDetailView({required this.services, super.key});

  @override
  State<ServicesDetailView> createState() => _ServicesDetailViewState();
}

class _ServicesDetailViewState extends State<ServicesDetailView> {
  int _selectedProperty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            DetailImageHeader(service: widget.services),
            Positioned(
              top: 228.h,
              left: 20.w,
              right: 20.w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    PrimaryContainer(
                      child: Column(
                        children: [
                          CustomHeaderText(
                              text: 'Type of Property', fontSize: 18.sp),
                          SizedBox(height: 16.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                  3,
                                  (index) => PropertyTypeCard(
                                      property: properties[index],
                                      onTap: () {
                                        setState(() {
                                          _selectedProperty = index;
                                        });
                                      },
                                      isSelected: _selectedProperty == index)))
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    PrimaryContainer(
                      child: Column(
                        children: [
                          QuantityCard(
                            text: 'Number of Units',
                            onChanged: (value) {},
                          ),
                          const Divider(),
                          QuantityCard(
                            text: 'Number of Bedrooms',
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    PrimaryContainer(
                      child: Column(
                        children: [
                          CustomHeaderText(
                              text: 'Description', fontSize: 18.sp),
                          SizedBox(height: 16.h),
                          Text(
                            loremIpsumText,
                            style: AppTypography.kExtraLight13,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: ServiceSheet(
        bookText: 'Book Now',
        bookCallback: () {},
        isDetailPage: true,
        saveCallback: () {},
      ),
    );
  }
}
