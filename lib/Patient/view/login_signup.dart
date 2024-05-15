import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharmacy_app/Home_pages/home_screen.dart';
import 'package:pharmacy_app/Patient/components/rounded_button.dart';
import 'package:pharmacy_app/Patient/components/rounded_input_password.dart';
import 'package:pharmacy_app/Patient/controller/login_controller.dart';

import 'package:pharmacy_app/Patient/controller/sinup_controller.dart';
import 'package:pharmacy_app/Patient/model/patient_model.dart';
import 'package:pharmacy_app/Patient/view/how_command.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration = const Duration(milliseconds: 270);
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _adresseController = TextEditingController();
  TextEditingController _numTelController = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  RegistrationController registerController = Get.put(RegistrationController());

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    animationController =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    containerSize = Tween<double>(
            begin: size.height * 0.1, end: defaultRegisterSize)
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        /*appBar: AppBar(leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        )),*/
        body: Stack(
          children: [
            //cancel button
            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: size.width,
                  height: size.height * 0.1,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: isLogin
                        ? null
                        : () {
                            // returning null ti disable the button
                            animationController.reverse();
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                    icon: Icon(Icons.close),
                    color: const Color.fromARGB(255, 218, 216, 216),
                  ),
                ),
              ),
            ),

            //login Form

            AnimatedOpacity(
              opacity: isLogin ? 1.0 : 0.0,
              duration: animationDuration * 4,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
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
                          "images/login.svg",
                          height: 350,
                        ),

                        Form(
                            key: _formKey1,
                            child: Column(children: [
                              RoundedPasswordInput(
                                icon: Icons.mail,
                                hint: 'nom utilisateur',
                                controller: _usernameController,
                                errorMessage:
                                    'Vous devez entrer un nom utilisateur valide',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              // Affichez un message sous le champ de texte indiquant s'il est rempli ou non
                              RoundedPasswordInput(
                                hint: 'Mot de passe',
                                controller: _passwordController,
                                icon: Icons.lock,
                                isObsecure: true,
                                errorMessage:
                                    'Vous devez entrer un mot de passe valide',
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
                                    username: _usernameController.text,
                                    password: _passwordController.text,
                                    isActive:
                                        true, // Assuming email is used as username
                                  );
                                  await getToken();
                                  loginController.login(user, context);
                                }
                               
                              },
                              widget: loginController.isLoading.value == true
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : null),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //Register container
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                if (viewInset == 0 && isLogin) {
                  return buildRegisterContainer();
                } else if (!isLogin) {
                  return buildRegisterContainer();
                }
                //returning empty container to hide the widget
                return Container();
              },
            ),
            //Register Form
            AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration * 5,
              child: Visibility(
                visible: !isLogin,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      height: defaultLoginSize,
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
                              "images/login.svg",
                              height: 350,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Form(
                                key: _formKey2,
                                child: Column(children: [
                                  RoundedPasswordInput(
                                    icon: Icons.mail,
                                    hint: 'Nom d\'utilisateur',
                                    // Change the hint to Username
                                    controller:
                                        _usernameController, // Use _usernameController for username field
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
                                    icon: Icons.home_outlined,
                                    hint: 'Adresse',
                                    controller: _adresseController,
                                  ),
                                  RoundedPasswordInput(
                                    icon: Icons.phone,
                                    hint: 'Numéro de téléphone',
                                    controller: _numTelController,
                                  ),
                                  RoundedPasswordInput(
                                    icon: Icons.mail,
                                    hint: 'E-mail',
                                    controller: _emailController,
                                  ),
                                  RoundedPasswordInput(
                                    hint: 'Mot de passe',
                                    isObsecure: true,
                                    controller: _passwordController,
                                    icon: Icons.lock,
                                  ),
                                ])),
                            SizedBox(height: 10),
                            RoundedButton(
                                title: "S'inscrire",
                                onPressed: () {
                                  if (_formKey2.currentState!.validate()) {
                                    // Create a User object with the entered username and isActive value
                                    User user = User(
                                      username: _usernameController.text,
                                      password: _passwordController.text,
                                      // Assuming email is used as username
                                      isActive:
                                          true, // Set the isActive value as needed
                                    );
                                    registerController.register(
                                      user,
                                      _nomController.text,
                                      _prenomController.text,
                                      _adresseController.text,
                                      int.parse(_numTelController.text),
                                      _emailController.text,
                                    );

                                    // Si le formulaire est valide, affichez un message de réussite
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Inscription réussie!')),
                                    );
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                widget: loginController.isLoading.value == true
                                    ? SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : null),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(110), topRight: Radius.circular(100)),
          color: Color.fromARGB(255, 202, 202, 202),
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: !isLogin
              ? null
              : () {
                  setState(() {
                    animationController.forward();
                    isLogin = !isLogin;
                  });
                },
          child: isLogin
              ? Text(
                  "vous n'avez pas de compte? S'inscrire",
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                )
              : null,
        ),
      ),
    );
  }
}
