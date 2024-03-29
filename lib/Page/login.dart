import 'package:flutter/material.dart';

import '../Models/global.dart';
import '../Services/UserService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

const loginText = "Log into $applicationName !";

class _LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 100.0,
                height: 100.0,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: const TextStyle(color: white),
                        hintText: "Username",
                        fillColor: lightGray,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )))),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: white),
                      hintText: "Password",
                      fillColor: lightGray,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username and password cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    var result = await userService.loginIntoAccount(
                        usernameController.text,
                        passwordController.text,
                        context);

                    if (result['success']) {
                      Navigator.pushNamed(context, '/homepage');
                    } else {
                      // Show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result['message']),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(lightGray),
                ),
                child: const Text(loginText)),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/create_account');
                    },
                    child: const Text(
                      "Don't have an account?",
                      style: TextStyle(color: linkColor),
                    ))),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/password_reset');
                    },
                    child: const Text(
                      "Forgot your password?",
                      style: TextStyle(color: linkColor),
                    ))),
          ],
        ),
      ),
    );
  }
}
