import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutDialog({required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Logout confirmation',
            style: AppTypography.kBold18,
          ),
          SizedBox(height: 10.h),
          Text(
            'Would you like to log out and return to the login screen?',
            style: AppTypography.kExtraLight14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          Divider(
            height: 0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Semantics(
                  button: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50.0.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Cancel',
                        style: AppTypography.kBold16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.00.h,
                width: 0.25.w,
                color: Colors.grey,
              ),
              Expanded(
                child: Semantics(
                  button: true,
                  child: InkWell(
                    onTap: onLogout,
                    child: Container(
                      height: 50.01.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Logout',
                        style:
                            AppTypography.kBold16.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
