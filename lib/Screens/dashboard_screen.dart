// import 'package:flutter/material.dart';
// import 'package:matrimony_project/Screens/AboutUs.dart';
// import 'package:matrimony_project/Screens/AddUser.dart';
// import 'package:matrimony_project/Screens/UserList.dart';
// import 'FavouriteUser.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Map<String, dynamic>> userDetailsList = [];
//   Set<Map<String, dynamic>> favoriteUsers = {};
//
//   void updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
//     setState(() {
//       favoriteUsers = updatedFavorites.toSet();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[50],
//       body: Column(
//         children: [
//           _buildTopBar(), // Cute Title & Logo
//           _buildGridSection(), // Grid Cards for Navigation
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.pinkAccent,
//         child: Icon(Icons.chat_bubble_outline, color: Colors.white),
//       ),
//     );
//   }
//
//   /// Cute Top Bar with Logo & Title
//   Widget _buildTopBar() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 30),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [Color(0xFFFFA6C1), Color(0xFFFFC3A0)]),
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
//         boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3))],
//       ),
//       child: Column(
//         children: [
//           Icon(Icons.favorite, size: 80, color: Colors.white),
//           SizedBox(height: 10),
//           Text("PairBliss", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.5)),
//           SizedBox(height: 5),
//           Text("Find your perfect match", style: TextStyle(fontSize: 18, color: Colors.white70)),
//         ],
//       ),
//     );
//   }
//
//   /// Grid Section with Quick Action Cards
//   Widget _buildGridSection() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 1.1,
//           children: [
//             _buildMenuCard(Icons.person_add, "Add User", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Adduser(userDetailsList: userDetailsList, isEdit: false)));
//             }),
//             _buildMenuCard(Icons.list_alt_rounded, "User List", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Userlist(userDetailsList: userDetailsList, favoriteUsers: favoriteUsers.toList(), onFavoriteUpdate: updateFavorites)));
//             }),
//             _buildMenuCard(Icons.favorite, "Favourites", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteUser(favoriteUsers: favoriteUsers.toList(), onFavoriteUpdate: updateFavorites)));
//             }),
//             _buildMenuCard(Icons.info_outline, "About Us", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Individual Menu Card
//   Widget _buildMenuCard(IconData icon, String label, VoidCallback onTap) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(16),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             gradient: LinearGradient(colors: [Colors.pinkAccent.shade100, Colors.purpleAccent.shade100]),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 40, color: Colors.white),
//               SizedBox(height: 10),
//               Text(label, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///MAIN LAYOUT------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:matrimony_project/Screens/AboutUs.dart';
// import 'package:matrimony_project/Screens/AddUser.dart';
// import 'package:matrimony_project/Screens/UserList.dart';
// import 'FavouriteUser.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Map<String, dynamic>> userDetailsList = [];
//   Set<Map<String, dynamic>> favoriteUsers = {};
//
//   void updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
//     setState(() {
//       favoriteUsers = updatedFavorites.toSet();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200], // Soft Background
//       body: Column(
//         children: [
//           _buildHeader(), // Gradient Header
//           _buildGridSection(), // Enhanced Card Layout
//         ],
//       ),
//     );
//   }
//
//   /// **🟣 Stylish Gradient Header**
//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(vertical: 30),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(colors: [Color(0xFF8E24AA), Color(0xFFD81B60)]), // Purple to Pink Gradient
//         borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
//         boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 3))],
//       ),
//       child: Column(
//         children: [
//           Icon(Icons.favorite, size: 80, color: Colors.white),
//           SizedBox(height: 10),
//           Text("PairBliss", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
//           SizedBox(height: 5),
//           Text("Find Your Perfect Match", style: TextStyle(fontSize: 16, color: Colors.white70)),
//         ],
//       ),
//     );
//   }
//
//   /// **🟠 Enhanced Grid Section (Four Cards)**
//   Widget _buildGridSection() {
//     return Expanded(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 1.1,
//           children: [
//             _buildEnhancedCard(Icons.person_add, "Add User", () {
//               // userDetailsList: userDetailsList,
//               // isEdit: false
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Adduser(userDetailsList: userDetailsList,isEdit: false)));
//             }),
//             _buildEnhancedCard(Icons.list_alt_rounded, "User List", () {
//               // userDetailsList: userDetailsList, favoriteUsers: favoriteUsers.toList(), onFavoriteUpdate: updateFavorites
//               Navigator.push(context, MaterialPageRoute(builder: (context) => Userlist(userDetailsList: userDetailsList, favoriteUsers: favoriteUsers.toList(), onFavoriteUpdate: updateFavorites)));
//             }),
//             _buildEnhancedCard(Icons.favorite, "Favourites", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteUser(favoriteUsers: favoriteUsers.toList(), onFavoriteUpdate: updateFavorites)));
//             }),
//             _buildEnhancedCard(Icons.info_outline, "About Us", () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// **🔹 Improved Card Design**
//   Widget _buildEnhancedCard(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [Colors.pinkAccent.shade100, Colors.purpleAccent.shade100]), // Gradient Cards
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))], // Soft Shadow
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//               ),
//               child: Icon(icon, size: 36, color: Color(0xFF8E24AA)), // Icon in Circle
//             ),
//             SizedBox(height: 12),
//             Text(
//               label,
//               style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:matrimony_project/Screens/AboutUs.dart';
// import 'package:matrimony_project/Screens/AddUser.dart';
// import 'package:matrimony_project/Screens/UserList.dart';
// import 'FavouriteUser.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Map<String, dynamic>> userDetailsList = [];
//   Set<Map<String, dynamic>> favoriteUsers = {};
//
//   void updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
//     setState(() {
//       favoriteUsers = updatedFavorites.toSet();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: Column(
//         children: [
//           _buildHeader(),
//           _buildGridSection(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 50, bottom: 30),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF8E24AA), Color(0xFFD81B60)],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.purple.withOpacity(0.3),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               // children: [
//               //   CircleAvatar(
//               //     radius: 20,
//               //     backgroundColor: Colors.white,
//               //     child: Icon(Icons.person, color: Color(0xFF8E24AA)),
//               //   ),
//               //   Icon(Icons.notifications_none, color: Colors.white, size: 24),
//               // ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Icon(
//             Icons.favorite,
//             size: 60,
//             color: Colors.white,
//           ),
//           SizedBox(height: 10),
//           Text(
//             "PairBliss",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             "Find Your Perfect Match",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white70,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridSection() {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 1.1,
//             children: [
//               _buildEnhancedCard(Icons.person_add, "Add User", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Adduser(userDetailsList: userDetailsList, isEdit: false)));
//               }),
//               _buildEnhancedCard(Icons.list_alt_rounded, "User List", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Userlist(
//                   userDetailsList: userDetailsList,
//                   favoriteUsers: favoriteUsers.toList(),
//                   onFavoriteUpdate: updateFavorites,
//                 )));
//               }),
//               _buildEnhancedCard(Icons.favorite, "Favourites", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteUser(
//                   favoriteUsers: favoriteUsers.toList(),
//                   onFavoriteUpdate: updateFavorites,
//                 )));
//               }),
//               _buildEnhancedCard(Icons.info_outline, "About Us", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEnhancedCard(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.pinkAccent.shade100, Colors.purpleAccent.shade100],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(25),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.purple.withOpacity(0.2),
//               blurRadius: 8,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 icon,
//                 size: 36,
//                 color: Color(0xFF8E24AA),
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:matrimony_project/Screens/AboutUs.dart';
// import 'package:matrimony_project/Screens/AddUser.dart';
// import 'package:matrimony_project/Screens/UserList.dart';
// import 'FavouriteUser.dart';
//
// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({super.key});
//
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Map<String, dynamic>> userDetailsList = [];
//   Set<Map<String, dynamic>> favoriteUsers = {};
//
//   void updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
//     setState(() {
//       favoriteUsers = updatedFavorites.toSet();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F0FC), // Light purple background
//       body: Column(
//         children: [
//           _buildHeader(),
//           _buildGridSection(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 50, bottom: 30),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Darker purple from image
//             Color(0xFF8E24AA), // Lighter purple from image
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.purple.withOpacity(0.3),
//             blurRadius: 15,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 20),
//           Icon(
//             Icons.favorite,
//             size: 60,
//             color: Colors.white,
//           ),
//           SizedBox(height: 10),
//           Text(
//             "PairBliss",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               letterSpacing: 0.5,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             "Find Your Perfect Match",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white.withOpacity(0.9),
//               letterSpacing: 0.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGridSection() {
//     return Expanded(
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//             childAspectRatio: 1.1,
//             children: [
//               _buildEnhancedCard(Icons.person_add, "Add User", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Adduser(userDetailsList: userDetailsList, isEdit: false)));
//               }),
//               _buildEnhancedCard(Icons.list_alt_rounded, "User List", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Userlist(
//                   userDetailsList: userDetailsList,
//                   favoriteUsers: favoriteUsers.toList(),
//                   onFavoriteUpdate: updateFavorites,
//                 )));
//               }),
//               _buildEnhancedCard(Icons.favorite, "Favourites", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteUser(
//                   favoriteUsers: favoriteUsers.toList(),
//                   onFavoriteUpdate: updateFavorites,
//                 )));
//               }),
//               _buildEnhancedCard(Icons.info_outline, "About Us", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEnhancedCard(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF6A1B9A), // Darker purple from image
//               Color(0xFF8E24AA), // Lighter purple from image
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.purple.withOpacity(0.15),
//               blurRadius: 10,
//               offset: Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.9),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 icon,
//                 size: 32,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               label,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
  import 'package:flutter/material.dart';
  import 'package:matrimony_project/Screens/AboutUs.dart';
  import 'package:matrimony_project/Screens/AddUser.dart';
  import 'package:matrimony_project/Screens/UserList.dart';
  import '../Database/database_helper.dart';
  import 'FavouriteUser.dart';
  import 'SignInScreen.dart';

  class DashboardScreen extends StatefulWidget {
    const DashboardScreen({super.key});

    @override
    _DashboardScreenState createState() => _DashboardScreenState();
  }

  class _DashboardScreenState extends State<DashboardScreen> {
    List<Map<String, dynamic>> userDetailsList = [];
    Set<Map<String, dynamic>> favoriteUsers = {}; // Changed to List for Userlist compatibility

    @override
    void initState() {
      super.initState();
      _loadUsers();
    }

    Future<void> _loadUsers() async {
      final users = await DatabaseHelper.instance.getAllUsers();
      final favUsers = await DatabaseHelper.instance.getFavoriteUsers();
      setState(() {
        userDetailsList = users;
        favoriteUsers = favUsers.toSet();
      });
    }

    void updateFavorites(List<Map<String, dynamic>> updatedFavorites) {
      setState(() {
        favoriteUsers = updatedFavorites.toSet();
      });
    }

    
    Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // User must tap a button to dismiss
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout Confirmation'),
            content: const Text('Are you sure you want to logout?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                },
              ),
              TextButton(
                child: const Text('Logout' , style: TextStyle(color: Colors.red),),
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss the dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFF3E5F5),
        body: Column(
          children: [
            _buildHeader(),
            _buildGridSection(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      );
    }

    Widget _buildHeader() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 50, bottom: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF8E24AA),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.3),
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/PairBliss.jpg', // Ensure this path is correct
              width: 100,
              height: 100,
            ),
            SizedBox(height: 10),
            Text(
              "PairBliss",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Pairing Hearts, Creating Bliss.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildGridSection() {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.1,
              children: [
                _buildEnhancedCard(
                  Icons.person_add,
                  "Add User",
                  Color(0xFFFF4081),
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Adduser(
                          userDetailsList: userDetailsList,
                          isEdit: false,
                        ),
                      ),
                    ).then((value) {
                      if (value == true) _loadUsers(); // Refresh if user added
                    });
                  },
                ),
                _buildEnhancedCard(Icons.list_alt_rounded, "User List", Color(0xFF7B1FA2), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Userlist(
                        userDetailsList: userDetailsList,
                        favoriteUsers: favoriteUsers.toList(),
                        onFavoriteUpdate: updateFavorites,
                      ),
                    ),
                  ).then((value) {
                    if (value == true) _loadUsers();
                  });
                }),
                _buildEnhancedCard(Icons.favorite, "Favourites", Color(0xFFFFC107), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavouriteUser(
                        favoriteUsers: favoriteUsers.toList(),
                        onFavoriteUpdate: updateFavorites,
                      ),
                    ),
                  ).then((value) {
                    if (value == true) _loadUsers();
                  });
                }),
                _buildEnhancedCard(
                  Icons.info_outline,
                  "About Us",
                  Color(0xFF03A9F4),
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUs()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget _buildEnhancedCard(IconData icon, String label, Color color, VoidCallback onTap) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 36,
                  color: color,
                ),
              ),
              SizedBox(height: 14),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.6,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
