import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Livreur/model/livreur_model.dart';
import 'package:pharmacy_app/Patient/components/rounded_button.dart';
import 'package:pharmacy_app/Patient/components/rounded_input_password.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:pharmacy_app/livreur/controller/signin_controller.dart';
import 'package:pharmacy_app/livreur/controller/signup_controller.dart';
import 'package:pharmacy_app/livreur/view/signin_view.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nomutilisateurController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _numTelController = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();
  RegistrationLivreurController registerController =
      Get.put(RegistrationLivreurController());
  SignInController signInController = Get.put(SignInController());

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une adresse e-mail valide';
    } else if (!value.contains('@')) {
      return 'L\'adresse e-mail doit contenir un @';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vous devez entrer un mot de passe valide';
    } else if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un chiffre';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer un numéro de téléphone valide';
    } else if (value.length != 8) {
      return 'Le numéro de téléphone doit contenir 8 chiffres';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Le numéro de téléphone doit contenir uniquement des chiffres';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey2.currentState!.validate()) {
      // Create a User object with the entered username and isActive value
      User user = User(
        username: _nomutilisateurController.text,
        password: _passwordController.text,
        isActive: true, // Assuming email is used as username
      );

      registerController.register(
        user,
        _nomController.text,
        _prenomController.text,
        int.parse(_numTelController.text),
        _emailController.text,
      );

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Inscription réussie!')),
      );

      // Navigate to the SignInPage
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInPage()));
    } else {
      // Show an error message if the form is not valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Veuillez corriger les erreurs dans le formulaire.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Bienvenue à PharmaEase",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset(
                  "images/signup_livreur.svg",
                  height: 350,
                ),
                SizedBox(
                  height: 5,
                ),
                Form(
                    key: _formKey2,
                    child: Column(children: [
                      RoundedPasswordInput(
                        icon: Icons.face_rounded,
                        hint: 'Nom utilisateur',
                        controller: _nomutilisateurController,
                      ),
                      RoundedPasswordInput(
                        icon: Icons.face_rounded,
                        hint: 'Nom',
                        controller: _nomController,
                      ),
                      RoundedPasswordInput(
                        icon: Icons.face_rounded,
                        hint: 'Prénom',
                        controller: _prenomController,
                      ),
                      RoundedPasswordInput(
                        icon: Icons.phone,
                        hint: 'Numéro de téléphone',
                        controller: _numTelController,
                        validator: validatePhoneNumber,
                      ),
                      RoundedPasswordInput(
                        icon: Icons.mail,
                        hint: 'E-mail',
                        controller: _emailController,
                        validator: validateEmail,
                      ),
                      RoundedPasswordInput(
                        hint: 'Mot de passe',
                        isObsecure: true,
                        controller: _passwordController,
                        icon: Icons.lock,
                        validator: validatePassword,
                      ),
                    ])),
                SizedBox(height: 10),
                RoundedButton(
                    title: "S'inscrire",
                    onPressed: _submitForm,
                    widget: signInController.isLoading.value == true
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : null),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
