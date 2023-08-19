import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foochi/core/utils/utils.dart';

void showLoading() {
  EasyLoading.show(
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true,
    indicator: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimary),
    ),
  );
}

void hideLoading() {
  EasyLoading.dismiss();
}
