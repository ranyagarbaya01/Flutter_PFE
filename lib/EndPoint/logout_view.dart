import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HowCommand();
            }));
          },
        ),
        title: Text('Pour vous déconnecter'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Color.fromARGB(255, 22, 219, 101)),
            minimumSize:
                MaterialStateProperty.resolveWith((states) => Size(100, 80)),
          ),
          onPressed: () {
            Future<void> logout() async {
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              await sharedPreferences.remove('token');
            }

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
          child: Text('Se déconnecter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
