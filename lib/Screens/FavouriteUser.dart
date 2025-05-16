import 'package:flutter/material.dart';
import '../ApiService/api_service.dart';
import 'UserDetails.dart';

class FavouriteUser extends StatefulWidget {
  final List<Map<String, dynamic>> favoriteUsers;
  final Function(List<Map<String, dynamic>>) onFavoriteUpdate;

  const FavouriteUser({
    super.key,
    required this.favoriteUsers,
    required this.onFavoriteUpdate,
  });

  @override
  _FavouriteUserState createState() => _FavouriteUserState();
}

class _FavouriteUserState extends State<FavouriteUser> {
  List<Map<String, dynamic>> favoriteUsers = [];

  @override
  void initState() {
    super.initState();
    favoriteUsers = List.from(widget.favoriteUsers);
    _loadFavoriteUsers();
  }

  Future<void> _loadFavoriteUsers() async {
    try {
      final apiService = ApiService();
      final users = await apiService.getFavoriteUsers();
      if (mounted) {
        setState(() {
          favoriteUsers = users.map((user) => Map<String, dynamic>.from(user)).toList();
        });
        widget.onFavoriteUpdate(favoriteUsers); // Notify parent
      }
    } catch (e) {
      print("Error loading favorite users: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load favorite users: $e")),
        );
      }
    }
  }

  Future<void> _toggleFavorite(int userId) async {
    final apiService = ApiService();
    final userIndex = favoriteUsers.indexWhere((user) => user['id'] == userId.toString());
    if (userIndex == -1) return;

    final user = favoriteUsers[userIndex];
    final updatedFavorite = user['isFavourite'] == 1 ? 0 : 1;

    try {
      await apiService.updateUser(
        userId,
        {...user, 'isFavourite': updatedFavorite},
      );
      if (mounted) {
        setState(() {
          if (updatedFavorite == 0) {
            favoriteUsers.removeAt(userIndex);
          } else {
            favoriteUsers[userIndex]['isFavourite'] = updatedFavorite;
          }
        });
        widget.onFavoriteUpdate(favoriteUsers); // Notify parent of updated favorites
        Navigator.pop(context, true); // Signal to refresh
      }
    } catch (e) {
      print("Error toggling favorite: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update favorite: $e")),
        );
      }
    }
  }

  void _navigateToUserDetails(Map<String, dynamic> user) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetails(
          user: user,
          onUserUpdated: (updatedUser) async {
            await ApiService().updateUser(int.parse(user['id'].toString()), updatedUser);
            _loadFavoriteUsers();
            widget.onFavoriteUpdate(favoriteUsers); // Notify parent after update
          },
          onDelete: () async {
            await ApiService().deleteUser(int.parse(user['id'].toString()));
            _loadFavoriteUsers();
            widget.onFavoriteUpdate(favoriteUsers); // Notify parent after delete
            Navigator.pop(context);
          },
          isFavorite: user['isFavourite'] == 1,
          onFavoriteToggle: () => _toggleFavorite(int.parse(user['id'])),
        ),
      ),
    );
    if (result == true) {
      _loadFavoriteUsers();
      widget.onFavoriteUpdate(favoriteUsers); // Notify parent after any change
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "Favourite Users",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: favoriteUsers.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Color(0xFF8E24AA)),
            SizedBox(height: 16),
            Text(
              "No Favorite Users Yet",
              style: TextStyle(fontSize: 20, color: Color(0xFF6A1B9A), fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: favoriteUsers.length,
        itemBuilder: (context, index) {
          final user = favoriteUsers[index];
          return GestureDetector(
            onTap: () => _navigateToUserDetails(user),
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFFE1BEE7).withOpacity(0.3)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFE1BEE7),
                  child: Text(
                    user['name']?[0].toUpperCase() ?? 'U',
                    style: TextStyle(color: Color(0xFF6A1B9A), fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  user['name'] ?? 'Unnamed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF4A148C)),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      user['email'] ?? 'No email',
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${user['city'] ?? 'Not specified'}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    user['isFavourite'] == 1 ? Icons.favorite : Icons.favorite_border,
                    color: user['isFavourite'] == 1 ? Color(0xFFE91E63) : Colors.grey,
                    size: 28,
                  ),
                  onPressed: () => _toggleFavorite(int.parse(user['id'].toString())),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}