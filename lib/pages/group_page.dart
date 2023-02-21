import 'package:flutter/material.dart';
import 'package:telegram_plus/widgets/messages/liked_message.dart';

import 'package:telegram_plus/widgets/reusable_list_tile.dart';
import 'package:telegram_plus/widgets/slidable.dart';
import 'package:telegram_plus/widgets/slidable_background.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: SizedBox(
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 23,
                  child: Text("SE"), //  replace by intial
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("SE 2012"),
                    Text("2344 members"),
                  ],
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
            PopupMenuButton(
                itemBuilder: (context) => <PopupMenuEntry<InkWell>>[
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.volume_up_outlined),
                          title: Text("Mute"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.star_outline_rounded),
                          title: Text("Add to Favorites"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.create_new_folder_outlined),
                          title: Text("Add to Folder"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.report_outlined),
                          title: Text("Report"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app_rounded),
                          title: Text("Leave channel"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          leading: Icon(Icons.expand_less),
                          title: Text("Go to first message"),
                        ),
                      ),
                      const PopupMenuItem<InkWell>(
                        child: ListTile(
                          title: Text("Hide bottom layout"),
                        ),
                      ),
                    ]),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => Slideable(
              onSlided: () {
                myFocusNode.requestFocus();
                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const GroupChatTile(),
              background: const Background(),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.white70,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  size: 33,
                  color: Color.fromARGB(255, 109, 108, 108),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 0),
                width: 270,
                child: TextField(
                  focusNode: myFocusNode,
                  onSubmitted: (value) {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 104, 103, 103)),
                    hintText: "Message",
                  ),
                  cursorHeight: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.attach_file_outlined,
                  size: 33,
                  color: Color.fromARGB(255, 109, 108, 108),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.photo_camera_outlined,
                  size: 33,
                  color: Color.fromARGB(255, 109, 108, 108),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * 
 * 
 * snack bar
 */

var snackBar = SnackBar(
  content: Container(
    height: 20,
    child: ListTile(
      leading: const Icon(Icons.reply),
      title: Column(
        children: const [
          Text("Deleted Account"),
          Text(
            "kdfkdfkkdllfjldjfjjkllkdjsfjdlkjf",
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ),
  ),
);

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          SizedBox(
            width: 420,
            height: 60,
            child: Container(
              margin: const EdgeInsets.only(bottom: 11.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Text("👍"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text(
                      "❤️",
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text("🔥"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text("👏"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text("🎉"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text("🤔"),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Text(".🤩"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            width: 265,
            // height: 530,
            child: Material(
              child: Column(
                children: const [
                  ReusableListTile(
                    leading: Icons.reply,
                    title: "Reply",
                  ),
                  ReusableListTile(
                    leading: Icons.copy,
                    title: "Copy",
                  ),
                  ReusableListTile(
                    leading: Icons.copy,
                    title: "Copy selection of text",
                  ),
                  ReusableListTile(
                    leading: Icons.translate,
                    title: "Translate",
                  ),
                  ReusableListTile(
                    leading: Icons.link,
                    title: "Copy Link",
                  ),
                  ReusableListTile(
                    leading: Icons.shortcut,
                    title: "Forward",
                  ),
                  ReusableListTile(
                    leading: Icons.shortcut,
                    title: "Forward without quoting",
                  ),
                  ReusableListTile(
                    leading: Icons.report_outlined,
                    title: "Report",
                  ),
                  ReusableListTile(
                    leading: Icons.cloud_download_outlined,
                    title: "Save to Saved Messages",
                  ),
                  ReusableListTile(
                    leading: Icons.info_outline,
                    title: "Message details",
                  ),
                  ReusableListTile(
                    leading: Icons.bookmark_outline,
                    title: "Mark message",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupChat extends StatelessWidget {
  const GroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.zero,
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.only(top: 4.0),
      padding: const EdgeInsets.only(
          left: 16.0, top: 5.0, right: 16.0, bottom: 11.0),
      child: const LikedMessage(replyed: true),
    );
  }
}

class GroupChatTile extends StatelessWidget {
  const GroupChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          child: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage("assets/images/user1m.jpeg"),
                child: Text("jk"),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: Colors.lightGreenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const GroupChat(),
        Container(
          // height: 30,
          margin: const EdgeInsets.only(left: 8, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.reply,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
