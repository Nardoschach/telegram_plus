// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lab1/services/auth_service.dart';
// import 'package:lab1/utils/helper/helper_function.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final formKey = GlobalKey<FormState>();
//   AuthService authService = AuthService();
//   bool _isLoading = false;
//   String userName = "";
//   String email = "";
//   String password = "";
//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(color: Colors.yellow),
//             )
//           : Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   const Text("User name"),
//                   TextFormField(
//                     onChanged: (value) {
//                       userName = value;
//                     },
//                     validator: (value) {
//                       if (value != null) {
//                         return null;
//                       } else {
//                         return "user name needed";
//                       }
//                     },
//                   ),
//                   const Text("Your email "),
//                   TextFormField(
//                     onChanged: (value) {
//                       email = value;
//                     },
//                     validator: (value) {
//                       if (value != null) {
//                         return null;
//                       } else {
//                         return "email needed";
//                       }
//                     },
//                   ),
//                   const Text("password"),
//                   TextFormField(
//                     onChanged: (value) {
//                       password = value;
//                     },
//                     validator: (value) {
//                       if (value != null) {
//                         return null;
//                       } else {
//                         return "password needed";
//                       }
//                     },
//                   ),
//                   ElevatedButton(
//                     onPressed: register,
//                     child: Text("sign up"),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   register() async {
//     if (formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _isLoading = true;
//       });
//       await authService
//           .registerUserWithEmailAndPassword(userName, email, password)
//           .then((value) async {
//         if (value == true) {
//           await HelperFunctions.setUserLoggedInStatus(true);
//           await HelperFunctions.saveUserNameSF(userName);
//           await HelperFunctions.saveEmailSF(email);
//           setState(() {
//             Navigator.pushNamed(context, "/home"); //
//           });
//         } else {
//           setState(() {
//             _isLoading = false;
//           });
//         }
//       });
//     }
//   }
// }
