import 'package:door_hub/core/common/common_widgets.dart';
import 'package:door_hub/core/utils/utils.dart';
import 'package:door_hub/features/profile/screens/widgets/profile_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/screens/widgets/auth_field.dart';
import '../../auth/screens/widgets/country_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    _phoneController.text = '1234567898';
    _emailController.text = 'johndoe@gmail.com';
    _genderController.text = 'Male';
    _dobController.text = '06/11/1998';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                const CustomHeaderText(text: 'Profile'),
                const Spacer(),
                CustomButton(
                  onTap: () {},
                  icon: AppAssets.kEdit,
                  text: 'Edit Profile',
                )
              ],
            ),
            SizedBox(height: 21.h),
            PrimaryContainer(
                child: ProfileImageCard(
              onTap: null,
              textColor: isDarkMode(context) ? AppColors.kWhite : Colors.black,
            )),
            SizedBox(height: 16.h),
            PrimaryContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number', style: AppTypography.kMedium15),
                  SizedBox(height: 8.h),
                  // Number Field.
                  Container(
                    decoration: BoxDecoration(
                        color: isDarkMode(context)
                            ? AppColors.kContentColor
                            : AppColors.kInput,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusTen)),
                    child: Row(
                      children: [
                        CountryPicker(
                          callBackFunction:
                              (String name, String dialCode, String flag) {},
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: AuthField(
                            controller: _phoneController,
                            hintText: 'Phone Number',
                            keyboardType: TextInputType.number,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'^0[0-9]*$'))
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text('Email', style: AppTypography.kMedium15),
                  SizedBox(height: 8.h),
                  AuthField(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  Text('Gender', style: AppTypography.kMedium15),
                  SizedBox(height: 8.h),
                  AuthField(
                    controller: _genderController,
                    hintText: 'Gender',
                  ),
                  SizedBox(height: 24.h),
                  Text('Date of Birth', style: AppTypography.kMedium15),
                  SizedBox(height: 8.h),
                  AuthField(
                    controller: _dobController,
                    hintText: '06/11/1998',
                    keyboardType: TextInputType.datetime,
                  ),
                ],
              ),
            ),
            SizedBox(height: 250.h),
          ],
        ),
      ),
    );
  }
}
