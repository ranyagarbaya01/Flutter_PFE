import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';


class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({super.key});

  @override
  State<WelcomePage3> createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {
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
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/livreur.png"),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 4),
              child: Text(
                "Le lien vital entre votre santé et votre porte",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
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
                  "soulignant l'importance de livreur en tant que lien crucial entre la santé du patient et la réception de leurs médicaments à domicile.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 87, 85, 85),
                    fontSize: 22,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color.fromARGB(255, 22, 219, 101),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "Commencer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
