// import 'package:lab1/models/channel.dart';
// import 'package:lab1/models/group.dart';
// import 'package:lab1/models/phone_number.dart';
// import 'package:lab1/models/user.dart';
// import 'package:lab1/utils/constants.dart';

// Map<ImageTitle, String> sender_images = {
//   ImageTitle.mulesport: "assets/images/sender_images/mulesport.jpg",
//   ImageTitle.atc: "assets/images/sender_images/atc.jpg",
//   ImageTitle.awaqi: "assets/images/sender_images/awaqi.jpg",
//   ImageTitle.ethiotel: "assets/images/sender_images/ethiotel.jpg",
//   ImageTitle.fashintera: "assets/images/sender_images/fashintera.jpg",
//   ImageTitle.se2012: "assets/images/sender_images/se2012.jpg",
//   ImageTitle.telebirr: "assets/images/sender_images/telebirr.jpg",
//   ImageTitle.tikvah: "assets/images/sender_images/tikvah.jpg",
//   ImageTitle.yenetube: "assets/images/sender_images/yenetube.jpg",
//   ImageTitle.user1: "assets/images/sender_images/user1m.jpeg",
//   ImageTitle.user2: "assets/images/sender_images/user2f.jpeg",
//   ImageTitle.user3: "assets/images/sender_images/user3m.jpeg",
//   ImageTitle.user4: "assets/images/sender_images/user4f.jpeg",
//   ImageTitle.user5: "assets/images/sender_images/user5f.jpeg",
//   ImageTitle.user6: "assets/images/sender_images/user6m.jpeg",
//   ImageTitle.user7: "assets/images/sender_images/user7f.jpeg",
//   ImageTitle.user8: "assets/images/sender_images/user8f.jpeg",
//   ImageTitle.user9: "assets/images/sender_images/user9f.jpeg",
//   ImageTitle.user10: "assets/images/sender_images/user10m.jpeg",
//   ImageTitle.user11: "assets/images/sender_images/user11m.jpeg",
//   ImageTitle.user12: "assets/images/sender_images/user12f.jpeg",
//   ImageTitle.user13: "assets/images/sender_images/user13m.jpeg",
//   ImageTitle.user14: "assets/images/sender_images/user14.jpeg",
//   ImageTitle.user15: "assets/images/sender_images/user15m.jpeg",
// };

// var message_photos = {
//   ImageTitle.act1: "assets/images/message_images/atc1.jpg",
//   ImageTitle.act2: "assets/images/message_images/atc2.jpg",
//   ImageTitle.act3: "assets/images/message_images/atc3.jpg",
//   ImageTitle.act4: "assets/images/message_images/atc4.jpg",
//   ImageTitle.act5: "assets/images/message_images/atc5.jpg",
//   ImageTitle.sport1: "assets/images/message_images/sport1.jpg",
//   ImageTitle.sport2: "assets/images/message_images/sport2.jpg",
//   ImageTitle.sport3: "assets/images/message_images/sport3.jpg",
//   ImageTitle.sport4: "assets/images/message_images/sport4.jpg",
//   ImageTitle.sport5a: "assets/images/message_images/sport5a.jpg",
//   ImageTitle.sport5b: "assets/images/message_images/sport5b.jpg",
//   ImageTitle.tik1: "assets/images/message_images/tik1.jpg",
//   ImageTitle.tik2: "assets/images/message_images/tik2.jpg",
//   ImageTitle.tik3: "assets/images/message_images/tik3.jpg",
//   ImageTitle.tik4: "assets/images/message_images/tik4.jpg",
//   ImageTitle.tik5: "assets/images/message_images/tik5.jpg",
//   ImageTitle.userMessage1: "assets/images/message_images/user1.jpg",
//   ImageTitle.userMessage2: "assets/images/message_images/user2.jpg",
//   ImageTitle.userMessage3: "assets/images/message_images/user3.jpg",
// };

// var users = [
//   User(
//     firstName: "User",
//     username: "1",
//     phoneNumber: PhoneNumber("+251", "96978566"),
//     isActive: false,
//   ).profilePictures.addAll(
//     [
//       sender_images[ImageTitle.userMessage1]!,
//       sender_images[ImageTitle.userMessage2]!,
//       sender_images[ImageTitle.user1]!,
//     ],
//   ),
//   User(
//     firstName: "User",
//     username: "2",
//     phoneNumber: PhoneNumber("+251", "98765555"),
//     isActive: false,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user2]!,
//       ),
//   User(
//     firstName: "User",
//     username: "3",
//     phoneNumber: PhoneNumber("+251", "1237907"),
//     isActive: true,
//   )..profilePictures.add(
//       sender_images[ImageTitle.user3]!,
//     ),
//   User(
//     firstName: "User",
//     username: "4",
//     phoneNumber: PhoneNumber("+251", "0987635"),
//     isActive: false,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user4]!,
//       ),
//   User(
//     firstName: "User",
//     username: "5",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   )..profilePictures.add(
//       sender_images[ImageTitle.user5]!,
//     ),
//   User(
//     firstName: "User",
//     username: "6",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user6]!,
//       ),
//   User(
//     firstName: "User",
//     username: "7",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user7]!,
//       ),
//   User(
//     firstName: "User",
//     username: "8",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user8]!,
//       ),
//   User(
//     firstName: "User",
//     username: "9",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user9]!,
//       ),
//   User(
//     firstName: "User",
//     username: "10",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user10]!,
//       ),
//   User(
//     firstName: "User",
//     username: "11",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user11]!,
//       ),
//   User(
//     firstName: "User",
//     username: "12",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user12]!,
//       ),
//   User(
//     firstName: "User",
//     username: "13",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user13]!,
//       ),
//   User(
//     firstName: "User",
//     username: "14",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user14]!,
//       ),
//   User(
//     firstName: "User",
//     username: "15",
//     phoneNumber: PhoneNumber("+251", "87544445"),
//     isActive: true,
//   ).profilePictures.add(
//         sender_images[ImageTitle.user15]!,
//       ),
// ];

// var groups = [
//   Group(members: 30294, name: "SE 2012", id: 6, type: GroupType.basicGroup)
//       .profilePictures
//       .add(
//         sender_images[ImageTitle.se2012]!,
//       ),
// ];

// var channels = [
//   Channel(subscribers: 2256, name: "ATC NEWS", id: 1)
//     ..profilePictures.add(
//       sender_images[ImageTitle.atc]!,
//     ),
//   Channel(subscribers: 22313, name: "Mule SPORT", id: 2).profilePictures.add(
//         sender_images[ImageTitle.mulesport]!,
//       ),
//   Channel(subscribers: 125456, name: "TIKVAH", id: 3).profilePictures.add(
//         sender_images[ImageTitle.tikvah]!,
//       ),
//   Channel(subscribers: 3434, name: "Awaqi", id: 4).profilePictures.add(
//         sender_images[ImageTitle.awaqi]!,
//       ),
//   Channel(subscribers: 3434, name: "Ethiotel", id: 5).profilePictures.add(
//         sender_images[ImageTitle.ethiotel]!,
//       ),
//   Channel(subscribers: 30294, name: "Fashin Tera", id: 4).profilePictures.add(
//         sender_images[ImageTitle.fashintera]!,
//       ),
//   Channel(subscribers: 30294, name: "tele Birr", id: 8).profilePictures.add(
//         sender_images[ImageTitle.telebirr]!,
//       ),
// ];
