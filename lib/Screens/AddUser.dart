// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../Database/database_helper.dart';
//
// class Adduser extends StatefulWidget {
//   final bool isEdit;
//   final int? userIndex;
//   final Map<String, dynamic>? userData;
//   final List<Map<String, dynamic>> userDetailsList;
//
//   const Adduser({
//     super.key,
//     required this.isEdit,
//     this.userIndex,
//     this.userData,
//     required this.userDetailsList,
//   });
//
//   @override
//   _AdduserState createState() => _AdduserState();
// }
//
// class _AdduserState extends State<Adduser> {
//   final formkey = GlobalKey<FormState>();
//
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController confirmpasswordcontroller = TextEditingController();
//
//   final List<String> _cities = ['Ahmedabad', 'Porbandar', 'Rajkot', 'Baroda'];
//   String? selectedCity;
//
//   String selectedGender = 'Male';
//
//   final List<String> hobbies = ['Reading', 'Playing', 'Gaming', 'Writing'];
//   final Map<String, bool> selectedHobbies = {};
//   bool _isObscured = false;
//
//   @override
//   void initState() {
//     super.initState();
//     for (var hobby in hobbies) {
//       selectedHobbies[hobby] = false;
//     }
//
//     if (widget.isEdit) {
//       namecontroller.text = widget.userData?['name'] ?? '';
//       emailcontroller.text = widget.userData?['email'] ?? '';
//       mobileController.text = widget.userData?['mobile'] ?? '';
//       dobController.text = widget.userData?['dob'] ?? '';
//       passwordcontroller.text = widget.userData?['password'] ?? '';
//       confirmpasswordcontroller.text = widget.userData?['password'] ?? '';
//       selectedCity = widget.userData?['city'];
//       selectedGender = widget.userData?['gender'] ?? '';
//
//       String hobbiesString = widget.userData?['hobbies'] ?? '';
//       if (hobbiesString.isNotEmpty) {
//         List<String> userHobbies = hobbiesString.split(',');
//         for (var hobby in hobbies) {
//           selectedHobbies[hobby] = userHobbies.contains(hobby);
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFFF3E5F5), // Changed to purple 50
//     appBar: AppBar(
//     centerTitle: true,
//     flexibleSpace: Container(
//     decoration: BoxDecoration(
//     gradient: LinearGradient(
//     colors: [
//     Color(0xFF9C27B0), // Changed to purple 500
//     Color(0xFFBA68C8), // Changed to purple 300
//     ],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//     ),
//     ),
//     ),
//     title: Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//     Icon(Icons.favorite, color: Colors.white, size: 24),
//     SizedBox(width: 8),
//     Text(
//     widget.isEdit ? "✨ Edit Profile ✨" : "✨ Join Us ✨", // Added sparkles
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//     fontSize: 22,
//     fontFamily: 'Roboto',
//     ),
//     ),
//     ],
//     ),
//     ),
//     body: Container(
//     decoration: BoxDecoration(
//     color: Color(0xFFF3E5F5), // Changed to purple 50
//     ),
//     child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Form(
//     key: formkey,
//     child: ListView(
//     children: [
//     _buildCard(
//     "About You... 🌟", // Added star emoji
//     Icons.face_rounded,
//     Column(
//     children: [
//     _buildAnimatedTextField(
//     controller: namecontroller,
//     hintText: "What's your name? ✨", // Added sparkle
//     labelText: "Your Lovely Name",
//     icon: Icons.person_outline_rounded,
//     validator: (value) {
//     if (value!.isEmpty) {
//     return "Enter 3-50 characters, alphabets only";
//     }
//     if (!RegExp(r"^[a-zA-Z\s'-]{3,50}$").hasMatch(value)) {
//     return "Enter 3-50 characters, alphabets only";
//     }
//     return null;
//     },
//     keyboardType: TextInputType.text,
//     inputFormatters: [
//     FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z\s-']+$")),
//     LengthLimitingTextInputFormatter(50),
//     ],
//     autofocus: true,
//     ),
//       _buildAnimatedTextField(
//         controller: emailcontroller,
//         keyboardType: TextInputType.emailAddress,
//         hintText: "Your email address 📧", // Added email emoji
//         labelText: "Email",
//         icon: Icons.email_rounded,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return "Enter a valid email address.";
//           }
//           if (!RegExp(
//               r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
//               .hasMatch(value)) {
//             return "Enter a valid email address.";
//           }
//           return null;
//         },
//       ),
//       _buildAnimatedTextField(
//         controller: mobileController,
//         hintText: "Your phone number 📱", // Added phone emoji
//         labelText: "Mobile",
//         icon: Icons.phone_iphone_rounded,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return "Enter a valid 10-digit mobile number.";
//           }
//           if (!RegExp(r"^\+?[0-9]{10}$").hasMatch(value)) {
//             return "Enter a valid 10-digit mobile number.";
//           }
//           return null;
//         },
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//           LengthLimitingTextInputFormatter(10),
//         ],
//       ),
//     ],
//     ),
//     ),
//       SizedBox(height: 16),
//       _buildCard(
//         "More About You... 🌈", // Added rainbow emoji
//         Icons.cake_rounded,
//         Column(
//           children: [
//             _buildDatePicker(
//               controller: dobController,
//               hintText: "When's your birthday? 🎂", // Added cake emoji
//               labelText: "Birthday",
//               icon: Icons.cake_rounded,
//             ),
//             _buildDropdown(
//               hintText: "Where are you from? 🏠", // Added house emoji
//               labelText: "Your City",
//               icon: Icons.location_city_rounded,
//               value: selectedCity,
//               items: _cities,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCity = value;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//       SizedBox(height: 16),
//       _buildCard(
//         "Gender And Hobbies... 🎨", // Added palette emoji
//         Icons.stars_rounded,
//         Column(
//           children: [
//             _buildRadioGroup(
//               label: "I am a... ✨",
//               groupValue: selectedGender,
//               values: ['Male', 'Female', 'Other'],
//               onChanged: (value) {
//                 setState(() {
//                   selectedGender = value!;
//                 });
//               },
//             ),
//             _buildCheckboxList(
//               label: "Things I Love 💜", // Changed to purple heart
//               options: hobbies,
//               selectedValues: selectedHobbies,
//             ),
//           ],
//         ),
//       ),
//       SizedBox(height: 16),
//       _buildCard(
//         "Keep it Safe... 🔒", // Added lock emoji
//         Icons.security_rounded,
//         Column(
//           children: [
//             _buildAnimatedTextField(
//               controller: passwordcontroller,
//               hintText: "Create a password ✨",
//               labelText: "Password",
//               icon: Icons.lock_rounded,
//               obscureText: true,
//               validator: (value) {
//                 if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
//                     .hasMatch(value!)) {
//                   return "Password must be 8+ chars, include a number & symbol.";
//                 }
//                 if (value!.isEmpty) {
//                   return 'Please Enter Password';
//                 }
//                 return null;
//               },
//             ),
//             _buildAnimatedTextField(
//               controller: confirmpasswordcontroller,
//               hintText: "Confirm your password 🔐", // Added locked emoji
//               labelText: "Confirm Password",
//               icon: Icons.lock_rounded,
//               obscureText: true,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please Enter Password';
//                 }
//                 if (value != passwordcontroller.text) {
//                   return "Passwords do not match";
//                 }
//                 return null;
//               },
//             ),
//           ],
//         ),
//       ),
//       SizedBox(height: 24),
//       _buildSubmitButton(),
//       SizedBox(height: 24),
//     ],
//     ),
//     ),
//     ),
//     ),
//     );
//   }
//   Widget _buildSubmitButton() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 32),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF9C27B0), // Changed to purple 500
//           padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 8,
//         ),
//         onPressed: () async {
//           if (formkey.currentState!.validate()) {
//             Map<String, dynamic> userData = {
//               'name': namecontroller.text.trim(),
//               'email': emailcontroller.text.trim(),
//               'mobile': mobileController.text.trim(),
//               'city': selectedCity ?? '',
//               'gender': selectedGender,
//               'hobbies': selectedHobbies.entries
//                   .where((entry) => entry.value)
//                   .map((entry) => entry.key)
//                   .toList()
//                   .join(','),
//               'dob': dobController.text.trim(),
//               'password': passwordcontroller.text.trim(),
//             };
//
//             if (widget.isEdit && widget.userData != null) {
//               final userId = widget.userData!['id'];
//               await DatabaseHelper.instance.updateUser(userData, userId);
//             } else {
//               await DatabaseHelper.instance.insertUser(userData);
//             }
//
//             Navigator.pop(context, true);
//           }
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(widget.isEdit ? Icons.check_circle : Icons.favorite,
//                 color: Colors.white),
//             SizedBox(width: 8),
//             Text(
//               widget.isEdit ? "✨ Save Changes ✨" : "✨ Join Now ✨",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCard(String title, IconData titleIcon, Widget content) {
//     return Card(
//       elevation: 8,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.purple.withOpacity(0.1), // Changed to purple
//               blurRadius: 10,
//               spreadRadius: 2,
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF3E5F5), // Changed to purple 50
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Icon(titleIcon, color: Color(0xFF9C27B0), size: 24), // Changed to purple 500
//                   ),
//                   SizedBox(width: 12),
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF9C27B0), // Changed to purple 500
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(color: Colors.purple[100], thickness: 1, height: 24),
//               content,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAnimatedTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//     bool obscureText = false,
//     String? Function(String?)? validator,
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//     bool autofocus = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         obscureText: _isObscured,
//         validator: validator,
//         keyboardType: keyboardType,
//         inputFormatters: inputFormatters,
//         autofocus: autofocus,
//         decoration: InputDecoration(
//           suffixIcon: obscureText
//               ? IconButton(
//             icon: Icon(
//               _isObscured ? Icons.visibility : Icons.visibility_off,
//               color: Colors.purple[300], // Changed to purple 300
//             ),
//             onPressed: () {
//               setState(() {
//                 _isObscured = !_isObscured;
//               });
//             },
//           )
//               : null,
//           prefixIcon: Icon(icon, color: Color(0xFF9C27B0)), // Changed to purple 500
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: TextStyle(color: Color(0xFF9C27B0)), // Changed to purple 500
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Color(0xFF9C27B0), width: 2), // Changed to purple 500
//           ),
//           filled: true,
//           fillColor: Colors.purple[50],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDatePicker({
//     required TextEditingController controller,
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         readOnly: true,
//         onTap: () async {
//           DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
//             firstDate: DateTime(1945),
//             lastDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
//             builder: (context, child) {
//               return Theme(
//                 data: Theme.of(context).copyWith(
//                   colorScheme: ColorScheme.light(
//                     primary: Color(0xFF9C27B0), // Changed to purple 500
//                     onPrimary: Colors.white,
//                     surface: Colors.purple[50]!,
//                     onSurface: Colors.black,
//                   ),
//                 ),
//                 child: child!,
//               );
//             },
//           );
//           if (pickedDate != null) {
//             setState(() {
//               controller.text =
//               "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//             });
//           }
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Color(0xFF9C27B0)), // Changed to purple 500
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: TextStyle(color: Color(0xFF9C27B0)), // Changed to purple 500
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Color(0xFF9C27B0), width: 2), // Changed to purple 500
//           ),
//           filled: true,
//           fillColor: Colors.purple[50],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdown({
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//     required String? value,
//     required List<String> items,
//     required Function(String?)? onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: Color(0xFF9C27B0)), // Changed to purple 500
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: TextStyle(color: Color(0xFF9C27B0)), // Changed to purple 500
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Color(0xFF9C27B0), width: 2), // Changed to purple 500
//           ),
//           filled: true,
//           fillColor: Colors.purple[50],
//         ),
//         items: items.map((item) {
//           return DropdownMenuItem(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildRadioGroup({
//     required String label,
//     required String groupValue,
//     required List<String> values,
//     required Function(String?)? onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF9C27B0), // Changed to purple 500
//             ),
//           ),
//           Row(
//             children: values.map((value) {
//               return Expanded(
//                 child: Row(
//                   children: [
//                     Radio<String>(
//                       value: value,
//                       groupValue: groupValue,
//                       onChanged: onChanged,
//                       activeColor: Color(0xFF9C27B0), // Changed to purple 500
//                     ),
//                     Text(value),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCheckboxList({
//     required String label,
//     required List<String> options,
//     required Map<String, bool> selectedValues,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF9C27B0), // Changed to purple 500
//           ),
//         ),
//         Wrap(
//           children: options.map((option) {
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Checkbox(
//                   value: selectedValues[option],
//                   onChanged: (bool? value) {
//                     setState(() {
//                       selectedValues[option] = value ?? false;
//                     });
//                   },
//                   activeColor: Color(0xFF9C27B0), // Changed to purple 500
//                 ),
//                 Text(option),
//               ],
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../Database/database_helper.dart';
//
// class Adduser extends StatefulWidget {
//   final bool isEdit;
//   final int? userIndex;
//   final Map<String, dynamic>? userData;
//   final List<Map<String, dynamic>> userDetailsList;
//
//   const Adduser({
//     super.key,
//     required this.isEdit,
//     this.userIndex,
//     this.userData,
//     required this.userDetailsList,
//   });
//
//   @override
//   _AdduserState createState() => _AdduserState();
// }
//
// class _AdduserState extends State<Adduser> {
//   final formkey = GlobalKey<FormState>();
//
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController confirmpasswordcontroller = TextEditingController();
//
//   final List<String> _cities = ['Ahmedabad', 'Porbandar', 'Rajkot', 'Baroda'];
//   String? selectedCity;
//
//   String selectedGender = 'Male';
//
//   final List<String> hobbies = ['Reading', 'Playing', 'Gaming', 'Writing'];
//   final Map<String, bool> selectedHobbies = {};
//   bool _isPasswordObscured = true;
//   bool _isConfirmPasswordObscured = true;
//
//   @override
//   void initState() {
//     super.initState();
//     for (var hobby in hobbies) {
//       selectedHobbies[hobby] = false;
//     }
//     if (widget.isEdit) {
//       namecontroller.text = widget.userData?['name'] ?? '';
//       emailcontroller.text = widget.userData?['email'] ?? '';
//       mobileController.text = widget.userData?['mobile'] ?? '';
//       dobController.text = widget.userData?['dob'] ?? '';
//       passwordcontroller.text = widget.userData?['password'] ?? '';
//       confirmpasswordcontroller.text = widget.userData?['password'] ?? '';
//       selectedCity = widget.userData?['city'];
//       selectedGender = widget.userData?['gender'] ?? '';
//
//       String hobbiesString = widget.userData?['hobbies'] ?? '';
//       if (hobbiesString.isNotEmpty) {
//         List<String> userHobbies = hobbiesString.split(',');
//         for (var hobby in hobbies) {
//           selectedHobbies[hobby] = userHobbies.contains(hobby);
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF3E5F5),
//       appBar: AppBar(
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF9C27B0), // purple 500
//                 Color(0xFFBA68C8), // purple 300
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.favorite, color: Colors.white, size: 24),
//             const SizedBox(width: 8),
//             Text(
//               widget.isEdit ? " Edit Profile " : " Create Profile ",
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontSize: 22,
//                 fontFamily: 'Roboto',
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Color(0xFFF3E5F5),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: formkey,
//             child: ListView(
//               children: [
//                 _buildCard(
//                   "About You... ",
//                   Icons.face_rounded,
//                   Column(
//                     children: [
//                       _buildAnimatedTextField(
//                         controller: namecontroller,
//                         hintText: "What's your name? ",
//                         labelText: "Your Lovely Name",
//                         icon: Icons.person_outline_rounded,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter 3-50 characters, alphabets only";
//                           }
//                           if (!RegExp(r"^[a-zA-Z\s'-]{3,50}$").hasMatch(value)) {
//                             return "Enter 3-50 characters, alphabets only";
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.text,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z\s-']+$")),
//                           LengthLimitingTextInputFormatter(50),
//                         ],
//                         autofocus: true,
//                       ),
//                       _buildAnimatedTextField(
//                         controller: emailcontroller,
//                         keyboardType: TextInputType.emailAddress,
//                         hintText: "Your email address ",
//                         labelText: "Email",
//                         icon: Icons.email_rounded,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter a valid email address.";
//                           }
//                           if (!RegExp(
//                               r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
//                               .hasMatch(value)) {
//                             return "Enter a valid email address.";
//                           }
//                           return null;
//                         },
//                       ),
//                       _buildAnimatedTextField(
//                         controller: mobileController,
//                         hintText: "Your phone number ",
//                         labelText: "Mobile",
//                         icon: Icons.phone_iphone_rounded,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Enter a valid 10-digit mobile number.";
//                           }
//                           if (!RegExp(r"^\+?[0-9]{10}$").hasMatch(value)) {
//                             return "Enter a valid 10-digit mobile number.";
//                           }
//                           return null;
//                         },
//                         keyboardType: TextInputType.number,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(10),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildCard(
//                   "More About You... ",
//                   Icons.cake_rounded,
//                   Column(
//                     children: [
//                       _buildDatePicker(
//                         controller: dobController,
//                         hintText: "When's your birthday? ",
//                         labelText: "Birthday",
//                         icon: Icons.cake_rounded,
//                       ),
//                       _buildDropdown(
//                         hintText: "Where are you from? ",
//                         labelText: "Your City",
//                         icon: Icons.location_city_rounded,
//                         value: selectedCity,
//                         items: _cities,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedCity = value;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildCard(
//                   "Gender And Hobbies... ",
//                   Icons.stars_rounded,
//                   Column(
//                     children: [
//                       _buildRadioGroup(
//                         label: "I am a... ",
//                         groupValue: selectedGender,
//                         values: ['Male', 'Female', 'Other'],
//                         onChanged: (value) {
//                           setState(() {
//                             selectedGender = value!;
//                           });
//                         },
//                       ),
//                       _buildCheckboxList(
//                         label: "Things I Love ",
//                         options: hobbies,
//                         selectedValues: selectedHobbies,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 _buildCard(
//                   "Keep it Safe... ",
//                   Icons.security_rounded,
//                   Column(
//                     children: [
//                       _buildAnimatedTextField(
//                         controller: passwordcontroller,
//                         hintText: "Create a password ",
//                         labelText: "Password",
//                         icon: Icons.lock_rounded,
//                         obscureText: true,
//                         isObscured: _isPasswordObscured,
//                         toggleObscure: () {
//                           setState(() {
//                             _isPasswordObscured = !_isPasswordObscured;
//                           });
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
//                               .hasMatch(value)) {
//                             return "Password must be 8+ chars, include a number & symbol.";
//                           }
//                           return null;
//                         },
//                       ),
//                       _buildAnimatedTextField(
//                         controller: confirmpasswordcontroller,
//                         hintText: "Confirm your password ",
//                         labelText: "Confirm Password",
//                         icon: Icons.lock_rounded,
//                         obscureText: true,
//                         isObscured: _isConfirmPasswordObscured,
//                         toggleObscure: () {
//                           setState(() {
//                             _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
//                           });
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           if (value != passwordcontroller.text) {
//                             return "Passwords do not match";
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 _buildSubmitButton(),
//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmitButton() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 32),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF9C27B0),
//           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           elevation: 8,
//         ),
//         onPressed: () async {
//           if (formkey.currentState!.validate()) {
//             Map<String, dynamic> userData = {
//               'name': namecontroller.text.trim(),
//               'email': emailcontroller.text.trim(),
//               'mobile': mobileController.text.trim(),
//               'city': selectedCity ?? '',
//               'gender': selectedGender,
//               'hobbies': selectedHobbies.entries
//                   .where((entry) => entry.value)
//                   .map((entry) => entry.key)
//                   .toList()
//                   .join(','),
//               'dob': dobController.text.trim(),
//               'password': passwordcontroller.text.trim(),
//             };
//
//             if (widget.isEdit && widget.userData != null) {
//               final userId = widget.userData!['id'];
//               await DatabaseHelper.instance.updateUser(userData, userId);
//             } else {
//               await DatabaseHelper.instance.insertUser(userData);
//             }
//
//             Navigator.pop(context, true);
//           }
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(widget.isEdit ? Icons.check_circle : Icons.favorite,
//                 color: Colors.white),
//             const SizedBox(width: 8),
//             Text(
//               widget.isEdit ? " Save Changes " : " Create Profile  ",
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCard(String title, IconData titleIcon, Widget content) {
//     return Card(
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.purple.shade50],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.purple.withOpacity(0.15),
//               blurRadius: 12,
//               spreadRadius: 3,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF3E5F5),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child:
//                     Icon(titleIcon, color: const Color(0xFF9C27B0), size: 28),
//                   ),
//                   const SizedBox(width: 16),
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF9C27B0),
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 color: Colors.purple[100],
//                 thickness: 1.5,
//                 height: 30,
//               ),
//               content,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAnimatedTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//     bool obscureText = false,
//     bool? isObscured,             // New optional parameter
//     VoidCallback? toggleObscure,  // New optional parameter
//     String? Function(String?)? validator,
//     TextInputType? keyboardType,
//     List<TextInputFormatter>? inputFormatters,
//     bool autofocus = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         // Use the passed isObscured if provided; otherwise fall back to false.
//         obscureText: obscureText ? (isObscured ?? false) : false,
//         validator: validator,
//         keyboardType: keyboardType,
//         inputFormatters: inputFormatters,
//         autofocus: autofocus,
//         decoration: InputDecoration(
//           // If the field is marked obscureText and a toggleObscure callback is provided,
//           // show the suffix icon.
//           suffixIcon: obscureText && toggleObscure != null
//               ? IconButton(
//             icon: Icon(
//               (isObscured ?? false) ? Icons.visibility : Icons.visibility_off,
//               color: Colors.purple[300],
//             ),
//             onPressed: toggleObscure,
//           )
//               : null,
//           prefixIcon: Icon(icon, color: const Color(0xFF9C27B0)),
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: const TextStyle(color: Color(0xFF9C27B0)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: const Color(0xFF9C27B0), width: 2),
//           ),
//           filled: true,
//           fillColor: Colors.pink[50],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDatePicker({
//     required TextEditingController controller,
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: TextFormField(
//         controller: controller,
//         readOnly: true,
//         onTap: () async {
//           DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
//             firstDate: DateTime(1945),
//             lastDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
//             builder: (context, child) {
//               return Theme(
//                 data: Theme.of(context).copyWith(
//                   colorScheme: ColorScheme.light(
//                     primary: const Color(0xFF9C27B0),
//                     onPrimary: Colors.white,
//                     surface: Colors.purple.shade50,
//                     onSurface: Colors.black,
//                   ),
//                 ),
//                 child: child!,
//               );
//             },
//           );
//           if (pickedDate != null) {
//             setState(() {
//               controller.text =
//               "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//             });
//           }
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: const Color(0xFF9C27B0)),
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: const TextStyle(color: Color(0xFF9C27B0)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: const BorderSide(color: Color(0xFF9C27B0), width: 2),
//           ),
//           filled: true,
//           fillColor: Colors.purple[50],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDropdown({
//     required String hintText,
//     required String labelText,
//     required IconData icon,
//     required String? value,
//     required List<String> items,
//     required Function(String?)? onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           prefixIcon: Icon(icon, color: const Color(0xFF9C27B0)),
//           hintText: hintText,
//           labelText: labelText,
//           labelStyle: const TextStyle(color: Color(0xFF9C27B0)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: BorderSide(color: Colors.purple[200]!),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(25),
//             borderSide: const BorderSide(color: Color(0xFF9C27B0), width: 2),
//           ),
//           filled: true,
//           fillColor: Colors.purple[50],
//         ),
//         items: items.map((item) {
//           return DropdownMenuItem(
//             value: item,
//             child: Text(item),
//           );
//         }).toList(),
//       ),
//     );
//   }
//
//   Widget _buildRadioGroup({
//     required String label,
//     required String groupValue,
//     required List<String> values,
//     required Function(String?)? onChanged,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF9C27B0),
//             ),
//           ),
//           Row(
//             children: values.map((value) {
//               return Expanded(
//                 child: Row(
//                   children: [
//                     Radio<String>(
//                       value: value,
//                       groupValue: groupValue,
//                       onChanged: onChanged,
//                       activeColor: const Color(0xFF9C27B0),
//                     ),
//                     Text(value),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCheckboxList({
//     required String label,
//     required List<String> options,
//     required Map<String, bool> selectedValues,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF9C27B0),
//           ),
//         ),
//         Wrap(
//           children: options.map((option) {
//             return Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Checkbox(
//                   value: selectedValues[option],
//                   onChanged: (bool? value) {
//                     setState(() {
//                       selectedValues[option] = value ?? false;
//                     });
//                   },
//                   activeColor: const Color(0xFF9C27B0),
//                 ),
//                 Text(option),
//               ],
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../ApiService/api_service.dart';
import '../Database/database_helper.dart';

class Adduser extends StatefulWidget {
  final bool isEdit;
  final int? userIndex;
  final Map<String, dynamic>? userData;
  final List<Map<String, dynamic>> userDetailsList;


  const Adduser({
    super.key,
    required this.isEdit,
    this.userIndex,
    this.userData,
    required this.userDetailsList,
  });

  @override
  _AdduserState createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  final formkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  final List<String> _cities = ['Ahmedabad', 'Porbandar', 'Rajkot', 'Baroda'];
  String? selectedCity;
  String selectedGender = 'Male';
  final List<String> hobbies = ['Reading', 'Playing', 'Gaming', 'Writing'];
  final Map<String, bool> selectedHobbies = {};
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;
  @override
  void initState() {
    super.initState();
    for (var hobby in hobbies) {
      selectedHobbies[hobby] = false;
    }
    if (widget.isEdit) {
      namecontroller.text = widget.userData?['name'] ?? '';
      emailcontroller.text = widget.userData?['email'] ?? '';
      mobileController.text = widget.userData?['mobile'] ?? '';
      dobController.text = widget.userData?['dob'] ?? '';
      passwordcontroller.text = widget.userData?['password'] ?? '';
      confirmpasswordcontroller.text = widget.userData?['password'] ?? '';
      selectedCity = widget.userData?['city'];
      selectedGender = widget.userData?['gender'] ?? '';

      String hobbiesString = widget.userData?['hobbies'] ?? '';
      if (hobbiesString.isNotEmpty) {
        List<String> userHobbies = hobbiesString.split(',');
        for (var hobby in hobbies) {
          selectedHobbies[hobby] = userHobbies.contains(hobby);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[50]!,
              Colors.purple[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: _buildForm(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        bottom: 20,
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white70],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Text(
              widget.isEdit ? '✨ Edit Profile ✨' : '✨ Create Profile ✨',
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
          ),
        ],
      ),
    );
  }
  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formkey,
        child: ListView(
          children: [
            _buildCard(
              "About You... ✨",
              Icons.face_rounded,
              Column(
                children: [
                  _buildAnimatedTextField(
                    controller: namecontroller,
                    hintText: "What's your name?",
                    labelText: "Your Lovely Name",
                    icon: Icons.person_outline_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter 3-50 characters, alphabets only";
                      }
                      if (!RegExp(r"^[a-zA-Z\s'-]{3,50}$").hasMatch(value)) {
                        return "Enter 3-50 characters, alphabets only";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"^[a-zA-Z\s-']+$")),
                      LengthLimitingTextInputFormatter(50),
                    ],
                    autofocus: true,
                  ),
                  _buildAnimatedTextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Your email address",
                    labelText: "Email",
                    icon: Icons.email_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid email address.";
                      }
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                          .hasMatch(value)) {
                        return "Enter a valid email address.";
                      }
                      return null;
                    },
                  ),
                  _buildAnimatedTextField(
                    controller: mobileController,
                    hintText: "Your phone number",
                    labelText: "Mobile",
                    icon: Icons.phone_iphone_rounded,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid 10-digit mobile number.";
                      }
                      if (!RegExp(r"^\+?[0-9]{10}$").hasMatch(value)) {
                        return "Enter a valid 10-digit mobile number.";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildCard(
              "More About You... 💫",
              Icons.cake_rounded,
              Column(
                children: [
                  _buildDatePicker(
                    controller: dobController,
                    hintText: "When's your birthday?",
                    labelText: "Birthday",
                    icon: Icons.cake_rounded,
                  ),
                  _buildDropdown(
                    hintText: "Where are you from?",
                    labelText: "Your City",
                    icon: Icons.location_city_rounded,
                    value: selectedCity,
                    items: _cities,
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildCard(
              "Gender And Hobbies... 🌟",
              Icons.stars_rounded,
              Column(
                children: [
                  _buildRadioGroup(
                    label: "I am a...",
                    groupValue: selectedGender,
                    values: ['Male', 'Female', 'Other'],
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                  ),
                  _buildCheckboxList(
                    label: "Things I Love",
                    options: hobbies,
                    selectedValues: selectedHobbies,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildCard(
              "Keep it Safe... 🔒",
              Icons.security_rounded,
              Column(
                children: [
                  _buildAnimatedTextField(
                    controller: passwordcontroller,
                    hintText: "Create a password",
                    labelText: "Password",
                    icon: Icons.lock_rounded,
                    obscureText: true,
                    isObscured: _isPasswordObscured,
                    toggleObscure: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                          .hasMatch(value)) {
                        return "Password must be 8+ chars, include a number & symbol.";
                      }
                      return null;
                    },
                  ),
                  _buildAnimatedTextField(
                    controller: confirmpasswordcontroller,
                    hintText: "Confirm your password",
                    labelText: "Confirm Password",
                    icon: Icons.lock_rounded,
                    obscureText: true,
                    isObscured: _isConfirmPasswordObscured,
                    toggleObscure: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value != passwordcontroller.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSubmitButton(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  // Widget _buildSubmitButton() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 32),
  //     child: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color(0xFF6A1B9A), // Deep Purple 700
  //         padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         elevation: 8,
  //         shadowColor: Colors.purple.withOpacity(0.5),
  //       ),
  //       onPressed: () async {
  //         if (formkey.currentState!.validate()) {
  //           Map<String, dynamic> userData = {
  //             'name': namecontroller.text.trim(),
  //             'email': emailcontroller.text.trim(),
  //             'mobile': mobileController.text.trim(),
  //             'city': selectedCity ?? '',
  //             'gender': selectedGender,
  //             'hobbies': selectedHobbies.entries
  //                 .where((entry) => entry.value)
  //                 .map((entry) => entry.key)
  //                 .toList()
  //                 .join(','),
  //             'dob': dobController.text.trim(),
  //             'password': passwordcontroller.text.trim(),
  //           };
  //
  //           if (widget.isEdit && widget.userData != null) {
  //             final userId = widget.userData!['id'];
  //             await DatabaseHelper.instance.updateUser(userData, userId);
  //           } else {
  //             await DatabaseHelper.instance.insertUser(userData);
  //           }
  //
  //           final message = widget.isEdit
  //               ? "✨ Profile updated successfully! ✨"
  //               : "🎉 User added successfully! 🎉";
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               content: Text(
  //                 message,
  //                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //               backgroundColor: Colors.purpleAccent,
  //               behavior: SnackBarBehavior.floating,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(15),
  //               ),
  //               duration: const Duration(seconds: 2),
  //             ),
  //           );
  //
  //           Navigator.pop(context, true);
  //         }
  //       },
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             widget.isEdit ? Icons.check_circle : Icons.favorite,
  //             color: Colors.white,
  //             size: 24,
  //           ),
  //           const SizedBox(width: 12),
  //           Text(
  //             widget.isEdit ? "✨ Save Changes ✨" : "✨ Join Now ✨",
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //               fontSize: 18,
  //               letterSpacing: 1,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A1B9A),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8,
          shadowColor: Colors.purple.withOpacity(0.5),
        ),
        onPressed: () async {
          if (formkey.currentState!.validate()) {
            Map<String, dynamic> userData = {
              'name': namecontroller.text.trim(),
              'email': emailcontroller.text.trim(),
              'mobile': mobileController.text.trim(),
              'city': selectedCity ?? '',
              'gender': selectedGender,
              'hobbies': selectedHobbies.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList()
                  .join(','),
              'dob': dobController.text.trim(),
              'password': passwordcontroller.text.trim(),
            };

            try {
              if (widget.isEdit && widget.userIndex != null) {
                // Update user via API
                await ApiService().updateUser(widget.userIndex!, userData);
              } else {
                // Add new user via API
                await ApiService().addUser(userData);
              }

              final message = widget.isEdit
                  ? "✨ Profile updated successfully! ✨"
                  : "🎉 User added successfully! 🎉";
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.purpleAccent,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );

              Navigator.pop(context, true); // Return true to trigger refresh in Userlist
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "❌ Error: ${e.toString()}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.redAccent,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.isEdit ? Icons.check_circle : Icons.favorite,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              widget.isEdit ? "✨ Save Changes ✨" : "✨ Join Now ✨",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData titleIcon, Widget content) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.purple.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.15),
              blurRadius: 12,
              spreadRadius: 3,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF6A1B9A).withOpacity(0.2),
                      ),
                    ),
                    child: Icon(
                      titleIcon,
                      color: const Color(0xFF6A1B9A),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6A1B9A),
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.purple[100],
                thickness: 1.5,
                height: 30,
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    bool? isObscured,
    VoidCallback? toggleObscure,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool autofocus = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ? (isObscured ?? false) : false,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autofocus: autofocus,
        decoration: InputDecoration(
          suffixIcon: obscureText && toggleObscure != null
              ? IconButton(
            icon: Icon(
              (isObscured ?? false) ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF6A1B9A),
            ),
            onPressed: toggleObscure,
          )
              : null,
          prefixIcon: Icon(icon, color: const Color(0xFF6A1B9A)),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
          filled: true,
          fillColor: Colors.purple[50],
        ),
      ),
    );
  }

  Widget _buildDatePicker({
    required TextEditingController controller,
    required String hintText,
    required String labelText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "Please select your birthday";
          }
          return null;
        },
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
            firstDate: DateTime(1945),
            lastDate: DateTime(2007, DateTime.now().month, DateTime.now().day),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: const Color(0xFF6A1B9A),
                    onPrimary: Colors.white,
                    surface: Colors.purple[50]!,
                    onSurface: Colors.black,
                  ),
                ),
                child: child!,
              );
            },
          );
          if (pickedDate != null) {
            setState(() {
              // controller.text =
              // "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
            });
          }
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF6A1B9A)),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
          filled: true,
          fillColor: Colors.purple[50],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hintText,
    required String labelText,
    required IconData icon,
    required String? value,
    required List<String> items,
    required Function(String?)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return "Please select your city";
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color(0xFF6A1B9A)),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: Color(0xFF6A1B9A)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.purple[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF6A1B9A), width: 2),
          ),
          filled: true,
          fillColor: Colors.purple[50],
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(color: Color(0xFF6A1B9A)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRadioGroup({
    required String label,
    required String groupValue,
    required List<String> values,
    required Function(String?)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A1B9A),
            ),
          ),
          Row(
            children: values.map((value) {
              return Expanded(
                child: Row(
                  children: [
                    Radio<String>(
                      value: value,
                      groupValue: groupValue,
                      onChanged: onChanged,
                      activeColor: const Color(0xFF6A1B9A),
                    ),
                    Text(
                      value,
                      style: const TextStyle(color: Color(0xFF6A1B9A)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxList({
    required String label,
    required List<String> options,
    required Map<String, bool> selectedValues,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6A1B9A),
          ),
        ),
        Wrap(
          children: options.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: selectedValues[option],
                  onChanged: (bool? value) {
                    setState(() {
                      selectedValues[option] = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF6A1B9A),
                ),
                Text(
                  option,
                  style: const TextStyle(color: Color(0xFF6A1B9A)),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}