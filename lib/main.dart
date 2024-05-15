import 'package:flutter/material.dart';
import 'package:pharmacy_app/EndPoint/logout_view.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/Patient/view/googlemap.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';
import 'package:pharmacy_app/Patient/view/list_pharmacies_view.dart';
import 'package:pharmacy_app/Patient/view/medicament_command.dart';
import 'package:pharmacy_app/Patient/view/panier_screen.dart';
import 'package:pharmacy_app/livreur/view/livraison_view.dart';
import 'package:pharmacy_app/livreur/view/signin_view.dart';
import 'package:pharmacy_app/pharmacien/view/pharmacien_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  //Get.put(LivraisonController()); // Put the LivraisonController instance in GetX storage

//await RenoteMedicamentService().get();
  runApp(const MyApp());
}

SharedPreferences? sharedPref;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    /*GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,

      theme: AppTheme.LightTheme,
      themeMode: ThemeMode.light,

    );*/
  }
}
