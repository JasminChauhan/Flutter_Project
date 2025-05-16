// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class UserDetails extends StatefulWidget {
//   final Map<String, dynamic> user;
//   final Function(Map<String, dynamic>) onUserUpdated;
//   final VoidCallback onDelete;
//   final bool isFavorite;
//   final VoidCallback onFavoriteToggle;
//
//   const UserDetails({
//     super.key,
//     required this.user,
//     required this.onUserUpdated,
//     required this.onDelete,
//     required this.isFavorite,
//     required this.onFavoriteToggle,
//   });
//
//   @override
//   _UserDetailsState createState() => _UserDetailsState();
// }
//
// class _UserDetailsState extends State<UserDetails> {
//   late Map<String, dynamic> user;
//
//   @override
//   void initState() {
//     super.initState();
//     user = Map.from(widget.user);
//   }
//
//   // Calculate Age from DOB
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
//
//   @override
//   Widget build(BuildContext context) {
//     int userAge =
//     user['dob'] != null ? calculateAge(user['dob']) : (user['age'] ?? 0);
//
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFF1F8), Color(0xFFE1F5FE)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Custom header with cute gradient and playful back button
//                 Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFBA68C8), Color(0xFFCE93D8)],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(40),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       // IconButton(
//                       //   icon: const Icon(Icons.arrow_back,
//                       //       color: Colors.white, size: 30),
//                       //   onPressed: () => Navigator.pop(context),
//                       // ),
//                       // const SizedBox(width: 12),
//                       Center(
//                         child: Text(
//                           user['name'],
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 26,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             shadows: [
//                               Shadow(
//                                   offset: Offset(1, 1),
//                                   blurRadius: 2,
//                                   color: Colors.black26)
//                             ],
//                           ),
//                         ),
//                       ),
//                       // const Spacer(),
//                       // Icon(Icons.favorite,
//                       //     color: Colors.pink.shade200, size: 28),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 // Profile Icon with a playful border
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.pink.shade100, width: 4),
//                   ),
//                   child: const CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Color(0xFFCE93D8),
//                     child: Icon(Icons.account_circle_rounded,
//                         color: Colors.white, size: 80),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 // User Details Card with new cute card color and extra spacing
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20, vertical: 20), // more vertical spacing
//                   child: Card(
//                     elevation: 10,
//                     color: const Color(0xFFFFE0F0), // new soft pastel pink
//                     shadowColor: Colors.pink.shade100,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(30), // increased inner spacing
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildDetailRow("Name", user['name']),
//                           _buildDetailRow("Email", user['email']),
//                           _buildDetailRow("Mobile", user['mobile']),
//                           _buildDetailRow("Gender", user['gender']),
//                           _buildDetailRow("Age", userAge.toString()),
//                           _buildDetailRow("City", user['city']),
//                           if (user['dob'] != null)
//                             _buildDetailRow("Date of Birth", user['dob']),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0), // extra spacing
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "$label: ",
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Color(0xFF8E24AA),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 16, color: Colors.black87),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class UserDetails extends StatefulWidget {
//   final Map<String, dynamic> user;
//   final Function(Map<String, dynamic>) onUserUpdated;
//   final VoidCallback onDelete;
//   final bool isFavorite;
//   final VoidCallback onFavoriteToggle;
//
//   const UserDetails({
//     super.key,
//     required this.user,
//     required this.onUserUpdated,
//     required this.onDelete,
//     required this.isFavorite,
//     required this.onFavoriteToggle,
//   });
//
//   @override
//   _UserDetailsState createState() => _UserDetailsState();
// }
//
// class _UserDetailsState extends State<UserDetails> {
//   late Map<String, dynamic> user;
//
//   @override
//   void initState() {
//     super.initState();
//     user = Map.from(widget.user);
//   }
//
//   // Calculate Age from DOB
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
//
//   @override
//   Widget build(BuildContext context) {
//     int userAge =
//     user['dob'] != null ? calculateAge(user['dob']) : (user['age'] ?? 0);
//
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFF1F8), Color(0xFFE1F5FE)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 // Custom header with cute gradient and playful back button
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFBA68C8), Color(0xFFCE93D8)],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                     borderRadius: BorderRadius.vertical(
//                       bottom: Radius.circular(40),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           user['name'],
//                           overflow: TextOverflow.ellipsis,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 26,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             shadows: [
//                               Shadow(
//                                   offset: Offset(1, 1),
//                                   blurRadius: 2,
//                                   color: Colors.black26)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 // Profile Icon with cute glowing effect
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.pink.shade100,
//                         blurRadius: 15,
//                         spreadRadius: 3,
//                       ),
//                     ],
//                     border: Border.all(color: Colors.pink.shade100, width: 4),
//                   ),
//                   child: const CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Color(0xFFCE93D8),
//                     child: Icon(Icons.account_circle_rounded,
//                         color: Colors.white, size: 80),
//                   ),
//                 ),
//                 const SizedBox(height: 25),
//                 // User Details Section with Improved Layout
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       _buildDetailRow(Icons.person_rounded, "Name", user['name']),
//                       _buildDetailRow(Icons.email_rounded, "Email", user['email']),
//                       _buildDetailRow(Icons.phone_rounded, "Mobile", user['mobile']),
//                       _buildDetailRow(
//                         user['gender'] == 'Male'
//                             ? Icons.male
//                             : user['gender'] == 'Female'
//                             ? Icons.female
//                             : Icons.transgender,
//                         "Gender",
//                         user['gender'],
//                       ),
//                       _buildDetailRow(Icons.cake_rounded, "Age", userAge.toString()),
//                       _buildDetailRow(Icons.location_city_rounded, "City", user['city']),
//                       if (user['dob'] != null)
//                         _buildDetailRow(Icons.calendar_today_rounded, "DOB", user['dob']),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // User Detail Row with Icon
//   Widget _buildDetailRow(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.purpleAccent, size: 22),
//           const SizedBox(width: 10),
//           Text(
//             "$label: ",
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: Color(0xFF8E24AA),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 16, color: Colors.black87),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatefulWidget {
  final Map<String, dynamic> user;
  final Function(Map<String, dynamic>) onUserUpdated;
  final VoidCallback onDelete;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const UserDetails({
    super.key,
    required this.user,
    required this.onUserUpdated,
    required this.onDelete,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late Map<String, dynamic> user;

  @override
  void initState() {
    super.initState();
    user = Map.from(widget.user);
  }

  // Calculate Age from DOB
  int calculateAge(String dob) {
    try {
      DateTime birthDate = DateFormat('dd/MM/yyyy').parse(dob);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    int userAge =
    user['dob'] != null ? calculateAge(user['dob']) : (user['age'] ?? 0);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF1F8), Color(0xFFE1F5FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Custom header
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFBA68C8), Color(0xFFCE93D8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      user['name'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              color: Colors.black26)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Improved Profile Avatar
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF80AB), Color(0xFFCE93D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.shade200,
                        blurRadius: 20,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Color(0xFFBA68C8), size: 80),
                  ),
                ),

                const SizedBox(height: 25),

                // Name, Email, Mobile in a Cute Card
                _buildInfoCard(
                  title: "Personal Info",
                  gradientColors: [Color(0xFFF48FB1), Color(0xFFFFCDD2)],
                  children: [
                    _buildDetailRow("Name", user['name']),
                    _buildDetailRow("Email", user['email']),
                    _buildDetailRow("Mobile", user['mobile']),
                  ],
                ),

                // Gender & Hobby Card
                _buildInfoCard(
                  title: "More About You",
                  gradientColors: [Color(0xFF81D4FA), Color(0xFFE1F5FE)],
                  children: [
                    _buildDetailRow("Gender", user['gender']),
                    _buildDetailRow("Hobby", user['hobbies'] ?? "Not provided"),
                  ],
                ),

                // Age & City Card
                _buildInfoCard(
                  title: "Location & Age",
                  gradientColors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)],
                  children: [
                    _buildDetailRow("Age", userAge.toString()),
                    _buildDetailRow("City", user['city']),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // User Info Card
  Widget _buildInfoCard({
    required String title,
    required List<Color> gradientColors,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            // Card Header with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Card Content
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // User Detail Row without Icons
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF8E24AA),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
