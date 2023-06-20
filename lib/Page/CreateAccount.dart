// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

import '../Models/global.dart';
import '../Services/UserService.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.white),
                        hintText: "Email",
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
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: TextField(
                  controller: secondPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirm password",
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: "Confirm password",
                      fillColor: lightGray,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                var result = await userService.createAccount(
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    secondPasswordController.text);

                if (result['success']) {
                  // Navigate to a different page or show a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(result['message']),
                        backgroundColor: Colors.green),
                  );
                  Navigator.pushNamed(context, '/');
                } else {
                  // Show an error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(result['message']),
                        backgroundColor: Colors.red),
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(lightGray),
              ),
              child: const Text("Create account"),
            ),
          ],
        ),
      ),
    );
  }
}
