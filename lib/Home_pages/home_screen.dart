// import 'package:flutter/material.dart';
// import 'package:pharmacy_app/Home_pages/homepage.dart';
// import 'package:pharmacy_app/Patient/view/login_signup.dart';
// import 'package:pharmacy_app/livreur/view/livraison_view.dart';
// import 'package:pharmacy_app/livreur/view/signin_view.dart';
// import 'package:pharmacy_app/pharmacien/view/pharmacien_view.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final containerSize = screenWidth * 0.3; // Adjust the size factor as needed

//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           },
//         ),
//       ),
//       body: Container(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Bienvenue à PharmaEase",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 27,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1,
//                       wordSpacing: 2),
//                 ),
//                 SizedBox(
//                     height: 80), // Add some space between the text and the rows
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LoginPage()));
//                       },
//                       child: Container(
//                         child: Center(
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset('images/patient.png',
//                                     width: 60, height: 60),
//                                 Text("Patient",
//                                     style: TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       letterSpacing: 1,
//                                     )),
//                               ]),
//                         ),
//                         width: containerSize,
//                         height: containerSize,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 22, 219, 101),
//                           border: Border.all(),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => DemandPharmacie()));
//                       },
//                       child: Container(
//                         child: Center(
//                           child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset('images/pharmacy.png',
//                                     width: 60, height: 60),
//                                 Text("Pharmacien",
//                                     style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       letterSpacing: 1,
//                                     )),
//                               ]),
//                         ),
//                         width: containerSize,
//                         height: containerSize,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 22, 219, 101),
//                           border: Border.all(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20), // Add some space between the rows
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => SignInPage()));
//                   },
//                   child: Container(
//                     child: Center(
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('images/fast-delivery.png',
//                                 width: 60, height: 60),
//                             Text("Livreur",
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   letterSpacing: 1,
//                                 )),
//                           ]),
//                     ),
//                     width: containerSize,
//                     height: containerSize,
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 22, 219, 101),
//                       border: Border.all(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:pharmacy_app/Home_pages/homepage.dart';
import 'package:pharmacy_app/Patient/view/login_signup.dart';
import 'package:pharmacy_app/livreur/view/livraison_view.dart';
import 'package:pharmacy_app/livreur/view/signin_view.dart';
import 'package:pharmacy_app/pharmacien/view/pharmacien_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenue à PharmaEase",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    wordSpacing: 2),
              ),
              SizedBox(
                  height: 80), // Add some space between the text and the rows
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/patient.png',
                                  width: 60, height: 60),
                              Text("Patient",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  )),
                            ]),
                      ),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 219, 101),
                        border: Border.all(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DemandPharmacie()));
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/pharmacy.png',
                                  width: 60, height: 60),
                              Text("Pharmacien",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  )),
                            ]),
                      ),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 22, 219, 101),
                        border: Border.all(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Add some space between the rows
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Container(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/fast-delivery.png',
                              width: 60, height: 60),
                          Text("Livreur",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1,
                              )),
                        ]),
                  ),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 22, 219, 101),
                    border: Border.all(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
