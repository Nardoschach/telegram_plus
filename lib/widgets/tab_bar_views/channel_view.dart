import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/channel.dart';
import 'package:telegram_plus/pages/channel_page.dart';
import 'package:telegram_plus/storage/channels.dart';
import 'package:telegram_plus/widgets/chat_tile.dart';

class ChannelView extends StatefulWidget {
  const ChannelView({super.key});

  @override
  State<ChannelView> createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData:
            AppStateContainer.of(context).blockProvider.appBloc.channelsCached,
        stream: AppStateContainer.of(context).blockProvider.appBloc.channels,
        builder: (context, snapshot) {
          var channelIdList = snapshot.data!.keys.toList();
          var channelList = snapshot.data!.values.toList();
          return ListView.separated(
            itemCount: channelList.length,
            itemBuilder: (context, index) {
              return ChatTile(
                onTap: () {
                  // Navigator.pushNamed(context, "/channel");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ChannelPage(
                          channelName: channelList[index].channelName,
                          id: channelIdList[index],
                          subscribers: channelList[index].subscribers);
                    },
                  ));
                },
                icon: Icons.campaign,
                userName: channelList[index].channelName,
                time: channelList[index].lastMessageSentTime,
                avatar: channelList[index].profilePicture,
                // "assets/images/user1m.jpeg",
                withSeenIcon: false,
                withOnlineIcon: false,
                chatCount: channelList[index].newMessages,
                countColor: Color.fromARGB(193, 152, 239, 53),
                spoilerImages: channelList[index].spoilerImages,
                text: channelList[index].lastText,
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 0,
              indent: 75,
            ),
          );
        });
  }
}
