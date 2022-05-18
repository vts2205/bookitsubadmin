import 'package:bookitsubadminpanel/constants/controllers.dart';
import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/controllers/profile_controller.dart';
import 'package:bookitsubadminpanel/helpers/responsiveness.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key key}) : super(key: key);

  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 20,
                      weight: FontWeight.bold,
                      color: green,
                    )),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.topLeft,
            child: buildProfile(),
          ),
        ],
      ),
    );
  }

  Obx buildProfile() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: blue),
        );
      }
      return SingleChildScrollView(
        child: Container(
          width: 500,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      text: "Name :",
                      color: blue,
                      weight: FontWeight.w900,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller.nameController,
                      cursorColor: green,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          hintText: "Enter your name",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      text: "Phone Number :",
                      color: blue,
                      weight: FontWeight.w900,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller.phoneController,
                      cursorColor: green,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          hintText: "Enter your phone number",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      text: "Designation :",
                      color: blue,
                      weight: FontWeight.w900,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller.designationController,
                      cursorColor: green,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          hintText: "Enter your designation",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      text: "Email :",
                      color: blue,
                      weight: FontWeight.w900,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller.emailController,
                      cursorColor: green,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          hintText: "Enter your email address",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(
                      text: "Password :",
                      color: blue,
                      weight: FontWeight.w900,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: controller.passwordController,
                      cursorColor: green,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          hintText: "Enter your password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: blue, padding: const EdgeInsets.all(15)),
                  onPressed: () {
                    if (controller.nameController.text.trim() != '' ||
                        controller.phoneController.text.trim() != '' ||
                        controller.designationController.text.trim() != '' ||
                        controller.emailController.text.trim() != '' ||
                        controller.passwordController.text.trim() != '') {
                      controller.fetchProfileUpdate();
                    } else {
                      print('Failed');
                      return null;
                    }
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
