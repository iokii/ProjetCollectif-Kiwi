import 'package:flutter/material.dart';
import 'global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

const loginText = "Log into $applicationName !";

class _LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                        labelStyle: const TextStyle(color: Colors.white),
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
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: "Password",
                      fillColor: lightGray,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home_page');
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
