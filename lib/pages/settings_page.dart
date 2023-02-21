import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:telegram_plus/widgets/reusable_list_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var divider = Divider(height: 0.1, thickness: 0.5, indent: 15.0);
    return
        // Scaffold(
        //   appBar: AppBar(actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.search),
        //     ),
        //     PopupMenuButton<ListTile>(
        //       itemBuilder: (context) => <PopupMenuEntry<ListTile>>[
        //         const PopupMenuItem(
        //           child: ReusableListTile(
        //             title: "Edit Name",
        //             leading: Icons.edit,
        //           ),
        //         ),
        //         const PopupMenuItem(
        //           child: ReusableListTile(
        //             title: "Set New Photo or Video",
        //             leading: Icons.add_a_photo_outlined,
        //           ),
        //         ),
        //         const PopupMenuItem(
        //           child: ReusableListTile(
        //             title: "Log Out",
        //             leading: Icons.exit_to_app_outlined,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ]),
        //   body: ListView(
        //     children: [
        //       const Text("Account"),
        //       ReusableListTile(
        //         title: "+2519 18181818",
        //         subtitle: "Tap to change phone number",
        //       ),
        //       divider,
        //       ReusableListTile(
        //         title: "@sav99wo",
        //         subtitle: "Username",
        //       ),
        //       divider,
        //       ReusableListTile(
        //         title: "Who cares",
        //         subtitle: "Bio",
        //       ),
        //     ],
        //   ),
        // );

        Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: ListTile(
                leading: CircleAvatar(
                  child: Text("NA"),
                ),
                title: Text("Nardos"),
                subtitle: Text("Online"),
              ),
              background: Image.asset(
                "assets/images/photo.jpg",
                fit: BoxFit.fill,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              PopupMenuButton<ListTile>(
                itemBuilder: (context) => <PopupMenuEntry<ListTile>>[
                  const PopupMenuItem(
                    child: ReusableListTile(
                      title: "Edit Name",
                      leading: Icons.edit,
                    ),
                  ),
                  const PopupMenuItem(
                    child: ReusableListTile(
                      title: "Set New Photo or Video",
                      leading: Icons.add_a_photo_outlined,
                    ),
                  ),
                  const PopupMenuItem(
                    child: ReusableListTile(
                      title: "Log Out",
                      leading: Icons.exit_to_app_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, indes) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) {
                var titles = [
                  "+251 934552343",
                  "",
                  "@sav99wo",
                  "",
                  "Who cares,"
                ];
                var subtitiles = [
                  "Tap to change phone number",
                  "",
                  "Username",
                  "",
                  "Bio"
                ];
                if ((index % 2) != 0) {
                  return Divider(
                    indent: 20.0,
                    height: 0.0,
                  );
                }
                return ReusableListTile(
                  title: titles[index],
                  subtitle: subtitiles[index],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 15,
              (context, index) {
                var icons = [
                  Icons.notifications_outlined,
                  Icons.abc,
                  Icons.lock_outline,
                  Icons.abc,
                  Icons.pie_chart_outline,
                  Icons.abc,
                  Icons.chat_outlined,
                  Icons.abc,
                  Icons.tag_faces_outlined,
                  Icons.abc,
                  Icons.folder_outlined,
                  Icons.abc,
                  Icons.devices,
                  Icons.abc,
                  Icons.language,
                  Icons.abc,
                ];
                var titles = [
                  "Notifications and Sounds",
                  "",
                  "Privacy and Security",
                  "",
                  "Data and Storage",
                  "",
                  "Chat Settins",
                  "",
                  "Stickers and Emoji",
                  "",
                  "Chat Folders",
                  "",
                  "Devices",
                  "",
                  "Language",
                  "",
                ];
                if ((index % 2) != 0) {
                  return Divider(
                    indent: 60.0,
                    height: 0.0,
                  );
                }

                return ReusableListTile(
                  title: titles[index],
                  leading: icons[index],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => ReusableListTile(
                title: "Telegram Premium",
                leading: Icons.star,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Help",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 5,
              (context, index) {
                var icons = [
                  Icons.comment,
                  Icons.abc,
                  Icons.help_outlined,
                  Icons.abc,
                  Icons.verified_user_outlined,
                ];
                var titles = [
                  "Ask a Question",
                  "",
                  "Telegram FAQ",
                  "",
                  "Privacy Policy",
                ];
                if ((index % 2) != 0) {
                  return Divider(
                    indent: 60.0,
                    height: 0.0,
                  );
                }

                return ReusableListTile(
                  title: titles[index],
                  leading: icons[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
