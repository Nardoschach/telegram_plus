import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      child: Text("NA"),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.mode_night)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_outline)),
                      ],
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text("Nardos"),
                  // subtitle: const Text("+251918181818"),
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: const Text("NA"),
                      ),
                      title: Text("Nardos"),
                    ),
                  
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text("New Group"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_outlined),
            title: const Text("New Secret Chat"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.campaign_outlined),
            title: const Text("New Channel"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Contacts"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text("Downloads"),
            trailing: const Text("7"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: const Text("Chat Folders"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.place_outlined),
            title: const Text("People Nearby"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_outline),
            title: const Text("Saved Messages"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text("Calls"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Settings"),
            onTap: () {
              Navigator.of(context).popAndPushNamed("/settings");
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Plus Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder_open_outlined),
            title: const Text("Catagories"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: const Text("Download themes"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.brush_outlined),
            title: const Text("Theming"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.groups_outlined),
            title: const Text("Support group"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Chats Counters"),
            onTap: () {},
          ),
          const Divider(),
          Column(
            children: [
              const Text("My Plus Messenger for Android"),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child:
                    const Text("v1.0 done for mobile programming assignment"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
