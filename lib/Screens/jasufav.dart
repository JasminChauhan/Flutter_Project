// // import 'package:flutter/material.dart';
// //
// // class FavouriteUser extends StatefulWidget {
// //   final List<Map<String, dynamic>> favoriteUsers;
// //   final Function(List<Map<String, dynamic>>) onFavoriteUpdate;
// //
// //   const FavouriteUser({super.key, required this.favoriteUsers, required this.onFavoriteUpdate});
// //
// //   @override
// //   _FavouriteUserState createState() => _FavouriteUserState();
// // }
// //
// // class _FavouriteUserState extends State<FavouriteUser> {
// //   late Set<Map<String, dynamic>> favoriteUserSet;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     favoriteUserSet = widget.favoriteUsers.toSet();
// //   }
// //
// //   void toggleFavorite(Map<String, dynamic> user) {
// //     setState(() {
// //       if (favoriteUserSet.contains(user)) {
// //         favoriteUserSet.remove(user);
// //       } else {
// //         favoriteUserSet.add(user);
// //       }
// //       widget.onFavoriteUpdate(favoriteUserSet.toList());
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text("Favourite Users"), backgroundColor: Colors.tealAccent),
// //       body: favoriteUserSet.isEmpty
// //           ? const Center(child: Text("No Favorite Users"))
// //           : ListView.builder(
// //         itemCount: favoriteUserSet.length,
// //         itemBuilder: (context, index) {
// //           final user = favoriteUserSet.elementAt(index);
// //           return Card(
// //             child: ListTile(
// //               title: Text(user['name']),
// //               subtitle: Text(user['email']),
// //               trailing: IconButton(
// //                 icon: const Icon(Icons.favorite, color: Colors.red),
// //                 onPressed: () => toggleFavorite(user),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// //
// // class FavouriteUser extends StatefulWidget {
// //   final List<Map<String, dynamic>> favoriteUsers;
// //   final Function(List<Map<String, dynamic>>) onFavoriteUpdate;
// //
// //   const FavouriteUser({
// //     super.key,
// //     required this.favoriteUsers,
// //     required this.onFavoriteUpdate,
// //   });
// //
// //   @override
// //   _FavouriteUserState createState() => _FavouriteUserState();
// // }
// //
// // class _FavouriteUserState extends State<FavouriteUser> {
// //   late Set<Map<String, dynamic>> favoriteUserSet;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     favoriteUserSet = widget.favoriteUsers.toSet();
// //   }
// //
// //   void toggleFavorite(Map<String, dynamic> user) {
// //     setState(() {
// //       if (favoriteUserSet.contains(user)) {
// //         favoriteUserSet.remove(user);
// //       } else {
// //         favoriteUserSet.add(user);
// //       }
// //       widget.onFavoriteUpdate(favoriteUserSet.toList());
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         flexibleSpace: Container(
// //           decoration: BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Colors.blueAccent.shade200, Colors.pinkAccent.shade200],
// //               begin: Alignment.centerLeft,
// //               end: Alignment.centerRight,
// //             ),
// //           ),
// //         ),
// //         title: const Text("Favourite Users"),
// //         backgroundColor: Colors.tealAccent,
// //       ),
// //       body: favoriteUserSet.isEmpty
// //           ? const Center(child: Text("No Favorite Users"))
// //           : ListView.builder(
// //         itemCount: favoriteUserSet.length,
// //         itemBuilder: (context, index) {
// //           final user = favoriteUserSet.elementAt(index);
// //           return Card(
// //             elevation: 5,
// //             margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: ListTile(
// //               contentPadding: const EdgeInsets.all(15),
// //               title: Text(
// //                 user['name'],
// //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
// //               ),
// //               subtitle: Text(
// //                 user['email'],
// //                 style: TextStyle(color: Colors.grey.shade700),
// //               ),
// //               trailing: IconButton(
// //                 icon: const Icon(
// //                   Icons.favorite,
// //                   color: Colors.red,
// //                 ),
// //                 onPressed: () => toggleFavorite(user),
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// //


// import 'package:flutter/material.dart';
// import '../Database/database_helper.dart';


// class FavouriteUser extends StatefulWidget {
//   const FavouriteUser({super.key});

//   @override
//   _FavouriteUserState createState() => _FavouriteUserState();
// }

// class _FavouriteUserState extends State<FavouriteUser> {

//   List<Map<String, dynamic>> favoriteUsers = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadFavoriteUsers();
//   }

//   Future<void> _loadFavoriteUsers() async {
//     final dbHelper = DatabaseHelper.instance;
//     final users = await dbHelper.getFavoriteUsers();
//     setState(() {
//       favoriteUsers = users;
//     });
//   }

//   Future<void> _toggleFavorite(int userId) async {
//     final dbHelper = DatabaseHelper.instance;
//     final user = favoriteUsers.firstWhere((user) => user['id'] == userId);
//     final isCurrentlyFavorite = user['isFavourite'] == 1;

//     await dbHelper.toggleFavorite(userId, !isCurrentlyFavorite);
//     _loadFavoriteUsers(); // Refresh the list
//   }

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
//         title: const Text("Favourite Users"),
//       ),
//       body: favoriteUsers.isEmpty
//           ? const Center(child: Text("No Favorite Users"))
//           : ListView.builder(
//         itemCount: favoriteUsers.length,
//         itemBuilder: (context, index) {
//           final user = favoriteUsers[index];
//           return Card(
//             elevation: 5,
//             margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListTile(
//               contentPadding: const EdgeInsets.all(15),
//               title: Text(
//                 user['name'],
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//               ),
//               subtitle: Text(
//                 user['email'],
//                 style: TextStyle(color: Colors.grey.shade700),
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.favorite, color: Colors.red),
//                 onPressed: () => _toggleFavorite(user['id']),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

