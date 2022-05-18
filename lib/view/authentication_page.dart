import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/services/apiservices.dart';
import 'package:bookitsubadminpanel/view/forgotpassword.dart';
import 'package:bookitsubadminpanel/view/layout.dart';
import 'package:bookitsubadminpanel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icons/logo.png', width: 50),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Login",
                        style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: blue)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Welcome back to sub-admin panel.",
                      color: green,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Email",
                      labelStyle: TextStyle(color: blue),
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    email.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      labelText: "Password",
                      labelStyle: TextStyle(color: blue),
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onSaved: (value) {
                    password.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: ()
                        // async
                        {
                      // var data = await APIService()
                      //     .createLogin(email.text, password.text);
                      // if (data['success'] == true) {
                      //   box.write("token", data["token"]);
                      Get.to(SiteLayout());
                      // } else {
                      //   print('...failed...');
                      // }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [blue, green]),
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const CustomText(
                        text: "Login",
                        color: Colors.white,
                        size: 20,
                        weight: FontWeight.normal,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  showLoading({String title = "Loading..."}) {
    Get.dialog(
        Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: 100,
              height: 40,
              child: Row(
                children: [
                  CircularProgressIndicator(color: dark),
                  const SizedBox(width: 20),
                  Text(title)
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
