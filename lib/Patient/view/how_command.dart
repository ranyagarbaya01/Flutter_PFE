import 'package:flutter/material.dart';
import 'package:pharmacy_app/Patient/view/commander.dart';
import 'package:pharmacy_app/Patient/view/googlemap.dart';
import 'package:pharmacy_app/Patient/view/list_command.dart';
import 'package:pharmacy_app/Patient/view/medicament_command.dart';

class HowCommand extends StatefulWidget {
  const HowCommand({super.key});

  @override
  State<HowCommand> createState() => _HowCommandState();
}

class _HowCommandState extends State<HowCommand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // leading: const BackButton(),
      //     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 22, 219, 101), // Custom background color
                minimumSize: Size(200, 100), // Custom button size
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PassCommand()));
              },
              child: Text(
                'Commander par ordonnance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 22, 219, 101), // Custom background color
                minimumSize: Size(200, 100), // Custom button size
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MedicamentCommand()));
              },
              child: Text(
                'Commander par la liste des médicaments',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 22, 219, 101), // Custom background color
                minimumSize: Size(200, 100), // Custom button size
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListCommand()));
              },
              child: Text(
                'Voir la liste des commandes précédentes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
