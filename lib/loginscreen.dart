import 'package:flutter/material.dart';
import 'package:timer/home.dart';
import 'package:timer/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

@override
_LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController =  TextEditingController();

@override
  Widget build(BuildContext context) {
  // Champ pour l email
  final emailField = TextFormField(
    autofocus: false,
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    //validation
    onSaved: (value) {
        emailController.text = value!;
      },
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      prefixIcon:  const Icon(Icons.mail),
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: "Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ));


  // Champ pour le mot de passe
  final passwordField = TextFormField(
    autofocus: false,
    controller: passwordController,
    obscureText: true,
    //validation
    onSaved: (value)
    {
      passwordController.text = value!;
    },
    textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon:  const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mot de passe",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

  // Bouton se connecter
  final loginButton = Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(30),
    color: Colors.greenAccent,
    child: MaterialButton(
      padding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      },
      child: const Text(
        "Se connecter",
        textAlign: TextAlign.center,
        style: TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      )),
  );


return Scaffold(
  backgroundColor: Colors.white,
  body: Center(
    child: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child:  Padding(
          padding: const EdgeInsets.all(36.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Image.asset(
                'assets/logo.jpg',
                fit: BoxFit.contain,
              )),
            const SizedBox(height: 25),
            emailField,
            const SizedBox(height: 25),
            passwordField,
            const SizedBox(height: 25),
            loginButton,
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Vous n'avez pas de compte ? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                        const RegisterScreen()));
                  },
                  child: const Text(
                    "S'inscire ici",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                )
              ])
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

