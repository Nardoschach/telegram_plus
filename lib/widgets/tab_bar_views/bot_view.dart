import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:telegram_plus/models/channel.dart';
import 'package:telegram_plus/widgets/chat_tile.dart';

class BotView extends StatefulWidget {
  const BotView({super.key});

  @override
  State<BotView> createState() => _BotViewState();
}

class _BotViewState extends State<BotView> {
  @override
  Widget build(BuildContext context) {
    //
    // var id = FirebaseAuth.instance.currentUser;
    // var dbs = DatabaseService(userId: id!.uid);

    //
    return Container();
    // return Container(
    //     child:

    //         // StreamBuilder(
    //         //   stream: dbs.getChannels("nardos"),
    //         //   builder: (context, snapshot) {
    //         //     print(snapshot.data![0].admin);
    //         //     return ListView(
    //         //       children: snapshot.data!
    //         //           .map((channel) => ListTile(title: Text(channel.channelName)))
    //         //           .toList(),
    //         //     );
    //         //   },
    //         // ),

    //         StreamBuilder(
    //             stream: dbs.getChannels("nardos"),
    //             builder: (context, snapshot) {
    //               if (snapshot.hasData) {
    //                 if (snapshot.data != null) {
    //                   if (snapshot.data!.docs.length != 0) {
    //                     return ListView.builder(
    //                         itemCount: snapshot.data!.docs.length,
    //                         itemBuilder: (context, index) {
    //                           var doc = snapshot.data!.docs[index].data()
    //                               as Map<String, dynamic>;
    //                           return ChatTile(
    //                               text: doc["text"] as String,
    //                               time: doc["time"] as String,
    //                               userName: doc["channelName"] as String,
    //                               withSeenIcon: false,
    //                               withOnlineIcon: false);
    //                         });
    //                   } else
    //                     return Container();
    //                 } else
    //                   return Container();
    //               } else
    //                 return Container();
    //             })

    //     // StreamBuilder(
    //     //     stream: dbs.getChannels("nardos"),
    //     //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     //       if (snapshot.hasError) {
    //     //         return Text("error");
    //     //       }
    //     //       if (snapshot.connectionState == ConnectionState.waiting) {
    //     //         return Text("loading");
    //     //       }
    //     //       return ListView(
    //     //         children:
    //     //             snapshot.data!.docs.map((QueryDocumentSnapshot document) {
    //     //           Map<String, dynamic> data =
    //     //               document.data()! as Map<String, dynamic>;
    //     //           return ChatTile(
    //     //               text: data["text"] as String,
    //     //               time: data["time"] as String,
    //     //               userName: data["channelName"] as String,
    //     //               withSeenIcon: false,
    //     //               withOnlineIcon: false);
    //     //         }).toList(),
    //     //       );
    //     //     }),
    //     );
  }
}
