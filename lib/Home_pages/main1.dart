import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  storeOnvording() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('key', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  storeOnvording();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text(
                  "Passer",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/pharmacie.png"),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Bienvenue à PharmaEase",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 2),
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  "Le service de  livraison de médicaments permettant d'acheminer les médicaments prescrits directement au domicile du patient.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 87, 85, 85),
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
