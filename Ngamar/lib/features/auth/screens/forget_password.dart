import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ngamar/core/core.dart';
import 'package:ngamar/features/auth/screens/widgets/widgets.dart';

import 'create_new_password.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
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
              Text('Forgot Password', style: AppTypography.kBold24),
              SizedBox(height: AppSpacing.fiveVertical),
              Text(
                'Recover your account password',
                style: AppTypography.kMedium14.copyWith(
                  color: AppColors.kGrey60,
                ),
              ),
              SizedBox(height: AppSpacing.thirtyVertical),
              // Email Field.
              AuthField(
                title: 'E-mail',
                hintText: 'Enter your email address',
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!value.isEmail) {
                    return 'Invalid email address';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: AppSpacing.fiftyVertical),
              PrimaryButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to<Widget>(() => const CreateNewPassword());
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
