import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Post.dart';

class PostService {
  Future<void> changeLikeStateOnPost(String postId, String userId) async {
    final response = await http
        .put(Uri.parse('http://localhost:3000/posts/$postId/like/$userId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to change like state on post');
    }
  }

  Future<List<Post>> getPosts(String userId) async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/posts/$userId'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      return data.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception(
          'Failed to load posts. Status code: ${response.statusCode}. Response body: ${response.body}');
    }
  }
}
