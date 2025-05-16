// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math' as math;
//
// import 'dashboard_screen.dart';
//
// class FloatingHeart extends StatefulWidget {
//   final double initialX;
//   final double initialY;
//
//   const FloatingHeart({
//     required this.initialX,
//     required this.initialY,
//     super.key,
//   });
//
//   @override
//   _FloatingHeartState createState() => _FloatingHeartState();
// }
//
// class _FloatingHeartState extends State<FloatingHeart> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _floatAnimation;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 2 + math.Random().nextInt(2)),
//       vsync: this,
//     )..repeat(reverse: true);
//
//     _floatAnimation = Tween<double>(
//       begin: -10.0,
//       end: 10.0,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//
//     _opacityAnimation = Tween<double>(
//       begin: 0.3,
//       end: 0.7,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Positioned(
//           left: widget.initialX,
//           top: widget.initialY + _floatAnimation.value,
//           child: Opacity(
//             opacity: _opacityAnimation.value,
//             child: Icon(
//               Icons.favorite,
//               size: 20 + math.Random().nextInt(15).toDouble(),
//               color: Colors.white.withOpacity(0.7),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _rotateAnimation;
//   late Animation<double> _opacityAnimation;
//   final List<Map<String, double>> _heartPositions = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Generate random positions for floating hearts
//     for (int i = 0; i < 15; i++) {
//       _heartPositions.add({
//         'x': math.Random().nextDouble() * 300,
//         'y': math.Random().nextDouble() * 600,
//       });
//     }
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );
//
//     _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.elasticOut,
//       ),
//     );
//
//     _rotateAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Interval(0.0, 0.5, curve: Curves.easeIn),
//       ),
//     );
//
//     _controller.forward();
//
//     Timer(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const DashboardScreen()),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFE1BEE7),  // Lighter purple
//               Color(0xFFCE93D8),  // Soft purple
//               Color(0xFFBA68C8),  // Medium purple
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Floating hearts background
//             ..._heartPositions.map((position) => FloatingHeart(
//               initialX: position['x']!,
//               initialY: position['y']!,
//             )),
//
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AnimatedBuilder(
//                     animation: _controller,
//                     builder: (context, child) {
//                       return Transform.scale(
//                         scale: _scaleAnimation.value,
//                         child: Transform.rotate(
//                           angle: _rotateAnimation.value,
//                           child: Opacity(
//                             opacity: _opacityAnimation.value,
//                             child: Container(
//                               width: 140,
//                               height: 140,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.pink.withOpacity(0.3),
//                                     blurRadius: 20,
//                                     spreadRadius: 5,
//                                   ),
//                                 ],
//                               ),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.favorite,
//                                     size: 90,
//                                     color: Color(0xFFEC407A),
//                                   ),
//                                   Positioned(
//                                     top: 25,
//                                     right: 25,
//                                     child: Icon(
//                                       Icons.favorite,
//                                       size: 30,
//                                       color: Color(0xFFFF80AB),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   SizedBox(height: 30),
//                   AnimatedBuilder(
//                     animation: _opacityAnimation,
//                     builder: (context, child) {
//                       return Opacity(
//                         opacity: _opacityAnimation.value,
//                         child: Column(
//                           children: [
//                             Text(
//                               "PairBliss",
//                               style: TextStyle(
//                                 fontSize: 42,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF4A148C),
//                                 letterSpacing: 1.2,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.white.withOpacity(0.5),
//                                     offset: Offset(2, 2),
//                                     blurRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 12),
//                             Text(
//                               "Find Your Perfect Match",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF4A148C),
//                                 letterSpacing: 0.5,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'dashboard_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const DashboardScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFFCE4EC),  // Super soft pink
//               Color(0xFFF8BBD0),  // Light pink
//               Color(0xFFF48FB1),  // Medium pink
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Decorative elements in corners
//             Positioned(
//               top: 40,
//               left: 20,
//               child: _buildDecorativeHeart(0.8),
//             ),
//             Positioned(
//               top: 60,
//               right: 30,
//               child: _buildDecorativeHeart(0.6),
//             ),
//             Positioned(
//               bottom: 50,
//               left: 30,
//               child: _buildDecorativeHeart(0.7),
//             ),
//             Positioned(
//               bottom: 70,
//               right: 20,
//               child: _buildDecorativeHeart(0.9),
//             ),
//
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 180,
//                     height: 180,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Color(0xFFF06292),
//                         width: 3,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.pink.withOpacity(0.3),
//                           blurRadius: 15,
//                           spreadRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         // Main large heart
//                         Icon(
//                           Icons.favorite,
//                           size: 100,
//                           color: Color(0xFFEC407A),
//                         ),
//                         // Cute small hearts around
//                         Positioned(
//                           top: 40,
//                           right: 45,
//                           child: Icon(
//                             Icons.favorite,
//                             size: 25,
//                             color: Color(0xFFFF80AB),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 45,
//                           left: 45,
//                           child: Icon(
//                             Icons.favorite,
//                             size: 20,
//                             color: Color(0xFFFF80AB),
//                           ),
//                         ),
//                         // Cute face elements
//                         Positioned(
//                           top: 85,
//                           left: 65,
//                           child: Container(
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 85,
//                           right: 65,
//                           child: Container(
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 95,
//                           child: Container(
//                             width: 15,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.9),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: Color(0xFFF06292),
//                         width: 2,
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         Text(
//                           "PairBliss",
//                           style: TextStyle(
//                             fontSize: 42,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFD81B60),
//                             letterSpacing: 1.2,
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           "Pairing Hearts, Creating Bliss.",
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Color(0xFFE91E63),
//                             letterSpacing: 0.5,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDecorativeHeart(double opacity) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.8),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         Icons.favorite,
//         size: 25,
//         color: Color(0xFFEC407A).withOpacity(opacity),
//       ),
//     );
//   }
// }


  // import 'package:flutter/material.dart';
  // import 'package:shared_preferences/shared_preferences.dart';
  // import 'dart:async';
  //
  // import 'SignInScreen.dart';
  // import 'dashboard_screen.dart';
  //
  // class SplashScreen extends StatefulWidget {
  //   const SplashScreen({super.key});
  //
  //   @override
  //   _SplashScreenState createState() => _SplashScreenState();
  // }
  //
  // class _SplashScreenState extends State<SplashScreen> {
  //   @override
  //   void initState() {
  //     super.initState();
  //     _navigateAfterDelay();
  //     Timer(const Duration(seconds: 4), () {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const DashboardScreen()),
  //       );
  //     });
  //   }
  //
  //   Future<void> _navigateAfterDelay() async {
  //     await Future.delayed(const Duration(seconds: 2));
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  //     if (isLoggedIn) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const DashboardScreen()),
  //       );
  //     } else {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const SignInScreen()),
  //       );
  //     }
  //   }
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             begin: Alignment.topCenter,
  //             end: Alignment.bottomCenter,
  //             colors: [
  //               Color(0xFFFCE4EC), // Super soft pink
  //               Color(0xFFF8BBD0), // Light pink
  //               Color(0xFFF48FB1), // Medium pink
  //             ],
  //           ),
  //         ),
  //         child: Stack(
  //           children: [
  //             // Decorative elements in corners
  //             Positioned(top: 40, left: 20, child: _buildDecorativeHeart(0.8)),
  //             Positioned(top: 60, right: 30, child: _buildDecorativeHeart(0.6)),
  //             Positioned(bottom: 50, left: 30, child: _buildDecorativeHeart(0.7)),
  //             Positioned(bottom: 70, right: 20, child: _buildDecorativeHeart(0.9)),
  //
  //             Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   // Circular logo container replacing the heart
  //                   Container(
  //                     width: 180,
  //                     height: 180,
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       shape: BoxShape.circle,
  //                       border: Border.all(color: Color(0xFFF06292), width: 3),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.pink.withOpacity(0.3),
  //                           blurRadius: 15,
  //                           spreadRadius: 5,
  //                         ),
  //                       ],
  //                     ),
  //
  //                       child: Image.asset(
  //                         'assets/images/PairBliss.jpg', // Replace with your actual logo path
  //                         width: 150,
  //                         height: 150,
  //                         fit: BoxFit.contain,
  //                       ),
  //
  //                   ),
  //                   SizedBox(height: 30),
  //
  //                   // App Name and Slogan
  //                   Container(
  //                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white.withOpacity(0.9),
  //                       borderRadius: BorderRadius.circular(20),
  //                       border: Border.all(color: Color(0xFFF06292), width: 2),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         Text(
  //                           "PairBliss",
  //                           style: TextStyle(
  //                             fontSize: 42,
  //                             fontWeight: FontWeight.bold,
  //                             color: Color(0xFFD81B60),
  //                             letterSpacing: 1.2,
  //                           ),
  //                         ),
  //                         SizedBox(height: 8),
  //                         Text(
  //                           "Pairing Hearts, Creating Bliss.",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             color: Color(0xFFE91E63),
  //                             letterSpacing: 0.5,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  //
  //   Widget _buildDecorativeHeart(double opacity) {
  //     return Container(
  //       padding: EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         color: Colors.white.withOpacity(0.8),
  //         shape: BoxShape.circle,
  //       ),
  //       child: Icon(
  //         Icons.favorite,
  //         size: 25,
  //         color: Color(0xFFEC407A).withOpacity(opacity),
  //       ),
  //     );
  //   }
  // }




import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'SignInScreen.dart';
import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFCE4EC), // Soft pastel pink
              Color(0xFFF8BBD0), // Light pink
              Color(0xFFF48FB1), // Medium pink
            ],
          ),
        ),
        child: Stack(
          children: [
            // Decorative hearts in corners
            _buildDecorativeHeart(top: 50, left: 20, size: 28, opacity: 0.8),
            _buildDecorativeHeart(top: 80, right: 30, size: 24, opacity: 0.6),
            _buildDecorativeHeart(bottom: 60, left: 40, size: 26, opacity: 0.7),
            _buildDecorativeHeart(bottom: 80, right: 20, size: 30, opacity: 0.9),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated logo container
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Color(0xFFF06292), width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(15), // Adjust padding to avoid cropping
                          child: Image.asset(
                            'assets/images/PairBliss.jpg',
                            fit: BoxFit.contain, // Ensures the full logo is visible
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // App Name & Slogan
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xFFF06292), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "PairBliss",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD81B60),
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Pairing Hearts, Creating Bliss.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFE91E63),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorativeHeart({double? top, double? bottom, double? left, double? right, double size = 25, double opacity = 0.7}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,
          size: size,
          color: Color(0xFFEC407A).withOpacity(opacity),
        ),
      ),
    );
  }
}

