import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Models/Profile.dart';
import 'package:provider/provider.dart';

import '../Models/User.dart';
import '../Models/UserStored.dart';
import '../Provider/UserProvider.dart';

class ProfileService {
  Future<Map<String, dynamic>> getProfile(String userId) async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/profile/$userId'));

      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Profile newUserData = Profile.fromJson(responseBody['profile']);

        var result = {'success': true, 'profile': newUserData};

        return result;
      } else {
        return {'success': false, 'message': responseBody['message']};
      }
    } catch (error) {
      return {'success': false, 'message': error};
    }
  }
}
