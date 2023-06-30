import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Models/User.dart';
import '../Models/UserStored.dart';
import '../Provider/UserProvider.dart';

class UserService {
  Future<Map<String, dynamic>> createAccount(
      username, email, password, confirmPassword) async {
    final response = await http
        .post(Uri.parse('http://localhost:3000/createAccount'), body: {
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

  Future<Map<String, dynamic>> loginIntoAccount(
      username, password, BuildContext context) async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:3000/login/$username/$password'));

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        User newUserData = User.fromJson(responseBody['user']);
        UserStored userStored = UserStored.fromUser(newUserData);
        Provider.of<UserProvider>(context, listen: false).setUser(userStored);
        return {'success': true, 'message': responseBody['message']};
      } else {
        return {'success': false, 'message': responseBody['message']};
      }
    } catch (error) {
      print(error);
      return {'success': false, 'message': 'Impossible de se connecter'};
    }
  }

  Future<Map<String, dynamic>> getUser(String userId) async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/user/$userId'));

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        User newUserData = User.fromJson(responseBody['user']);

        var result = {'success': true, 'user': newUserData};

        return result;
      } else {
        return {'success': false, 'message': responseBody['message']};
      }
    } catch (error) {
      print(error);
      return {'success': false, 'message': 'Impossible to retrieve user data'};
    }
  }
}
