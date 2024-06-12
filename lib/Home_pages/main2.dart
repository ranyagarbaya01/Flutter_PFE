import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
   storeOnvording()async{
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
        child: 
          Column(
            children: [
              SizedBox(height: 40,),
              Align(alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {
                storeOnvording();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen() ));
              },
              child: Text("Passer",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),),
              ),
              ),
              SizedBox(height:5,),
              Padding(padding:EdgeInsets.all(30),child: Image.asset("images/pharmacie2.png"),),
              SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.only(left: 4,right: 4),
                child: Text("Vos médicaments où vous êtes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  wordSpacing: 2
                ),),
              ),
              SizedBox(height: 20,width: 20,),
              Padding(padding: const EdgeInsets.only( left: 20, right: 10),child: 
                Text("Votre bien-être est notre priorité, c'est pourquoi nous livrons vos médicaments directement à votre porte pour un accès facile et sécurisé aux soins de santé.",
              style: TextStyle(
                color: Color.fromARGB(255, 87, 85, 85),
                fontSize: 20,
              ),)),
            
              
            ],
          ),
        
      ),
    );
  }
}