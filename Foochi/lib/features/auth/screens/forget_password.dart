import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/common/buttons/buttons.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/auth/screens/verification_code.dart';
import 'package:foochi/features/auth/screens/widgets/auth_field.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Center(child: Image.asset(AppAssets.kAppLogo)),
              SizedBox(height: 30.h),
              Text('Forget Password',
                  style: AppTypography.kBold30
                      .copyWith(color: AppColors.kSecondary)),
              Text(
                'We will send the code to your phone',
                style: AppTypography.kLight14
                    .copyWith(color: AppColors.kSecondary),
              ),
              SizedBox(height: 40.h),
              AuthField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                isPhone: true,
                hintText: 'Phone Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.h),
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => const VerificationCode());
                    }
                  },
                  text: 'Send')
            ],
          ),
        ),
      ),
    );
  }
}
