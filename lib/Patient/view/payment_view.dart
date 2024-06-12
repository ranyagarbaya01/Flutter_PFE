import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  TextEditingController _cardNumberController =
      TextEditingController(text: '1234567812345678');
  TextEditingController _pinController = TextEditingController(text: '1234');
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un numéro de carte valide';
    } else if (value.length != 16) {
      return 'Le numéro de carte doit contenir 16 chiffres';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Le numéro de carte doit contenir uniquement des chiffres';
    }
    return null;
  }

  String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un code confidentiel';
    } else if (value.length != 4) {
      return 'Le code confidentiel doit contenir 4 chiffres';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Le code confidentiel doit contenir uniquement des chiffres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Méthode de paiement'),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: _type == 1
                            ? Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 22, 219, 101))
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor:
                                        Color.fromARGB(255, 22, 219, 101),
                                  ),
                                  Text('Paiement par Visa',
                                      style: _type == 1
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                ],
                              ),
                              SvgPicture.asset(
                                'images/Visa_logo.svg',
                                width: 60,
                                height: 10,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: _type == 2
                            ? Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 22, 219, 101))
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor:
                                        Color.fromARGB(255, 22, 219, 101),
                                  ),
                                  Text('Paiement par e-Dinar',
                                      style: _type == 2
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                ],
                              ),
                              Image.asset(
                                'images/e-dinar.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: _type == 3
                            ? Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 22, 219, 101))
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor:
                                        Color.fromARGB(255, 22, 219, 101),
                                  ),
                                  Text('Paiement par MasterCard',
                                      style: _type == 3
                                          ? TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)
                                          : TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey)),
                                ],
                              ),
                              Image.asset(
                                'images/Mastercard_logo.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: _type == 3
                            ? Border.all(width: 1, color: Colors.grey)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: TextFormField(
                        controller: _cardNumberController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.credit_card,
                            ),
                            hintText: 'Numéro de la carte',
                            border: InputBorder.none),
                        validator: validateCardNumber,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      height: 55,
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: _type == 3
                            ? Border.all(width: 1, color: Colors.grey)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: TextFormField(
                        controller: _pinController,
                        cursorColor: Colors.black,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Code confidentiel (4 chiffres)',
                            border: InputBorder.none),
                        validator: validatePin,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 220, // Set your desired width here
                      height: 60, // Set your desired height here
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 22, 219, 101),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Afficher l'alerte de paiement validé
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Paiement Validé'),
                                  content: Text(
                                      'Votre paiement a été effectué avec succès.'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HowCommand()));
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Payer',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pharmacy_app/Home_pages/home_screen.dart';
// import 'package:pharmacy_app/Patient/view/how_command.dart';

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   int _type = 1;
//   void _handleRadio(Object? e) => setState(() {
//         _type = e as int;
//       });

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Méthode de paiement'),
//         leading: BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     width: size.width,
//                     height: 55,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       border: _type == 1
//                           ? Border.all(
//                               width: 1,
//                               color: Color.fromARGB(255, 22, 219, 101))
//                           : Border.all(width: 0.3, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.transparent,
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 20),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Radio(
//                                   value: 1,
//                                   groupValue: _type,
//                                   onChanged: _handleRadio,
//                                   activeColor:
//                                       Color.fromARGB(255, 22, 219, 101),
//                                 ),
//                                 Text('Paiement par Visa',
//                                     style: _type == 1
//                                         ? TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black)
//                                         : TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.grey)),
//                               ],
//                             ),
//                             SvgPicture.asset(
//                               'images/Visa_logo.svg',
//                               width: 60,
//                               height: 10,
//                               fit: BoxFit.cover,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: size.width,
//                     height: 55,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       border: _type == 2
//                           ? Border.all(
//                               width: 1,
//                               color: Color.fromARGB(255, 22, 219, 101))
//                           : Border.all(width: 0.3, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.transparent,
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Radio(
//                                   value: 2,
//                                   groupValue: _type,
//                                   onChanged: _handleRadio,
//                                   activeColor:
//                                       Color.fromARGB(255, 22, 219, 101),
//                                 ),
//                                 Text('Paiement par e-Dinar',
//                                     style: _type == 2
//                                         ? TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black)
//                                         : TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.grey)),
//                               ],
//                             ),
//                             Image.asset(
//                               'images/e-dinar.png',
//                               width: 70,
//                               height: 70,
//                               fit: BoxFit.cover,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     width: size.width,
//                     height: 55,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       border: _type == 3
//                           ? Border.all(
//                               width: 1,
//                               color: Color.fromARGB(255, 22, 219, 101))
//                           : Border.all(width: 0.3, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.transparent,
//                     ),
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Radio(
//                                   value: 3,
//                                   groupValue: _type,
//                                   onChanged: _handleRadio,
//                                   activeColor:
//                                       Color.fromARGB(255, 22, 219, 101),
//                                 ),
//                                 Text('Paiement par MasterCard',
//                                     style: _type == 3
//                                         ? TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black)
//                                         : TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.grey)),
//                               ],
//                             ),
//                             Image.asset(
//                               'images/Mastercard_logo.png',
//                               width: 60,
//                               height: 60,
//                               fit: BoxFit.cover,
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                   ),
//                   Container(
//                     width: size.width,
//                     height: 55,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       border: _type == 3
//                           ? Border.all(width: 1, color: Colors.grey)
//                           : Border.all(width: 0.3, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.transparent,
//                     ),
//                     child: TextField(
//                       cursorColor: Colors.black,
//                       decoration: InputDecoration(
//                           icon: Icon(
//                             Icons.credit_card,
//                           ),
//                           hintText: 'Numéro de la carte',
//                           border: InputBorder.none),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: size.width,
//                     height: 55,
//                     margin: EdgeInsets.only(right: 20),
//                     decoration: BoxDecoration(
//                       border: _type == 3
//                           ? Border.all(width: 1, color: Colors.grey)
//                           : Border.all(width: 0.3, color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.transparent,
//                     ),
//                     child: TextField(
//                       cursorColor: Colors.black,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           icon: Icon(Icons.lock),
//                           hintText: 'Code confidentiel (4 chiffres)',
//                           border: InputBorder.none),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     width: 220, // Set your desired width here
//                     height: 60, // Set your desired height here
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                           Color.fromARGB(255, 22, 219, 101),
//                         ),
//                       ),
//                       onPressed: () => {
//                         // Afficher l'alerte de paiement validé
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text('Paiement Validé'),
//                               content: Text(
//                                   'Votre paiement a été effectué avec succès.'),
//                               actions: <Widget>[
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 HowCommand()));
//                                   },
//                                   child: Text('OK'),
//                                 ),
//                               ],
//                             );
//                           },
//                         )
//                       },
//                       child: Text(
//                         'Payer',
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
