import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "https://66f6b28a436827ced9781995.mockapi.io/Users";

  // Fetch all users
  Future<List<dynamic>> getUsers() async {
    final res = await http.get(Uri.parse(baseUrl));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to get data');
    }
  }

  // Add a new user with all fields
  Future<void> addUser(Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData), // Directly encoding userData
      );

      if (response.statusCode == 201) {
        print(" User added successfully: ${response.body}");
      } else {
        print(" Failed to add user: ${response.body}");
        throw Exception('Error: ${response.body}');
      }
    } catch (error) {
      print("API Error: $error");
      rethrow;
    }
  }


  // Update an existing user with all fields
  Future<void> updateUser(int id, Map<String, dynamic> userData) async {
    try {
      final res = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'name': userData['name'],
          'email': userData['email'],
          'mobile': userData['mobile'],
          'dob': userData['dob'],
          'city': userData['city'],
          'gender': userData['gender'],
          'hobbies': userData['hobbies'],
          'password': userData['password'],
          'isFavourite': userData['isFavourite']
        }),
      );

      if (res.statusCode != 200) {
        throw Exception('Failed to update data: ${res.statusCode}');
      }
    } catch (error) {
      print("Error updating user: $error");
      rethrow; // Rethrow to handle in UI
    }
  }

  // Delete a user
  Future<void> deleteUser(int id) async {
    try {
      final res = await http.delete(Uri.parse('$baseUrl/$id'));

      if (res.statusCode != 200) {
        throw Exception('Failed to delete data: ${res.statusCode}');
      }
    } catch (error) {
      print("Error deleting user: $error");
      rethrow; // Rethrow to handle in UI
    }
  }

  Future<List<dynamic>> getFavoriteUsers() async {
    final allUsers = await getUsers();
    return allUsers.where((user) => user['isFavourite'] == 1).toList();
  }

}