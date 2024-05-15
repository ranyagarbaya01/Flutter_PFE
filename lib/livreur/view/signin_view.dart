import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:pharmacy_app/Patient/components/rounded_button.dart';
import 'package:pharmacy_app/Patient/components/rounded_input_password.dart';
//import 'package:pharmacy_app/Patient/controller/login_controller.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:pharmacy_app/livreur/controller/signin_controller.dart';
import 'package:pharmacy_app/livreur/controller/signup_controller.dart';
import 'package:pharmacy_app/livreur/view/livraison_view.dart';
import 'package:pharmacy_app/livreur/view/signup_view.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _nomutilisateurController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bienvenue à PharmaEase",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SvgPicture.asset(
                "images/login_livreur.svg",
                height: 350,
              ),

              Form(
                  key: _formKey1,
                  child: Column(children: [
                    RoundedPasswordInput(
                      icon: Icons.mail,
                      hint: 'Nom utilisateur',
                      controller: _nomutilisateurController,
                      errorMessage: 'Vous devez entrer un e-mail valide',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    // Affichez un message sous le champ de texte indiquant s'il est rempli ou non
                    RoundedPasswordInput(
                      hint: 'Mot de passe',
                      controller: _passwordController,
                      icon: Icons.lock,
                      isObsecure: true,
                      errorMessage: 'Vous devez entrer un mot de passe valide',
                    ),
                  ])),

              // Affichez un message sous le champ de texte indiquant s'il est rempli ou non

              SizedBox(
                height: 10,
              ),

              Obx(
                () => RoundedButton(
                    title: 'Se connecter',
                    onPressed: () async {
                      if (_formKey1.currentState!.validate()) {
                        // Create a User object with the entered username and isActive value
                        User user = User(
                          username: _nomutilisateurController.text,
                          password: _passwordController.text,
                          isActive: true, // Assuming email is used as username
                        );

                        await getToken();
                        signInController.signin(user, context, 'livreur');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Connexion réussie!')),
                        );
                      }
                    },
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
              ),
              SizedBox(
                height: 5,
              ),
              RoundedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage())),
                title: 'Sinscrire',
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
