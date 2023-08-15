import 'dart:async';

import 'package:door_hub/features/auth/screens/widgets/custom_otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/buttons/primary_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_typography.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final _verificationCodeController = TextEditingController();
  bool _formValidated = false;
  int _timerSeconds = 25;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          timer.cancel();
        }
      });
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
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80.h),
            Text('Verification Code', style: AppTypography.kBold32),
            Text(
                'We just send you a verify code. Check your\ninbox to get them.',
                style: AppTypography.kLight14),
            SizedBox(height: 24.h),
            OTPField(
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    _formValidated = false;
                  });
                } else {
                  setState(() {
                    _formValidated = true;
                  });
                }
              },
              controller: _verificationCodeController,
            ),
            SizedBox(height: 40.h),
            PrimaryButton(
              onTap: () {},
              text: 'Continue',
              color: _formValidated
                  ? null
                  : isDarkMode(context)
                      ? AppColors.kDarkHint
                      : AppColors.kInput,
            ),
            SizedBox(height: 74.h),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Resend Code in ',
                    style: AppTypography.kLight16.copyWith(
                        color: isDarkMode(context)
                            ? AppColors.kWhite
                            : Colors.black),
                    children: [
                      TextSpan(
                          text: '0 : $_timerSeconds',
                          style: AppTypography.kLight16
                              .copyWith(color: AppColors.kPrimary))
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
