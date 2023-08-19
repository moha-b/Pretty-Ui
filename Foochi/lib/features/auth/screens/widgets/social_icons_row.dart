import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foochi/core/utils/utils.dart';
import 'package:foochi/features/auth/screens/widgets/social_icons.dart';

class SocialIconRow extends StatelessWidget {
  final VoidCallback googleCallback;
  final VoidCallback facebookCallback;
  final VoidCallback twitterCallback;
  const SocialIconRow(
      {super.key,
      required this.googleCallback,
      required this.facebookCallback,
      required this.twitterCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: SocialIcons(
                onTap: googleCallback,
                isGoogleIcon: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.kGoogle,
                      color: AppColors.kWhite,
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      'with Google',
                      style: AppTypography.kExtraLight14
                          .copyWith(color: AppColors.kWhite),
                    )
                  ],
                ))),
        SocialIcons(
          onTap: facebookCallback,
          child: Image.asset(
            AppAssets.kFacebook,
            color: AppColors.kSecondary,
          ),
        ),
        SocialIcons(
          onTap: twitterCallback,
          child: Image.asset(
            AppAssets.kTwitter,
            color: AppColors.kSecondary,
          ),
        ),
      ],
    );
  }
}
