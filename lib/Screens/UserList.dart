// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:matrimony_project/ApiService/api_service.dart';
// import '../Database/database_helper.dart';
// import 'AddUser.dart';
// import 'UserDetails.dart';
//
// class Userlist extends StatefulWidget {
//   final List<Map<String, dynamic>> userDetailsList;
//   final List<Map<String, dynamic>> favoriteUsers;
//   final Function(List<Map<String, dynamic>>) onFavoriteUpdate;
//
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
//   List<Map<String, dynamic>> allUsers = [];
//   List<Map<String, dynamic>> filteredUsers = [];
//   String selectedSort = 'Name';
//   bool ascending = true;
//   List<dynamic> userList = [];
//   List<dynamic> searchUsers = [];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _loadUsers();
//   }
//
//   // Future<void> _loadUsers() async {
//   //   final users = await DatabaseHelper.instance.getAllUsers();
//   //   if (mounted) {
//   //     setState(() {
//   //       allUsers = users;
//   //       filteredUsers = users;
//   //       favoriteUserSet =
//   //           users.where((user) => user['isFavourite'] == 1).toSet();
//   //     });
//   //   }
//   // }
//   Future<void> _loadUsers() async {
//     try {
//       List<dynamic>? users = await ApiService().getUsers();
//       if (mounted) {
//         setState(() {
//           userList = users ?? [];
//           searchUsers = List.from(userList); // Copy for filtering
//         });
//       }
//     } catch (e) {
//       print("Error fetching users: $e");
//       if (mounted) {
//         setState(() {
//           userList = [];
//           searchUsers = [];
//         });
//       }
//     }
//   }
//
//
//   // void toggleFavorite(Map<String, dynamic> user) async {
//   //   final isFavorite = user['isFavourite'] != 1;
//   //   await DatabaseHelper.instance.toggleFavorite(user['id'], isFavorite);
//   //   setState(() {
//   //     user['isFavourite'] = isFavorite ? 1 : 0;
//   //     if (isFavorite) {
//   //       favoriteUserSet.add(user);
//   //     } else {
//   //       favoriteUserSet.remove(user);
//   //     }
//   //   });
//   // }
//   void toggleFavorite(Map<String, dynamic> user) {
//     setState(() {
//       user['isFavourite'] = (user['isFavourite'] == 1) ? 0 : 1;
//       _loadUsers(); // Optionally refresh from API if favorites are server-side
//     });
//   }
//
//
//   // void _showDeleteConfirmationDialog(Map<String, dynamic> user) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         shape:
//   //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//   //         title: const Text("Delete User"),
//   //         content: const Text("Are you sure you want to delete this user?"),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () => Navigator.of(context).pop(),
//   //             child: const Text("Cancel"),
//   //           ),
//   //           TextButton(
//   //             onPressed: () async {
//   //               await DatabaseHelper.instance.deleteUser(user['id']);
//   //               _loadUsers();
//   //               Navigator.of(context).pop();
//   //             },
//   //             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//   void _showDeleteConfirmationDialog(Map<String, dynamic> user) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           title: const Text("Delete User"),
//           content: const Text("Are you sure you want to delete this user?"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () async {
//                 try {
//                   await ApiService().deleteUser(int.parse(user['id'].toString()));
//                   _loadUsers(); // Refresh the list after deletion
//                   Navigator.of(context).pop();
//                 } catch (e) {
//                   print("Error deleting user: $e");
//                 }
//               },
//               child: const Text("Delete", style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   // void _filterUsers(String query) {
//   //   setState(() {
//   //     if (query.isEmpty) {
//   //       filteredUsers = allUsers;
//   //     } else {
//   //       query = query.toLowerCase();
//   //       filteredUsers = allUsers.where((user) {
//   //         return (user['name']?.toString().toLowerCase().contains(query) ??
//   //             false) ||
//   //             (user['email']?.toString().toLowerCase().contains(query) ??
//   //                 false) ||
//   //             (user['mobile']?.toString().toLowerCase().contains(query) ??
//   //                 false) ||
//   //             (user['city']?.toString().toLowerCase().contains(query) ?? false);
//   //       }).toList();
//   //     }
//   //     _sortUsers(selectedSort);
//   //   });
//   // }
//   void _filterUsers(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         searchUsers = List.from(userList);
//       } else {
//         query = query.toLowerCase();
//         searchUsers = userList.where((user) {
//           return (user['name']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['email']?.toString().toLowerCase().contains(query) ?? false);
//         }).toList();
//       }
//       _sortUsers(selectedSort);
//     });
//   }
//
//
//   int calculateAge(String dob) {
//     try {
//       DateTime birthDate = DateFormat('dd/MM/yyyy').parse(dob);
//       DateTime today = DateTime.now();
//       int age = today.year - birthDate.year;
//       if (today.month < birthDate.month ||
//           (today.month == birthDate.month && today.day < birthDate.day)) {
//         age--;
//       }
//       return age;
//     } catch (e) {
//       return 0;
//     }
//   }
//   // int calculateAge(String dob) {
//   //   try {
//   //     // Convert dob from String to DateTime
//   //     DateTime birthDate = DateTime.parse(dob);
//   //     DateTime today = DateTime.now();
//   //
//   //     int age = today.year - birthDate.year;
//   //     if (today.month < birthDate.month ||
//   //         (today.month == birthDate.month && today.day < birthDate.day)) {
//   //       age--; // Reduce age if birthday hasn't occurred yet this year
//   //     }
//   //     return age;
//   //   } catch (e) {
//   //     print("Error parsing date: $e");
//   //     return 0; // Return 0 if dob is invalid
//   //   }
//   // }
//
//   // void _sortUsers(String criteria) {
//   //   setState(() {
//   //     if (criteria == 'Name') {
//   //       filteredUsers.sort((a, b) => a['name'].compareTo(b['name']));
//   //     } else if (criteria == 'Age') {
//   //       filteredUsers.sort(
//   //               (a, b) => calculateAge(a['dob']).compareTo(calculateAge(b['dob'])));
//   //     } else if (criteria == 'City') {
//   //       filteredUsers.sort((a, b) => a['city'].compareTo(b['city']));
//   //     }
//   //     if (!ascending) {
//   //       filteredUsers = filteredUsers.reversed.toList();
//   //     }
//   //   });
//   // }
//   void _sortUsers(String criteria) {
//     setState(() {
//       if (criteria == 'Name') {
//         searchUsers.sort((a, b) => a['name'].compareTo(b['name']));
//       } else if (criteria == 'Age') {
//         searchUsers.sort((a, b) => calculateAge(a['dob']).compareTo(calculateAge(b['dob'])));
//       } else if (criteria == 'City') {
//         searchUsers.sort((a, b) => a['city'].compareTo(b['city']));
//       }
//       if (!ascending) {
//         searchUsers = searchUsers.reversed.toList();
//       }
//     });
//   }
//
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // Header is built within the body for a cute look.
// //       body: Container(
// //         decoration: BoxDecoration(
// //           // Background with a subtle pastel purple gradient.
// //           gradient: LinearGradient(
// //             colors: [Colors.purple[50]!, Colors.purple[100]!],
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //           ),
// //         ),
// //         child: Column(
// //           children: [
// //             // Cute header with curved bottom and search field.
// //             Container(
// //               width: double.infinity,
// //               padding: EdgeInsets.only(
// //                 top: MediaQuery.of(context).padding.top + 16,
// //                 left: 16,
// //                 right: 16,
// //                 bottom: 32,
// //               ),
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     Color(0xFF9C27B0),
// //                     Color(0xFFBA68C8),
// //                   ],
// //                   begin: Alignment.topCenter,
// //                   end: Alignment.bottomCenter,
// //                 ),
// //                 borderRadius: BorderRadius.vertical(
// //                   bottom: Radius.circular(30),
// //                 ),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Top row with back arrow, sorting options and sort order toggle.
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       IconButton(
// //                         icon:
// //                         const Icon(Icons.arrow_back, color: Colors.white),
// //                         onPressed: () => Navigator.pop(context),
// //                       ),
// //                       Row(
// //                         children: [
// //                           // Cute dropdown container
// //                           Container(
// //                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
// //                             decoration: BoxDecoration(
// //                               color: Colors.white.withOpacity(0.5),
// //                               borderRadius: BorderRadius.circular(20),
// //                             ),
// //                             child: DropdownButton<String>(
// //                               value: selectedSort,
// //                               dropdownColor: Colors.pinkAccent,
// //                               icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
// //                               underline: const SizedBox(),
// //                               style: const TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                               items: ['Name', 'Age', 'City'].map((value) {
// //                                 return DropdownMenuItem<String>(
// //                                   value: value,
// //                                   child: Text(value),
// //                                 );
// //                               }).toList(),
// //                               onChanged: (newValue) {
// //                                 if (newValue != null) {
// //                                   setState(() {
// //                                     selectedSort = newValue;
// //                                     _sortUsers(selectedSort);
// //                                   });
// //                                 }
// //                               },
// //                             ),
// //                           ),
// //                           const SizedBox(width: 8),
// //                           // Cute toggle sort order button container.
// //                           Container(
// //                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                             decoration: BoxDecoration(
// //                               color: Colors.white.withOpacity(0.5),
// //                               borderRadius: BorderRadius.circular(20),
// //                             ),
// //                             child: IconButton(
// //                               icon: Icon(
// //                                 ascending ? Icons.arrow_upward : Icons.arrow_downward,
// //                                 color: Colors.white,
// //                               ),
// //                               onPressed: () {
// //                                 setState(() {
// //                                   ascending = !ascending;
// //                                   _sortUsers(selectedSort);
// //                                 });
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16),
// //                   // Search field with cute rounded styling.
// //                   Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 8),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white.withOpacity(0.3),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     child: TextField(
// //                       controller: searchController,
// //                       onChanged: _filterUsers,
// //                       style: const TextStyle(color: Colors.white),
// //                       decoration: InputDecoration(
// //                         hintText: "Search profiles...",
// //                         hintStyle: const TextStyle(color: Colors.white70),
// //                         prefixIcon: const Icon(Icons.search,
// //                             color: Colors.white70),
// //                         border: InputBorder.none,
// //                         contentPadding: const EdgeInsets.symmetric(
// //                             horizontal: 20, vertical: 16),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // List of user cards.
// //             Expanded(
// //               child: ListView.builder(
// //
// //                 padding: const EdgeInsets.symmetric(vertical: 8),
// //                 itemCount: filteredUsers.length,
// //                 itemBuilder: (context, index) {
// //                   final user = filteredUsers[index];
// //                   final isFavorite = user['isFavourite'] == 1;
// //                   return Container(
// //                     margin: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 8),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(20),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.purple.withOpacity(0.1),
// //                           blurRadius: 10,
// //                           spreadRadius: 2,
// //                           offset: const Offset(0, 4),
// //                         ),
// //                       ],
// //                     ),
// //                     child: InkWell(
// //                       borderRadius: BorderRadius.circular(20),
// //                       onTap: () async {
// //                         final result = await Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => UserDetails(
// //                               user: user,
// //                               onUserUpdated: (updatedUser) async {
// //                                 await DatabaseHelper.instance
// //                                     .updateUser(updatedUser, user['id']);
// //                                 _loadUsers();
// //                               },
// //                               onDelete: () async {
// //                                 await DatabaseHelper.instance
// //                                     .deleteUser(user['id']);
// //                                 _loadUsers();
// //                                 Navigator.pop(context);
// //                               },
// //                               isFavorite: favoriteUserSet.contains(user),
// //                               onFavoriteToggle: () => toggleFavorite(user),
// //                             ),
// //                           ),
// //                         );
// //                         if (result == true) {
// //                           _loadUsers();
// //                         }
// //                       },
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16),
// //                         child: Row(
// //                           children: [
// //                             CircleAvatar(
// //                               radius: 35,
// //                               backgroundColor: Colors.purple[50],
// //                               child: Icon(Icons.person,
// //                                   size: 40, color: Colors.purple[300]),
// //                             ),
// //                             const SizedBox(width: 16),
// //                             Expanded(
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Container(
// //                                         padding: EdgeInsets.all(6),
// //                                         decoration: BoxDecoration(
// //                                           shape: BoxShape.circle,
// //                                           color: Colors.purpleAccent.withOpacity(0.2),
// //                                         ),
// //                                         child: Icon(
// //                                           Icons.person_rounded,
// //                                           color: Colors.purpleAccent,
// //                                           size: 18,
// //                                         ),
// //                                       ),
// //                                       SizedBox(width: 6),
// //                                       Expanded( // Prevents overflow
// //                                         child: Text(
// //
// //                                           user['name'],
// //                                           overflow: TextOverflow.ellipsis,
// //                                           maxLines: 1,
// //                                           style: const TextStyle(
// //                                             fontSize: 18,
// //                                             fontWeight: FontWeight.bold,
// //                                             fontFamily: 'Poppins',
// //                                             color: Colors.black87,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   const SizedBox(height: 8),
// //
// //                                   // Age Row
// //                                   Row(
// //                                     children: [
// //                                       Container(
// //                                         padding: EdgeInsets.all(6),
// //                                         decoration: BoxDecoration(
// //                                           shape: BoxShape.circle,
// //                                           color: Colors.pinkAccent.withOpacity(0.2),
// //                                         ),
// //                                         child: Icon(
// //                                           Icons.cake_rounded,
// //                                           color: Colors.pinkAccent,
// //                                           size: 18,
// //                                         ),
// //                                       ),
// //                                       SizedBox(width: 6),
// //                                       Expanded(
// //                                         child: Text(
// //                                           "${calculateAge(user['dob'])} years",
// //                                           overflow: TextOverflow.ellipsis,
// //                                           maxLines: 1,
// //                                           style: TextStyle(
// //                                             fontSize: 14,
// //                                             fontFamily: 'Comfortaa',
// //                                             color: Colors.grey[700],
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   const SizedBox(height: 8),
// //
// //                                   // Location Row
// //                                   Row(
// //                                     children: [
// //                                       Container(
// //                                         padding: EdgeInsets.all(6),
// //                                         decoration: BoxDecoration(
// //                                           shape: BoxShape.circle,
// //                                           color: Colors.blueAccent.withOpacity(0.2),
// //                                         ),
// //                                         child: Icon(
// //                                           Icons.location_city_rounded,
// //                                           color: Colors.blueAccent,
// //                                           size: 18,
// //                                         ),
// //                                       ),
// //                                       SizedBox(width: 6),
// //                                       Expanded(
// //                                         child: Text(
// //                                           "${user['city']}",
// //                                           overflow: TextOverflow.ellipsis,
// //                                           maxLines: 1,
// //                                           style: TextStyle(
// //                                             fontSize: 14,
// //                                             fontFamily: 'Comfortaa',
// //                                             color: Colors.grey[700],
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   const SizedBox(height: 8),
// //
// //                                   // Gender Row
// //                                   Row(
// //                                     children: [
// //                                       Container(
// //                                         padding: EdgeInsets.all(6),
// //                                         decoration: BoxDecoration(
// //                                           shape: BoxShape.circle,
// //                                           color: Colors.cyanAccent.withOpacity(0.2),
// //                                         ),
// //                                         child: Icon(
// //                                           user['gender'] == 'Male'
// //                                               ? Icons.male
// //                                               : user['gender'] == 'Female'
// //                                               ? Icons.female
// //                                               : Icons.transgender,
// //                                           color: Colors.cyanAccent,
// //                                           size: 18,
// //                                         ),
// //                                       ),
// //                                       SizedBox(width: 6),
// //                                       Expanded(
// //                                         child: Text(
// //                                           "${user['gender']}",
// //                                           overflow: TextOverflow.ellipsis,
// //                                           maxLines: 1,
// //                                           style: TextStyle(
// //                                             fontSize: 14,
// //                                             fontFamily: 'Comfortaa',
// //                                             color: Colors.grey[700],
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //
// //                             Column(
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 IconButton(
// //                                   icon: Icon(
// //                                     isFavorite
// //                                         ? Icons.favorite
// //                                         : Icons.favorite_border,
// //                                     color: isFavorite
// //                                         ? Colors.red
// //                                         : Colors.grey[400],
// //                                   ),
// //                                   onPressed: () => toggleFavorite(user),
// //                                 ),
// //                                 IconButton(
// //                                   icon:
// //                                   Icon(Icons.edit, color: Colors.grey[400]),
// //                                   onPressed: () {
// //                                     Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                         builder: (context) => Adduser(
// //                                           isEdit: true,
// //                                           userIndex: user['id'],
// //                                           userData: Map<String, dynamic>.from(user),
// //                                           userDetailsList: filteredUsers,
// //                                         ),
// //                                       ),
// //                                     ).then((value) {
// //                                       if (value == true) {
// //                                         _loadUsers();
// //                                       }
// //                                     });
// //                                   },
// //                                 ),
// //                                 IconButton(
// //                                   icon: Icon(Icons.delete,
// //                                       color: Colors.red[300]),
// //                                   onPressed: () =>
// //                                       _showDeleteConfirmationDialog(user),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple[50]!, Colors.purple[100]!],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             // Header remains unchanged
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top + 16,
//                 left: 16,
//                 right: 16,
//                 bottom: 32,
//               ),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: DropdownButton<String>(
//                               value: selectedSort,
//                               dropdownColor: Colors.pinkAccent,
//                               icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
//                               underline: const SizedBox(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               items: ['Name', 'Age', 'City'].map((value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 if (newValue != null) {
//                                   setState(() {
//                                     selectedSort = newValue;
//                                     _sortUsers(selectedSort);
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: IconButton(
//                               icon: Icon(
//                                 ascending ? Icons.arrow_upward : Icons.arrow_downward,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   ascending = !ascending;
//                                   _sortUsers(selectedSort);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextField(
//                       controller: searchController,
//                       onChanged: _filterUsers,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: "Search profiles...",
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         prefixIcon: const Icon(Icons.search, color: Colors.white70),
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Updated ListView.builder
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 itemCount: searchUsers.length,
//                 itemBuilder: (context, index) {
//                   final user = searchUsers[index];
//                   final isFavorite = user['isFavourite'] == 1; // Adjust if API doesn't return this
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.purple.withOpacity(0.1),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: () async {
//                         final result = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserDetails(
//                               user: user,
//                               onUserUpdated: (updatedUser) async {
//                                 await ApiService().updateUser(
//                                   int.parse(user['id'].toString()),
//                                   updatedUser['name'],
//                                   updatedUser['email'],
//                                 );
//                                 _loadUsers();
//                               },
//                               onDelete: () async {
//                                 await ApiService().deleteUser(int.parse(user['id'].toString()));
//                                 _loadUsers();
//                                 Navigator.pop(context);
//                               },
//                               isFavorite: isFavorite,
//                               onFavoriteToggle: () => toggleFavorite(user),
//                             ),
//                           ),
//                         );
//                         if (result == true) {
//                           _loadUsers();
//                         }
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 35,
//                               backgroundColor: Colors.purple[50],
//                               child: Icon(Icons.person, size: 40, color: Colors.purple[300]),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.purpleAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.person_rounded,
//                                           color: Colors.purpleAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           user['name'],
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: const TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: 'Poppins',
//                                             color: Colors.black87,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.pinkAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.cake_rounded,
//                                           color: Colors.pinkAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           "${calculateAge(user['dob'])} years",
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.blueAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.location_city_rounded,
//                                           color: Colors.blueAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           "${user['city']}",
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.cyanAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           user['gender'] == 'Male'
//                                               ? Icons.male
//                                               : user['gender'] == 'Female'
//                                               ? Icons.female
//                                               : Icons.transgender,
//                                           color: Colors.cyanAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           "${user['gender']}",
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                                     color: isFavorite ? Colors.red : Colors.grey[400],
//                                   ),
//                                   onPressed: () => toggleFavorite(user),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.edit, color: Colors.grey[400]),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Adduser(
//                                           isEdit: true,
//                                           userIndex: int.parse(user['id'].toString()),
//                                           userData: Map<String, dynamic>.from(user),
//                                           userDetailsList: searchUsers,
//                                         ),
//                                       ),
//                                     ).then((value) {
//                                       if (value == true) {
//                                         _loadUsers();
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete, color: Colors.red[300]),
//                                   onPressed: () => _showDeleteConfirmationDialog(user),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:matrimony_project/ApiService/api_service.dart'; // Ensure correct path
// import 'AddUser.dart';
// import 'UserDetails.dart';
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
//   TextEditingController searchController = TextEditingController();
//   List<dynamic> userList = []; // API-fetched users
//   List<dynamic> searchUsers = []; // Filtered users
//   String selectedSort = 'Name';
//   bool ascending = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadUsers();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _loadUsers();
//   }
//
//   // Future<void> _loadUsers() async {
//   //   try {
//   //     List<dynamic>? users = await ApiService().getUsers();
//   //     if (mounted) {
//   //       setState(() {
//   //         userList = users ?? [];
//   //         searchUsers = List.from(userList);
//   //         // Initialize isFavourite if not provided by API
//   //         for (var user in userList) {
//   //           user['isFavourite'] = user['isFavourite'] ?? 0; // Default to 0 if not present
//   //         }
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print("Error fetching users: $e");
//   //     if (mounted) {
//   //       setState(() {
//   //         userList = [];
//   //         searchUsers = [];
//   //       });
//   //     }
//   //   }
//   // }
//   Future<void> _loadUsers() async {
//     try {
//       List<dynamic>? users = await ApiService().getUsers();
//       if (mounted) {
//         setState(() {
//           userList = users ?? [];
//           searchUsers = List.from(userList);
//           // Sync isFavourite with favoriteUsers from the parent widget
//           for (var user in userList) {
//             user['isFavourite'] = widget.favoriteUsers
//                 .any((fav) => fav['id'] == user['id'])
//                 ? 1
//                 : 0;
//           }
//         });
//       }
//     } catch (e) {
//       print("Error fetching users: $e");
//       if (mounted) {
//         setState(() {
//           userList = [];
//           searchUsers = [];
//         });
//       }
//     }
//   }
//
//   void toggleFavorite(Map<String, dynamic> user) async {
//     setState(() {
//       // Toggle the isFavourite value
//       user['isFavourite'] = (user['isFavourite'] == 1) ? 0 : 1;
//
//       // Update the favoriteUsers list
//       List<Map<String, dynamic>> updatedFavorites = List.from(widget.favoriteUsers);
//       if (user['isFavourite'] == 1) {
//         if (!updatedFavorites.any((fav) => fav['id'] == user['id'])) {
//           updatedFavorites.add(Map<String, dynamic>.from(user));
//         }
//       } else {
//         updatedFavorites.removeWhere((fav) => fav['id'] == user['id']);
//       }
//
//       // Notify the parent widget of the updated favoriteUsers list
//       widget.onFavoriteUpdate(updatedFavorites);
//     });
//
//     // Persist the change to the API
//     try {
//       await ApiService().updateUser(
//         int.parse(user['id'].toString()),
//         {...user, 'isFavourite': user['isFavourite']},
//       );
//     } catch (e) {
//       print("Error updating favorite status: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to update favorite status: $e")),
//       );
//     }
//   }
//
//   void _showDeleteConfirmationDialog(Map<String, dynamic> user) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           title: const Text("Delete User"),
//           content: const Text("Are you sure you want to delete this user?"),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () async {
//                 try {
//                   await ApiService().deleteUser(int.parse(user['id'].toString()));
//                   _loadUsers(); // Refresh the list
//                   Navigator.of(context).pop();
//                 } catch (e) {
//                   print("Error deleting user: $e");
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Failed to delete user: $e")),
//                   );
//                 }
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
//         searchUsers = List.from(userList);
//       } else {
//         query = query.toLowerCase();
//         searchUsers = userList.where((user) {
//           return (user['name']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['email']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['mobile']?.toString().toLowerCase().contains(query) ?? false) ||
//               (user['city']?.toString().toLowerCase().contains(query) ?? false);
//         }).toList();
//       }
//       _sortUsers(selectedSort);
//     });
//   }
//
//   int calculateAge(String dob) {
//     try {
//       // Convert dob from String to DateTime
//       DateFormat format = DateFormat("dd/MM/yyyy");
//       DateTime birthDate = format.parse(dob);
//       DateTime today = DateTime.now();
//
//       int age = today.year - birthDate.year;
//       if (today.month < birthDate.month ||
//           (today.month == birthDate.month && today.day < birthDate.day)) {
//         age--; // Reduce age if birthday hasn't occurred yet this year
//       }
//       return age;
//     } catch (e) {
//       print("Error parsing date: $e");
//       return 0; // Return 0 if dob is invalid
//     }
//   }
//
//   void _sortUsers(String criteria) {
//     setState(() {
//       if (criteria == 'Name') {
//         searchUsers.sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));
//       } else if (criteria == 'Age') {
//         searchUsers.sort((a, b) =>
//             calculateAge(a['dob']).compareTo(calculateAge(b['dob'])));
//       } else if (criteria == 'City') {
//         searchUsers.sort((a, b) => (a['city'] ?? '').compareTo(b['city'] ?? ''));
//       }
//       if (!ascending) {
//         searchUsers = searchUsers.reversed.toList();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple[50]!, Colors.purple[100]!],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).padding.top + 16,
//                 left: 16,
//                 right: 16,
//                 bottom: 32,
//               ),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//                 borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: DropdownButton<String>(
//                               value: selectedSort,
//                               dropdownColor: Colors.pinkAccent,
//                               icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
//                               underline: const SizedBox(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               items: ['Name', 'Age', 'City'].map((value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 if (newValue != null) {
//                                   setState(() {
//                                     selectedSort = newValue;
//                                     _sortUsers(selectedSort);
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: IconButton(
//                               icon: Icon(
//                                 ascending ? Icons.arrow_upward : Icons.arrow_downward,
//                                 color: Colors.white,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   ascending = !ascending;
//                                   _sortUsers(selectedSort);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextField(
//                       controller: searchController,
//                       onChanged: _filterUsers,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         hintText: "Search profiles...",
//                         hintStyle: const TextStyle(color: Colors.white70),
//                         prefixIcon: const Icon(Icons.search, color: Colors.white70),
//                         border: InputBorder.none,
//                         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 itemCount: searchUsers.length,
//                 itemBuilder: (context, index) {
//                   final user = searchUsers[index];
//                   final isFavorite = user['isFavourite'] == 1;
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.purple.withOpacity(0.1),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(20),
//                       onTap: () async {
//                         final result = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UserDetails(
//                               user: user,
//                               onUserUpdated: (updatedUser) async {
//                                 await ApiService().updateUser(
//                                   int.parse(user['id'].toString()),
//                                   updatedUser,
//                                 );
//                                 _loadUsers();
//                               },
//                               onDelete: () async {
//                                 await ApiService().deleteUser(int.parse(user['id'].toString()));
//                                 _loadUsers();
//                                 Navigator.pop(context);
//                               },
//                               isFavorite: isFavorite,
//                               onFavoriteToggle: () => toggleFavorite(user),
//                             ),
//                           ),
//                         );
//                         if (result == true) {
//                           _loadUsers();
//                         }
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 35,
//                               backgroundColor: Colors.purple[50],
//                               child: Icon(Icons.person, size: 40, color: Colors.purple[300]),
//                             ),
//                             const SizedBox(width: 16),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.purpleAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.person_rounded,
//                                           color: Colors.purpleAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           user['name'] ?? 'Unnamed',
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: const TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: 'Poppins',
//                                             color: Colors.black87,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.pinkAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.cake_rounded,
//                                           color: Colors.pinkAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           "${calculateAge(user['dob'].toString())} years",
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.blueAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           Icons.location_city_rounded,
//                                           color: Colors.blueAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           user['city'] ?? 'Unknown',
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Row(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.all(6),
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.cyanAccent.withOpacity(0.2),
//                                         ),
//                                         child: Icon(
//                                           user['gender'] == 'Male'
//                                               ? Icons.male
//                                               : user['gender'] == 'Female'
//                                               ? Icons.female
//                                               : Icons.transgender,
//                                           color: Colors.cyanAccent,
//                                           size: 18,
//                                         ),
//                                       ),
//                                       SizedBox(width: 6),
//                                       Expanded(
//                                         child: Text(
//                                           user['gender'] ?? 'Not specified',
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             fontFamily: 'Comfortaa',
//                                             color: Colors.grey[700],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                                     color: isFavorite ? Colors.red : Colors.grey[400],
//                                   ),
//                                   onPressed: () => toggleFavorite(user),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.edit, color: Colors.grey[400]),
//                                   // onPressed: () {
//                                   //   Navigator.push(
//                                   //     context,
//                                   //     MaterialPageRoute(
//                                   //       builder: (context) => Adduser(
//                                   //         isEdit: true,
//                                   //         userIndex: int.parse(user['id'].toString()),
//                                   //         userData: Map<String, dynamic>.from(user),
//                                   //         userDetailsList: searchUsers.cast<Map<String, dynamic>>(),
//                                   //       ),
//                                   //     ),
//                                   //   ).then((value) {
//                                   //     if (value == true) {
//                                   //       _loadUsers();
//                                   //     }
//                                   //   });
//                                   // },
//                                   onPressed: () {
//                                     int userId = 0; // Default value to avoid assertion error
//
//                                     if (user['id'] != null) {
//                                       userId = int.tryParse(user['id'].toString()) ?? 0;
//                                     }
//
//                                     print("Navigating to edit with userIndex: $userId");
//
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Adduser(
//                                           isEdit: true,
//                                           userIndex: userId,
//                                           userData: Map<String, dynamic>.from(user),
//                                           userDetailsList: searchUsers.cast<Map<String, dynamic>>(),
//                                         ),
//                                       ),
//                                     ).then((value) {
//                                       if (value == true) {
//                                         _loadUsers();
//                                       }
//                                     });
//                                   },
//
//                                 ),
//                                 IconButton(
//                                   icon: Icon(Icons.delete, color: Colors.red[300]),
//                                   onPressed: () => _showDeleteConfirmationDialog(user),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:matrimony_project/ApiService/api_service.dart';
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
  TextEditingController searchController = TextEditingController();
  List<dynamic> userList = [];
  List<dynamic> searchUsers = [];
  String selectedSort = 'Name';
  bool ascending = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      List<dynamic>? users = await ApiService().getUsers();
      if (mounted) {
        setState(() {
          userList = users ?? [];
          searchUsers = List.from(userList);
          // Sync isFavourite with favoriteUsers from parent
          for (var user in userList) {
            user['isFavourite'] = widget.favoriteUsers.any((fav) => fav['id'] == user['id']) ? 1 : 0;
          }
        });
      }
    } catch (e) {
      print("Error fetching users: $e");
      if (mounted) {
        setState(() {
          userList = [];
          searchUsers = [];
        });
      }
    }
  }

  // Key Change 3: Made toggleFavorite async and simplified logic
  void toggleFavorite(Map<String, dynamic> user) async {
    final updatedFavorite = user['isFavourite'] == 1 ? 0 : 1;
    setState(() {
      user['isFavourite'] = updatedFavorite;
      List<Map<String, dynamic>> updatedFavorites = List.from(widget.favoriteUsers);
      if (updatedFavorite == 1) {
        if (!updatedFavorites.any((fav) => fav['id'] == user['id'])) {
          updatedFavorites.add(Map<String, dynamic>.from(user));
        }
      } else {
        updatedFavorites.removeWhere((fav) => fav['id'] == user['id']);
      }
      widget.onFavoriteUpdate(updatedFavorites);
    });

    try {
      await ApiService().updateUser(
        int.parse(user['id'].toString()),
        {...user, 'isFavourite': updatedFavorite},
      );
    } catch (e) {
      print("Error updating favorite status: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update favorite status: $e")),
      );
    }
  }

  void _showDeleteConfirmationDialog(Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Delete User"),
          content: const Text("Are you sure you want to delete this user?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await ApiService().deleteUser(int.parse(user['id'].toString()));
                  _loadUsers();
                  // Key Change 4: Update favoriteUsers after deletion
                  widget.onFavoriteUpdate(widget.favoriteUsers.where((fav) => fav['id'] != user['id']).toList());
                  Navigator.of(context).pop();
                } catch (e) {
                  print("Error deleting user: $e");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to delete user: $e")),
                  );
                }
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
        searchUsers = List.from(userList);
      } else {
        query = query.toLowerCase();
        searchUsers = userList.where((user) {
          return (user['name']?.toString().toLowerCase().contains(query) ?? false) ||
              (user['email']?.toString().toLowerCase().contains(query) ?? false) ||
              (user['mobile']?.toString().toLowerCase().contains(query) ?? false) ||
              (user['city']?.toString().toLowerCase().contains(query) ?? false);
        }).toList();
      }
      _sortUsers(selectedSort);
    });
  }

  int calculateAge(String dob) {
    try {
      DateFormat format = DateFormat("dd/MM/yyyy");
      DateTime birthDate = format.parse(dob);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      print("Error parsing date: $e");
      return 0;
    }
  }

  void _sortUsers(String criteria) {
    setState(() {
      if (criteria == 'Name') {
        searchUsers.sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));
      } else if (criteria == 'Age') {
        searchUsers.sort((a, b) => calculateAge(a['dob']).compareTo(calculateAge(b['dob'])));
      } else if (criteria == 'City') {
        searchUsers.sort((a, b) => (a['city'] ?? '').compareTo(b['city'] ?? ''));
      }
      if (!ascending) {
        searchUsers = searchUsers.reversed.toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[50]!, Colors.purple[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                right: 16,
                bottom: 32,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: DropdownButton<String>(
                              value: selectedSort,
                              dropdownColor: Colors.pinkAccent,
                              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                              underline: const SizedBox(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              items: ['Name', 'Age', 'City'].map((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    selectedSort = newValue;
                                    _sortUsers(selectedSort);
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: Icon(
                                ascending ? Icons.arrow_upward : Icons.arrow_downward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  ascending = !ascending;
                                  _sortUsers(selectedSort);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: _filterUsers,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Search profiles...",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.search, color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: searchUsers.length,
                itemBuilder: (context, index) {
                  final user = searchUsers[index];
                  final isFavorite = user['isFavourite'] == 1;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(
                              user: user,
                              onUserUpdated: (updatedUser) async {
                                await ApiService().updateUser(
                                  int.parse(user['id'].toString()),
                                  updatedUser,
                                );
                                _loadUsers();
                                widget.onFavoriteUpdate(widget.favoriteUsers);
                              },
                              onDelete: () async {
                                await ApiService().deleteUser(int.parse(user['id'].toString()));
                                _loadUsers();
                                widget.onFavoriteUpdate(widget.favoriteUsers.where((fav) => fav['id'] != user['id']).toList());
                                Navigator.pop(context);
                              },
                              isFavorite: isFavorite,
                              onFavoriteToggle: () => toggleFavorite(user),
                            ),
                          ),
                        );
                        if (result == true) {
                          _loadUsers();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.purple[50],
                              child: Icon(Icons.person, size: 40, color: Colors.purple[300]),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purpleAccent.withOpacity(0.2),
                                        ),
                                        child: Icon(
                                          Icons.person_rounded,
                                          color: Colors.purpleAccent,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          user['name'] ?? 'Unnamed',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins',
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.pinkAccent.withOpacity(0.2),
                                        ),
                                        child: Icon(
                                          Icons.cake_rounded,
                                          color: Colors.pinkAccent,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          "${calculateAge(user['dob'].toString())} years",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blueAccent.withOpacity(0.2),
                                        ),
                                        child: Icon(
                                          Icons.location_city_rounded,
                                          color: Colors.blueAccent,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          user['city'] ?? 'Unknown',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.cyanAccent.withOpacity(0.2),
                                        ),
                                        child: Icon(
                                          user['gender'] == 'Male'
                                              ? Icons.male
                                              : user['gender'] == 'Female'
                                              ? Icons.female
                                              : Icons.transgender,
                                          color: Colors.cyanAccent,
                                          size: 18,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          user['gender'] ?? 'Not specified',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Comfortaa',
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.grey[400],
                                  ),
                                  onPressed: () => toggleFavorite(user),
                                ),
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.grey[400]),
                                  onPressed: () {
                                    int userId = int.tryParse(user['id'].toString()) ?? 0;
                                    print("Navigating to edit with userIndex: $userId");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Adduser(
                                          isEdit: true,
                                          userIndex: userId,
                                          userData: Map<String, dynamic>.from(user),
                                          userDetailsList: searchUsers.cast<Map<String, dynamic>>(),
                                        ),
                                      ),
                                    ).then((value) {
                                      if (value == true) {
                                        _loadUsers();
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red[300]),
                                  onPressed: () => _showDeleteConfirmationDialog(user),
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
      ),
    );
  }
}