// import 'dart:async';

// import 'package:lab1/models/chat_table.dart';
// import 'package:lab1/models/phone_number.dart';
// import 'package:lab1/models/user.dart';

// class AppStore {
//   late ChatStore _chatStore;
//   late User _appUser;

//   StreamController<ChatStore> chatNotifier = StreamController.broadcast();
//   StreamController<User> appUserNotifier = StreamController.broadcast();

//   AppStore() {
//     _chatStore = ChatStore(
//       messageCount: newMessageCount(),
//     );
//     _appUser = User(
//       firstName: "Nardos",
//       username: "Tsegaye", // set it to optional
//       phoneNumber: PhoneNumber("+251", "934552343"),
//       isActive: true,
//     );

//     ///
//     Future.delayed(Duration(milliseconds: 500), () {
//       chatNotifier.add(_chatStore);
//     });
//   }

//   ChatStore get chatTable => _chatStore;

//   set chatTable(ChatStore c) {
//     _chatStore = c;
//     chatNotifier.add(c);
//   }

//   User get appUser => _appUser;

//   set appUser(User u) {
//     _appUser = u;
//     appUserNotifier.add(u);
//   }
// }
