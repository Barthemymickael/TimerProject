import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

@override
_LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
      prefixIcon:  Icon(Icons.mail),
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
        prefixIcon:  Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mot de passe",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ));

  // Bouton se connecter
  final loginButton = Material(
    elevation: 5,
    borderRadius: BorderRadius.circular(30),
    color: Colors.redAccent,
    child: MaterialButton(
      padding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () {},
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
                "assets/logo.jpg",
                fit: BoxFit.contain,
              )),
            emailField,
            passwordField,
            loginButton
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

