import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/auth/screens/widgets/widgets.dart';


class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Create a\nNew Password',
                textAlign: TextAlign.center,
                style: AppTypography.kBold24,
              ),
              SizedBox(height: AppSpacing.fiveVertical),
              Text(
                'Enter your new password',
                style: AppTypography.kMedium14.copyWith(
                  color: AppColors.kGrey60,
                ),
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
              // Email Field.
              AuthField(
                title: 'New Password',
                hintText: 'Enter new password',
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 8) {
                    return 'Password should be at least 8 characters long';
                  }
                  return null;
                },
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: AppSpacing.twelveVertical),
              AuthField(
                title: 'Confirm Password',
                hintText: 'Confirm your password',
                controller: _confirmController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value != _passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: AppSpacing.fiftyVertical),
              PrimaryButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.dialog<void>(PasswordChangeSuccessDialog(
                      continueCallback: () {
                        Get.back<void>();
                      },
                    ));
                  }
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
