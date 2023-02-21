import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/events/message_events.dart';
import 'package:telegram_plus/pages/chat_page.dart';
import 'package:telegram_plus/utils/constants.dart';
import 'package:telegram_plus/widgets/chat_tile.dart';

class PrivateView extends StatelessWidget {
  const PrivateView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: AppStateContainer.of(context)
            .blockProvider
            .appBloc
            .privateChatsCached,
        stream:
            AppStateContainer.of(context).blockProvider.appBloc.privateChats,
        builder: (context, snapshot) {
          var chatList = snapshot.data!.values.toList();
          return ListView.separated(
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              var chat = chatList[index];
              return ChatTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                          active: chat.active,
                          userName: chat.reciverName,
                          profile: chat.profile),
                    ),
                  );
                  AppStateContainer.of(context)
                      .blockProvider
                      .appBloc
                      .viewNewMessageSink
                      .add(
                        VeiwNewMessageEvent(
                            chatType: ChatType.private,
                            reciverName: chat.reciverName),
                      );
                },
                userName: chat.reciverName,
                time: chat.time,
                avatar: chat.profile,
                withSeenIcon: chat.seen,
                withOnlineIcon: chat.active,
                chatCount: chat.messageCount != 0 ? chat.messageCount : null,
                countColor: chat.messageCountColor,
                text: chat.text,
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 0,
              indent: 75,
            ),
          );
        });
    // return StreamBuilder(
    //     initialData: AppStateContainer.of(context)
    //         .blockProvider
    //         .appBloc
    //         .privateChatsCached,
    //     stream:
    //         AppStateContainer.of(context).blockProvider.appBloc.privateChats,
    //     builder: (context, snapshot) {
    //       return ListView.separated(
    //         itemCount: snapshot.data!.length,
    //         itemBuilder: (context, index) {
    //           var chat = snapshot.data!.values.toList()[index];
    //           return ChatTile(
    //             onTap: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => ChatPage(
    //                       active: chat.active,
    //                       userName: chat.reciverName,
    //                       profile: chat.profile),
    //                 ),
    //               );
    //               AppStateContainer.of(context)
    //                   .blockProvider
    //                   .appBloc
    //                   .viewNewMessageSink
    //                   .add(
    //                     VeiwNewMessageEvent(
    //                         chatType: ChatType.private,
    //                         reciverName: chat.reciverName),
    //                   );
    //             },
    //             userName: chat.reciverName,
    //             time: chat.time,
    //             avatar: chat.profile,
    //             withSeenIcon: chat.seen,
    //             withOnlineIcon: chat.active,
    //             chatCount: chat.messageCount != 0 ? chat.messageCount : null,
    //             countColor: chat.messageCountColor,
    //             text: chat.text,
    //           );
    //         },
    //         separatorBuilder: (context, index) => const Divider(
    //           height: 0,
    //           indent: 75,
    //         ),
    //       );
    //     });
  }
}
