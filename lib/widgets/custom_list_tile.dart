// import 'package:flutter/material.dart';
// import 'package:mynotes/pages/channel_page.dart';

// class CustomListTile extends StatefulWidget {
//   final String title;
//   final String time;
//   final String subTitle;
//   final String? image;
//   final IconData? icon;
//   const CustomListTile(
//       {Key? key,
//       required this.title,
//       required this.subTitle,
//       required this.time,
//       this.icon,
//       this.image})
//       : super(key: key);

//   @override
//   State<CustomListTile> createState() => _CustomListTileState();
// }

// class _CustomListTileState extends State<CustomListTile> {
//   @override
//   Widget build(BuildContext context) {
//     var initial = widget.title.substring(0, 2).toUpperCase();
//     return ListTile(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return ChannelPage(); ////////////////////////////
//             },
//           ),
//         );
//       },
//       leading: CircleAvatar(
//         radius: 31,
//         foregroundImage: AssetImage("assets/images/image1.jpg"),
//         //widget.image != null ? AssetImage(widget.image!) : null,
//         child: Text(initial),
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             child: Row(
//               children: [
//                 Icon(widget.icon),
//                 Text(
//                   widget.title,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             widget.time,
//             style:
//                 TextStyle(color: Color.fromARGB(255, 90, 88, 88), fontSize: 14),
//           ),
//         ],
//       ),
//       subtitle: Padding(
//         padding: const EdgeInsets.only(top: 5, bottom: 3),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             SizedBox(
//               width: 250, // need to be flexable
//               child: Text(
//                 widget.subTitle,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 6, top: 3, right: 6, bottom: 3),
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 45, 255, 21), //color is variable
//                 borderRadius: BorderRadius.all(Radius.circular(15)),
//               ),
//               margin: EdgeInsets.only(left: 3),
//               child: Text(
//                 "150",
//                 style: TextStyle(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /*
// *
// *
// *
// *
// *
// *
// *
// *
//  */

