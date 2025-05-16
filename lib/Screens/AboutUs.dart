// import 'package:flutter/material.dart';
//
// class AboutUs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF6A1B9A),
//                 Color(0xFF8E24AA),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.purple[50]!,
//               Colors.pink[50]!,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildHeader(),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     _buildIntroCard(),
//                     SizedBox(height: 16),
//                     _buildTeamSection(),
//                     SizedBox(height: 16),
//                     _buildASWDCSection(),
//                     SizedBox(height: 16),
//                     _buildContactSection(),
//                     SizedBox(height: 16),
//                     _buildSocialLinks(),
//                     SizedBox(height: 16),
//                     _buildFooter(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Container(
//       height: 220,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
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
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.favorite,
//               size: 50,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 16),
//           ShaderMask(
//             shaderCallback: (bounds) => LinearGradient(
//               colors: [Colors.white, Colors.white70],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ).createShader(bounds),
//             child: Text(
//               'PairBliss',
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 letterSpacing: 2,
//                 shadows: [
//                   Shadow(
//                     color: Colors.black26,
//                     offset: Offset(0, 3),
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 8),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               '❤ Where Love Stories Begin ❤',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.white.withOpacity(0.9),
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildIntroCard() {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.purple[50]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             Icon(Icons.favorite_border, size: 40, color: Color(0xFF8E24AA)),
//             SizedBox(height: 8),
//             Text(
//               'Finding Your Perfect Match',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'We believe every person deserves to find their soulmate. Our platform helps you connect with like-minded individuals and build meaningful relationships.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 height: 1.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ... existing helper methods ...
//
//   Widget _buildTeamSection() {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.blue[50]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Our Amazing Team',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             Divider(color: Color(0xFF8E24AA)),
//             _buildTeamMember(
//               'Jasmin Chauhan',
//               '23010101045',
//               'Developer',
//               Icons.computer,
//             ),
//             _buildTeamMember(
//               'Prof. Mehul Bhundiya',
//               'Computer Engineering Department',
//               'Mentor',
//               Icons.school,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTeamMember(
//       String name, String role, String position, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: Color(0xFF8E24AA).withOpacity(0.2),
//             child: Icon(icon, color: Color(0xFF8E24AA)),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Color(0xFF6A1B9A),
//                   ),
//                 ),
//                 Text(
//                   role,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   position,
//                   style: TextStyle(
//                     color: Color(0xFF8E24AA),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactSection() {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.pink[50]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             Text(
//               'Get in Touch',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             SizedBox(height: 16),
//             _buildContactItem(Icons.email, 'aswdc@darshan.ac.in'),
//             _buildContactItem(Icons.phone, '+91-9727747317'),
//             _buildContactItem(Icons.language, 'www.darshan.ac.in'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContactItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Color(0xFF8E24AA).withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(icon, color: Color(0xFF8E24AA)),
//           ),
//           SizedBox(width: 12),
//           Text(
//             text,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[700],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildFooter() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.favorite, color: Colors.red, size: 20),
//               SizedBox(width: 8),
//               Text(
//                 'Made with love in India',
//                 style: TextStyle(
//                   color: Colors.grey[700],
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 8),
//           Text(
//             '© 2025 PairBliss - All Rights Reserved',
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildASWDCSection() {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.purple[50]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: Color(0xFF8E24AA).withOpacity(0.1),
//               child: Image.asset(
//                 'assets/images/darshan_logo.png', // Add your logo image
//                 width: 50,
//                 height: 50,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Icon(Icons.school, size: 40, color: Color(0xFF8E24AA));
//                 },
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'ASWDC - Darshan Institute',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Applied Software Development Center',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFF8E24AA),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             SizedBox(height: 12),
//             Text(
//               'ASWDC is a software development center at Darshan Institute where students get hands-on experience in real-world projects.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 height: 1.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialLinks() {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.pink[50]!],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           children: [
//             Text(
//               'Connect With Us',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF6A1B9A),
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildSocialButton(
//                   icon: Icons.facebook,
//                   color: Color(0xFF1976D2),
//                   onTap: () {
//                     // Add Facebook link handler
//                   },
//                 ),
//                 _buildSocialButton(
//                   icon: Icons.link,
//                   color: Color(0xFF0288D1),
//                   onTap: () {
//                     // Add LinkedIn link handler
//                   },
//                 ),
//                 _buildSocialButton(
//                   icon: Icons.thumb_up,
//                   color: Color(0xFFE91E63),
//                   onTap: () {
//                     // Add Instagram link handler
//                   },
//                 ),
//                 _buildSocialButton(
//                   icon: Icons.web,
//                   color: Color(0xFF673AB7),
//                   onTap: () {
//                     // Add Website link handler
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialButton({
//     required IconData icon,
//     required Color color,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: color.withOpacity(0.3),
//             width: 1,
//           ),
//         ),
//         child: Icon(
//           icon,
//           color: color,
//           size: 24,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[50]!,
              Colors.pink[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildIntroCard(),
                    SizedBox(height: 16),
                    _buildTeamSection(),
                    SizedBox(height: 16),
                    _buildASWDCSection(),
                    SizedBox(height: 16),
                    _buildContactSection(),
                    SizedBox(height: 16),
                    _buildSocialLinks(),
                    SizedBox(height: 16),
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white70],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Text(
              'PairBliss',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Pairing Hearts, Creating Bliss.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.purple[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
          Image.asset(
          'assets/images/PairBliss.jpg',  // Replace with your actual logo path
          width: 120,  // Adjust size as needed
          height: 120,
        ),
            SizedBox(height: 8),
            Text(
              'Finding Your Perfect Match',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We believe every person deserves to find their soulmate. Our platform helps you connect with like-minded individuals and build meaningful relationships.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ... existing helper methods ...

  Widget _buildTeamSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Amazing Team',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            Divider(color: Color(0xFF8E24AA)),
            _buildTeamMember(
              'Jasmin Chauhan',
              '23010101045',
              'Developer',
              Icons.computer,
            ),
            _buildTeamMember(
              'Prof. Mehul Bhundiya',
              'Computer Engineering Department',
              'Mentor',
              Icons.school,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(
      String name, String role, String position, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF8E24AA).withOpacity(0.2),
            child: Icon(icon, color: Color(0xFF8E24AA)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF6A1B9A),
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  position,
                  style: TextStyle(
                    color: Color(0xFF8E24AA),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            SizedBox(height: 16),
            _buildContactItem(Icons.email, 'aswdc@darshan.ac.in'),
            _buildContactItem(Icons.phone, '+91-9727747317'),
            _buildContactItem(Icons.language, 'www.darshan.ac.in'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF8E24AA).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Color(0xFF8E24AA)),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, color: Colors.red, size: 20),
              SizedBox(width: 8),
              Text(
                'Made with love in India',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '© 2025 PairBliss - All Rights Reserved',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildASWDCSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.purple[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF8E24AA).withOpacity(0.1),
              child: Image.asset(
                'assets/images/darshan_logo.png', // Add your logo image
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.school, size: 40, color: Color(0xFF8E24AA));
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'ASWDC - Darshan Institute',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Applied Software Development Center',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF8E24AA),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'ASWDC is a software development center at Darshan Institute where students get hands-on experience in real-world projects.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              'Connect With Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A1B9A),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(
                  icon: Icons.facebook,
                  color: Color(0xFF1976D2),
                  onTap: () {
                    // Add Facebook link handler
                  },
                ),
                _buildSocialButton(
                  icon: Icons.link,
                  color: Color(0xFF0288D1),
                  onTap: () {
                    // Add LinkedIn link handler
                  },
                ),
                _buildSocialButton(
                  icon: Icons.thumb_up,
                  color: Color(0xFFE91E63),
                  onTap: () {
                    // Add Instagram link handler
                  },
                ),
                _buildSocialButton(
                  icon: Icons.web,
                  color: Color(0xFF673AB7),
                  onTap: () {
                    // Add Website link handler
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }
}
