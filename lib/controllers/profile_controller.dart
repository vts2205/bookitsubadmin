import 'package:bookitsubadminpanel/models/getprofilemodel.dart';
import 'package:bookitsubadminpanel/models/profileupdatemodel.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var getProfileInfo = <GetProfileModel>[].obs;
  var updateProfileInfo = <ProfileUpdateModel>[].obs;
  var isLoading = true.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    fetchProfileInfo();
    super.onInit();
  }

  void fetchProfileInfo() async {
    try {
      isLoading(true);
      var profileInfo = await APIService().fetchProfile();
      if (profileInfo != null) {
        getProfileInfo.assign(profileInfo);

        nameController.text = getProfileInfo[0].userValue.name;
        phoneController.text = getProfileInfo[0].userValue.phonenumber;
        designationController.text = getProfileInfo[0].userValue.designation;
        emailController.text = getProfileInfo[0].userValue.email;
        passwordController.text = getProfileInfo[0].userValue.passwordText;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProfileUpdate() async {
    try {
      isLoading(true);
      var profileUpdateInfo = await APIService().updateProfile(
          nameController.text,
          phoneController.text,
          designationController.text,
          emailController.text,
          passwordController.text);
      if (profileUpdateInfo != null) {
        updateProfileInfo.assign(profileUpdateInfo);
        passwordController.text =
            profileUpdateInfo.profileEdit[0].password ?? '';
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}
