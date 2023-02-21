import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/storage/channels.dart';
import 'package:telegram_plus/widgets/chat_tile.dart';

class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ChatTile(
          onTap: () {
            Navigator.pushNamed(context, "/group");
          },
          icon: Icons.group,
          userName: "Mesfin 2",
          sender: "Nardo",
          time: "12:00 PM",
          avatar: "assets/images/user1m.jpeg",
          withSeenIcon: false,
          withOnlineIcon: false,
          chatCount: 4,
          countColor: Color.fromARGB(193, 152, 239, 53),
          text:
              "dfff klsdfldjf klsdfjkj kljdfkkkkk klsdffffff ldfjfj kjjjjjjjjjjjjjjjjjjjjjj",
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 0,
        indent: 75,
      ),
    );
  }
}
