import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/dialogs/country_picker_dialog.dart';
import '../../../../core/utils/app_typography.dart';
import '../../data/country_model.dart';

// ignore: must_be_immutable
class CountryPicker extends StatefulWidget {
  final Function callBackFunction;
  bool isInit = true;
  CountryPicker({
    Key? key,
    required this.callBackFunction,
    this.isInit = true,
  }) : super(key: key);

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  List<CountryModel> countryList = [];
  CountryModel? selectedCountryData;

  @override
  void didChangeDependencies() async {
    if (widget.isInit) {
      widget.isInit = false;
      final data = await DefaultAssetBundle.of(context)
          .loadString('assets/countrycode.json');
      setState(() {
        countryList = parseJson(data);
        selectedCountryData = countryList[0];
      });
      widget.callBackFunction(selectedCountryData!.name,
          selectedCountryData!.dialCode, selectedCountryData!.flag);
    }
    super.didChangeDependencies();
  }

  List<CountryModel> parseJson(String response) {
    // ignore: unnecessary_null_comparison
    if (response == null) {
      return [];
    }
    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<CountryModel>(
            (json) => CountryModel.fromJson(json as Map<String, dynamic>))
        .toList() as List<CountryModel>;
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        showDialogue(context);
      },
      child: SizedBox(
        width: 90.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              selectedCountryData != null ? selectedCountryData!.flag : '',
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(width: 5.w),
            Text(
              selectedCountryData != null ? selectedCountryData!.dialCode : '',
              style: AppTypography.kMedium14,
            )
          ],
        ),
      ),
    );
  }

  Future<void> showDialogue(BuildContext context) async {
    final countryData = await showDialog(
      context: context,
      builder: (BuildContext context) => CountryPickerDialog(
        searchList: countryList,
        callBackFunction: widget.callBackFunction,
      ),
    );
    if (countryData != null) {
      selectedCountryData = countryData as CountryModel;
    }
    setState(() {});
  }
}
