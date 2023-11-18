import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Model.dart';


class ApiService {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Iterable<dynamic> data = json.decode(response.body);
        List<User> users = data.map((json) => User.fromJson(json)).toList();
        return users;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
