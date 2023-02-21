// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:lab1/services/databse_service.dart';
// import 'package:lab1/utils/helper/helper_function.dart';

// class AuthService {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   Future registerUserWithEmailAndPassword(
//       String userName, String email, String password) async {
//     // handle to not add more than onece
//     try {
//       User user = (await firebaseAuth.createUserWithEmailAndPassword(
//               email: email, password: password))
//           .user!;

//       if (user != null) {
//         await DatabaseService(userId: user.uid).updateUserData(
//           userName: userName,
//           email: email,
//         );
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       return e;
//     }
//   }

//   Future signOut() async {
//     try {
//       await HelperFunctions.setUserLoggedInStatus(false);
//       await HelperFunctions.saveEmailSF("");
//       await HelperFunctions.saveUserNameSF("");
//       await firebaseAuth.signOut();
//     } catch (e) {
//       return null;
//     }
//   }
// }
