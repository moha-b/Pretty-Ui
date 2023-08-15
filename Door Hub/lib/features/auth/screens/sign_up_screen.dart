import 'package:door_hub/features/auth/screens/verification_code_screen.dart';
import 'package:door_hub/features/auth/screens/widgets/auth_field.dart';
import 'package:door_hub/features/auth/screens/widgets/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/animations/shake_animation.dart';
import '../../../core/common/buttons/custom_text_button.dart';
import '../../../core/common/buttons/primary_button.dart';
import '../../../core/common/dividers/custom_vertical_divider.dart';
import '../../../core/common/drop_down/custom_drop_down.dart';
import '../../../core/utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isFormValidated = false;
  String selectedValue = 'Mr.';
  final _shakeKey = GlobalKey<ShakeWidgetState>();

  void _validateForm() {
    setState(() {
      if (_firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {
        isFormValidated = true;
      } else {
        isFormValidated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDarkMode(context) ? AppColors.kDarkBackground : AppColors.kWhite,
      appBar: AppBar(
        backgroundColor:
            isDarkMode(context) ? AppColors.kDarkBackground : AppColors.kWhite,
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Center(child: Image.asset(AppAssets.kLogoBlue)),
            SizedBox(height: 32.h),
            Text('Sign Up', style: AppTypography.kMedium32),
            SizedBox(height: 24.h),
            Text('First Name', style: AppTypography.kMedium15),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? AppColors.kContentColor
                      : AppColors.kInput,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusTen)),
              child: Row(
                children: [
                  CustomDropDown(
                    value: selectedValue,
                    items: const ['Mr.', 'Mrs.'],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                  const CustomVerticalDivider(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: AuthField(
                        controller: _firstNameController,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        hintText: 'First Name',
                        onChanged: (value) {
                          setState(() {});
                          _validateForm();
                          return value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text('Last Name', style: AppTypography.kMedium15),
            SizedBox(height: 8.h),
            AuthField(
              controller: _lastNameController,
              hintText: 'Last Name',
              onChanged: (value) {
                setState(() {});
                _validateForm();
                return value;
              },
            ),
            SizedBox(height: 20.h),
            Text('Phone Number', style: AppTypography.kMedium15),
            SizedBox(height: 8.h),
            // Number Field.
            Container(
              decoration: BoxDecoration(
                  color: isDarkMode(context)
                      ? AppColors.kContentColor
                      : AppColors.kInput,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusTen)),
              child: Row(
                children: [
                  CountryPicker(
                    callBackFunction:
                        (String name, String dialCode, String flag) {},
                  ),
                  const CustomVerticalDivider(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: AuthField(
                        controller: _phoneController,
                        onChanged: (value) {
                          setState(() {});
                          _validateForm();
                          return value;
                        },
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.number,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'^0[0-9]*$')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text('Email', style: AppTypography.kMedium15),
            SizedBox(height: 8.h),
            AuthField(
              controller: _emailController,
              hintText: 'Email',
              onChanged: (value) {
                setState(() {});
                _validateForm();
                return value;
              },
            ),
            SizedBox(height: 60.h),
            ShakeWidget(
              key: _shakeKey,
              shakeOffset: 10.0,
              shakeDuration: const Duration(milliseconds: 500),
              child: PrimaryButton(
                onTap: () {
                  if (isFormValidated) {
                    Get.to(() => const VerificationCode(),
                        transition: Transition.zoom);
                  } else {
                    _shakeKey.currentState?.shake();
                  }
                },
                text: 'Sign Up',
                color: isFormValidated
                    ? null
                    : isDarkMode(context)
                        ? AppColors.kDarkHint
                        : AppColors.kInput,
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account?',
                  style: AppTypography.kMedium13
                      .copyWith(color: AppColors.kNeutral),
                ),
                CustomTextButton(
                  onPressed: () {
                    Get.back();
                  },
                  text: 'Sign In',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
