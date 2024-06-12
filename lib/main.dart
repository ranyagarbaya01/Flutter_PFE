import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final token = sharedPreferences.getString('token');
  print(sharedPreferences.getKeys()); //
  print("token : $token"); //just nheb naaref 3leh lena temchi w ghadi le dkika
  Widget screen;
  if (token != null) {
    screen = HowCommand();
  } else {
    screen = HomePage();
  }

  runApp(MyApp(screen: screen));
}

SharedPreferences? sharedPref;

class MyApp extends StatelessWidget {
  Widget screen;

  MyApp({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screen,
    );
    /*GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,

      theme: AppTheme.LightTheme,
      themeMode: ThemeMode.light,

    );*/
  }
}
