import 'package:bookitsubadminpanel/constants/style.dart';
import 'package:bookitsubadminpanel/controllers/menu_controller.dart';
import 'package:bookitsubadminpanel/controllers/navigation_controller.dart';
import 'package:bookitsubadminpanel/view/authentication_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAV2s5Zw4fgnJ-z8reuI7GBRJxSv1XTgoE',
      appId: "1:445275009513:web:5e4beb8b65d3987b115b78",
      messagingSenderId: "445275009513",
      projectId: "bookitsubadmin",
    ),
  );
  Get.put(MenuController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: light,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationPage(),
    );
  }
}
