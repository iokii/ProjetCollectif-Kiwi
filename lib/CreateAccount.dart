import 'dart:convert';

import 'package:flutter/material.dart';
import 'global.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> createAccount(
    username, email, password, confirmPassword) async {
  final response =
      await http.post(Uri.parse('http://localhost:3000/createAccount'), body: {
    'username': username,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword
  });

  Map<String, dynamic> responseBody = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return {'success': true, 'message': responseBody['message']};
  } else {
    return {'success': false, 'message': responseBody['error']};
  }
}

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final secondPasswordController = TextEditingController();

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
                var result = await createAccount(
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
