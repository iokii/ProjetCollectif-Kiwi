import 'package:flutter/material.dart';
import 'global.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray,
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  // Create acc here.
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(lightGray),
                ),
                child: const Text("Send reset email")),
          ],
        ),
      ),
    );
  }
}
