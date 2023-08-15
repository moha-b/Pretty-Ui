import 'package:flutter/material.dart';

import '../../../features/auth/data/country_model.dart';
import '../../utils/utils.dart';

class CountryPickerDialog extends StatefulWidget {
  final List<CountryModel> searchList;
  final Function callBackFunction;

  const CountryPickerDialog({
    super.key,
    required this.searchList,
    required this.callBackFunction,
  });

  @override
  _CountryPickerDialogState createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  List<CountryModel> tmpList = [];

  Widget dialogContent(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusTen))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppSpacing.fifteenHorizontal),
            decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppSpacing.radiusTen))),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select Country',
                    style: AppTypography.kMedium18,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkResponse(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search Country',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18.0,
                    color: Colors.black38,
                  )),
              onChanged: filterData,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...tmpList.map(
                    (item) => GestureDetector(
                      onTap: () {
                        Navigator.pop(context, item);
                        widget.callBackFunction(
                            item.name, item.dialCode, item.flag);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.flag,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text(
                                item.name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              item.dialCode,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void filterData(String text) {
    tmpList = [];
    if (text == '') {
      tmpList.addAll(widget.searchList);
    } else {
      for (var userDetail in widget.searchList) {
        if (userDetail.name.toLowerCase().contains(text.toLowerCase())) {
          tmpList.add(userDetail);
        }
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tmpList = widget.searchList;
  }

  // build method
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
