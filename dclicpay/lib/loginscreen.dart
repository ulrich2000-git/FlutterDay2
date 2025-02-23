import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 100, color: Colors.blue),
                  SizedBox(height: 20),
                  Text(
                    "Connexion",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your mail";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return "Invalide email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Your password must have at least 6 caracters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text("Connecte"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Ajouter une navigation vers une page de récupération de mot de passe
                    },
                    child: Text("Password forgotten ?"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
