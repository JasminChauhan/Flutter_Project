// import 'package:flutter/material.dart';
// import 'AddUser.dart';
// import 'UserDetails.dart';
//
//
// class Userlist extends StatefulWidget {
//   final List<Map<String, dynamic>> userDetailsList;
//   final List<Map<String, dynamic>> favoriteUsers;
//   final Function(List<Map<String, dynamic>>) onFavoriteUpdate;
//
//   const Userlist({
//     super.key,
//     required this.userDetailsList,
//     required this.favoriteUsers,
//     required this.onFavoriteUpdate,
//   });
//
//   @override
//   _UserlistState createState() => _UserlistState();
// }
//
// class _UserlistState extends State<Userlist> {
//   Set<Map<String, dynamic>> favoriteUserSet = {};
//   TextEditingController searchController = TextEditingController();
//   List<Map<String, dynamic>> filteredUsers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     favoriteUserSet = widget.favoriteUsers.toSet();
//     filteredUsers = widget.userDetailsList;
//   }
//
//   void toggleFavorite(Map<String, dynamic> user) {
//     setState(() {
//       if (favoriteUserSet.contains(user)) {
//         favoriteUserSet.remove(user);
//       } else {
//         favoriteUserSet.add(user);
//       }
//       widget.onFavoriteUpdate(favoriteUserSet.toList());
//     });
//   }
//
//   void _showDeleteConfirmationDialog(int index, Map<String, dynamic> user) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Delete User"),
//           content: const Text("Are you sure you want to delete this user?"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   widget.userDetailsList.removeAt(index);
//                   favoriteUserSet.remove(user);
//                   widget.onFavoriteUpdate(favoriteUserSet.toList());
//                   filteredUsers = List.from(widget.userDetailsList);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Delete", style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _filterUsers(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredUsers = widget.userDetailsList;
//       } else {
//         query = query.toLowerCase();
//         filteredUsers = widget.userDetailsList.where((user) {
//           return (user['name']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['email']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['mobile']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['age']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['city']?.toString().toLowerCase().contains(query) ?? false);
//         }).toList();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blueAccent.shade200, Colors.pinkAccent.shade200],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//             ),
//           ),
//         ),
//         title: const Text("User List"),
//         backgroundColor: Colors.tealAccent,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//             child: TextField(
//               autofocus: true,
//               controller: searchController,
//               onChanged: _filterUsers,
//               decoration: InputDecoration(
//                 hintText: "Search by Name, Email, Mobile, Age, City",
//                 prefixIcon: const Icon(Icons.search, color: Colors.cyan),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide(color: Colors.cyan.shade300),
//                 ),
//                 filled: true,
//                 fillColor: Colors.blueGrey.shade50,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredUsers.length,
//               itemBuilder: (context, index) {
//                 final user = filteredUsers[index];
//                 final isFavorite = favoriteUserSet.contains(user);
//
//                 return Card(
//                   elevation: 5,
//                   margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.all(15),
//                     title: Text(
//                       user['name'],
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     subtitle: Text(
//                       "${user['email']} | ${user['mobile']}",
//                       style: TextStyle(color: Colors.grey.shade700),
//                     ),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             isFavorite ? Icons.favorite : Icons.favorite_border,
//                             color: isFavorite ? Colors.red : null,
//                           ),
//                           onPressed: () => toggleFavorite(user),
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.edit),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Adduser(
//                                   isEdit: true,
//                                   userIndex: index,
//                                   userData: user,
//                                   userDetailsList: widget.userDetailsList,
//                                 ),
//                               ),
//                             ).then((value) {
//                               if (value == true) setState(() {});
//                             });
//                           },
//                         ),
//                         IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () =>
//                               _showDeleteConfirmationDialog(index, user),
//                         ),
//                       ],
//                     ),
//                     onTap: () async {
//                       final result = await Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UserDetails(
//                             user: user,
//                             onUserUpdated: (updatedUser) {
//                               setState(() {
//                                 widget.userDetailsList[index] = updatedUser;
//                                 filteredUsers[index] = updatedUser;
//                               });
//                             },
//                             onDelete: () {
//                               setState(() {
//                                 widget.userDetailsList.removeAt(index);
//                                 filteredUsers.removeAt(index);
//                               });
//                               Navigator.pop(context);
//                             },
//                             isFavorite: favoriteUserSet.contains(user),
//                             onFavoriteToggle: () => toggleFavorite(user),
//                           ),
//                         ),
//                       );
//
//                       if (result != null && result is Map<String, dynamic>) {
//                         setState(() {
//                           widget.userDetailsList[index] = result;
//                           filteredUsers[index] = result;
//                         });
//                       }
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import '../Database/database_helper.dart';
import 'AddUser.dart';
import 'UserDetails.dart';

class Userlist extends StatefulWidget {
  final List<Map<String, dynamic>> userDetailsList;
  final List<Map<String, dynamic>> favoriteUsers;
  final Function(List<Map<String, dynamic>>) onFavoriteUpdate;

  const Userlist({
    super.key,
    required this.userDetailsList,
    required this.favoriteUsers,
    required this.onFavoriteUpdate,
  });

  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  Set<Map<String, dynamic>> favoriteUserSet = {};
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    // favoriteUserSet = widget.favoriteUsers.toSet();
    // filteredUsers = widget.userDetailsList;
    _loadUsers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUsers();
  }

  // Future<void> _loadUsers() async {
  //   final users = await DatabaseHelper.instance.getAllUsers();
  //   final favUsers = await DatabaseHelper.instance.getFavoriteUsers();
  //
  //   setState(() {
  //     filteredUsers = users;
  //     favoriteUserSet = favUsers.toSet();
  //   });
  // }
  Future<void> _loadUsers() async {
    final users = await DatabaseHelper.instance.getAllUsers();
    final favUsers = await DatabaseHelper.instance.getFavoriteUsers();

    if (mounted) {
      setState(() {
        filteredUsers = users;
        favoriteUserSet = favUsers.toSet();
      });
    }
  }

  // void toggleFavorite(Map<String, dynamic> user) {
  //   setState(() {
  //     if (favoriteUserSet.contains(user)) {
  //       favoriteUserSet.remove(user);
  //     } else {
  //       favoriteUserSet.add(user);
  //     }
  //     widget.onFavoriteUpdate(favoriteUserSet.toList());
  //   });
  // }
  void toggleFavorite(Map<String, dynamic> user) async {
    final isFavorite = !favoriteUserSet.contains(user);
    await DatabaseHelper.instance.toggleFavorite(user['id'], isFavorite);

    setState(() {
      if (isFavorite) {
        favoriteUserSet.add(user);
      } else {
        favoriteUserSet.remove(user);
      }
    });
  }

  // void _showDeleteConfirmationDialog(int index, Map<String, dynamic> user) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //         title: const Text("Delete User"),
  //         content: const Text("Are you sure you want to delete this user?"),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text("Cancel"),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 widget.userDetailsList.removeAt(index);
  //                 favoriteUserSet.remove(user);
  //                 widget.onFavoriteUpdate(favoriteUserSet.toList());
  //                 filteredUsers = List.from(widget.userDetailsList);
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text("Delete", style: TextStyle(color: Colors.red)),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void _showDeleteConfirmationDialog(int index, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Delete User"),
          content: const Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.instance
                    .deleteUser(user['id']); // Delete from DB
                _loadUsers(); // Refresh list
                Navigator.of(context).pop();
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUsers = widget.userDetailsList;
      } else {
        query = query.toLowerCase();
        filteredUsers = widget.userDetailsList.where((user) {
          return (user['name']?.toString().toLowerCase().contains(query) ??
                  false) ||
              (user['email']?.toString().toLowerCase().contains(query) ??
                  false) ||
              (user['mobile']?.toString().toLowerCase().contains(query) ??
                  false) ||
              (user['age']?.toString().toLowerCase().contains(query) ??
                  false) ||
              (user['city']?.toString().toLowerCase().contains(query) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF6A1B9A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Search Results",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {}, // Add filter functionality if needed
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF6A1B9A),
            child: TextField(
              controller: searchController,
              onChanged: _filterUsers,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                hintText: "Search profiles...",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                final isFavorite = favoriteUserSet.contains(user);

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: InkWell(
                    // onTap: () async {
                    //   final result = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => UserDetails(
                    //         user: user,
                    //         onUserUpdated: (updatedUser) {
                    //           setState(() {
                    //             widget.userDetailsList[index] = updatedUser;
                    //             filteredUsers[index] = updatedUser;
                    //           });
                    //         },
                    //         onDelete: () {
                    //           setState(() {
                    //             widget.userDetailsList.removeAt(index);
                    //             filteredUsers.removeAt(index);
                    //           });
                    //           Navigator.pop(context);
                    //         },
                    //         isFavorite: favoriteUserSet.contains(user),
                    //         onFavoriteToggle: () => toggleFavorite(user),
                    //       ),
                    //     ),
                    //   );
                    //
                    //   if (result != null && result is Map<String, dynamic>) {
                    //     setState(() {
                    //       widget.userDetailsList[index] = result;
                    //       filteredUsers[index] = result;
                    //     });
                    //   }
                    // },
                    // onTap: () async {
                    //   final result = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => UserDetails(
                    //         user: user,
                    //         onUserUpdated: (updatedUser) async {
                    //           await DatabaseHelper.instance.updateUser(updatedUser, user['id']);
                    //           _loadUsers(); // Reload users from database
                    //         },
                    //         onDelete: () async {
                    //           await DatabaseHelper.instance.deleteUser(user['id']);
                    //           _loadUsers(); // Reload users after deletion
                    //           Navigator.pop(context);
                    //         },
                    //         isFavorite: favoriteUserSet.contains(user),
                    //         onFavoriteToggle: () => toggleFavorite(user),
                    //       ),
                    //     ),
                    //   );
                    //
                    //   if (result != null && result is Map<String, dynamic>) {
                    //     _loadUsers(); // Reload users if updated
                    //   }
                    // },
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(
                            user: user,
                            onUserUpdated: (updatedUser) async {
                              await DatabaseHelper.instance
                                  .updateUser(updatedUser, user['id']);
                              _loadUsers(); // Reload users from database
                            },
                            onDelete: () async {
                              await DatabaseHelper.instance
                                  .deleteUser(user['id']);
                              _loadUsers(); // Reload users after deletion
                              Navigator.pop(context);
                            },
                            isFavorite: favoriteUserSet.contains(user),
                            onFavoriteToggle: () => toggleFavorite(user),
                          ),
                        ),
                      );

                      if (result == true) {
                        _loadUsers(); // Reload if changes were made
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey[200],
                            child: Icon(Icons.person,
                                size: 40, color: Colors.grey[400]),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "${user['age']} years • ${user['city']}",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  user['email'],
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey[400],
                                ),
                                onPressed: () => toggleFavorite(user),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.grey[400]),
                                // onPressed: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => Adduser(
                                //         isEdit: true,
                                //         userIndex: user['id'], // Pass the user's ID here
                                //         userData: Map<String, dynamic>.from(user),
                                //         userDetailsList: filteredUsers,
                                //       ),
                                //     ),
                                //   ).then((value) {
                                //     if (value == true) _loadUsers();
                                //   });
                                // },
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Adduser(
                                        isEdit: true,
                                        userIndex: user['id'],
                                        userData:
                                            Map<String, dynamic>.from(user),
                                        userDetailsList: filteredUsers,
                                      ),
                                    ),
                                  ).then((value) {
                                    if (value == true) {
                                      _loadUsers(); // Reload after editing
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.delete, color: Colors.red[300]),
                                onPressed: () =>
                                    _showDeleteConfirmationDialog(index, user),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
