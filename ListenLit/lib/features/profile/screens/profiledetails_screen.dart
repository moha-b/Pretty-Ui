import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listenlit/core/utils/utils.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';
import 'package:listenlit/features/profile/screens/widgets/inputfield_widget.dart';

class ProfileDetailsScreen extends StatefulWidget {
  UserModel userModel;
  ProfileDetailsScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _pickedImage;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel.userName;
    emailController.text = widget.userModel.email!;
    dateController.text = widget.userModel.dateOfBirth!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBlackColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.kBlackColor,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: AppColor.kWhiteColor,
                size: 20.sp,
              ),
              Text(
                'Back',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  color: AppColor.kLightAccentColor,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 32.h,
          left: 16.w,
          right: 16.w,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Profile details',
            style: TextStyle(
              fontSize: 25.sp,
              fontFamily: 'Inter',
              color: AppColor.kLightAccentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 24.h,
            ),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: _pickedImage == null
                        ? CircleAvatar(
                            backgroundImage: AssetImage(
                              widget.userModel.userImage,
                            ),
                          )
                        : Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(56),
                                image: DecorationImage(
                                  image: FileImage(_pickedImage!),
                                  fit: BoxFit.cover,
                                )),
                          ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _pickImage(ImageSource.gallery);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 64.h, left: 67.w),
                      child: Container(
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          color: AppColor.kPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: SvgPicture.asset(AppIcons.kUploadIcon)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16.h,
            ),
            child: Center(
                child: Text(
              'Change profile picture',
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: AppColor.kPrimary,
              ),
            )),
          ),
          SizedBox(
            height: 32.h,
          ),
          Divider(
            color: AppColor.kSamiDarkColor,
          ),
          SizedBox(
            height: 32.h,
          ),
          InputFieldWidget(label: 'Your Name', controller: nameController),
          SizedBox(
            height: 24.h,
          ),
          InputFieldWidget(label: 'Email', controller: emailController),
          SizedBox(
            height: 24.h,
          ),
          InputFieldWidget(label: 'Date of Birth', controller: dateController),
        ]),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: source);
    setState(() {
      _pickedImage = File(pickedImage!.path);
    });
  }
}
