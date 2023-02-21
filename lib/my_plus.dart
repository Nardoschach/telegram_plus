import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/channel.dart';
import 'package:telegram_plus/models/chat.dart';
import 'package:telegram_plus/models/group.dart';
import 'package:telegram_plus/storage/channels.dart';
import 'package:telegram_plus/widgets/bage_tabs.dart';
import 'package:telegram_plus/widgets/category_bottom_sheet.dart';
import 'package:telegram_plus/widgets/drawer.dart';

import 'package:telegram_plus/widgets/tab_bar_views/bot_view.dart';
import 'package:telegram_plus/widgets/tab_bar_views/channel_view.dart';
import 'package:telegram_plus/widgets/tab_bar_views/groups_view.dart';
import 'package:telegram_plus/widgets/tab_bar_views/my_plus_view.dart';
import 'package:telegram_plus/widgets/tab_bar_views/private_view.dart';

class MyPlus extends StatefulWidget {
  const MyPlus({super.key});

  @override
  State<MyPlus> createState() => _MyPlusState();
}

class _MyPlusState extends State<MyPlus> with SingleTickerProviderStateMixin {
  var tabLabels = [
    "My Plus Messenger",
    "Private",
    "Groups",
    "Channels",
    "Bots"
  ];
  int _currentTabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(updateAppBarTitle); // dont forget to dispose
  }

  void updateAppBarTitle() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: AppStateContainer.of(context)
            .blockProvider
            .appBloc
            .newMessageCountCached,
        stream:
            AppStateContainer.of(context).blockProvider.appBloc.newMessageCount,
        builder: (context, snapshot) {
          var newMessageCounts = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(tabLabels[_currentTabIndex]),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/search");
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return CategoryBottomSheet();
                      },
                    );
                  },
                  icon: const Icon(Icons.folder_open),
                )
              ],
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  BageTab(
                      count: newMessageCounts[0],
                      icon: Icons.grid_view), // check non null
                  BageTab(
                      count: newMessageCounts[1], icon: Icons.person_outline),
                  BageTab(
                      count: newMessageCounts[2], icon: Icons.groups_outlined),
                  BageTab(count: newMessageCounts[3], icon: Icons.campaign),
                  BageTab(count: newMessageCounts[4], icon: Icons.adb_outlined),
                ],
              ),
            ),
            drawer: AppDrawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/newMessage");

                

                print("done");
              },
              child: Icon(Icons.edit),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                MyPlusView(),
                PrivateView(),
                GroupsView(),
                ChannelView(),
                BotView(),
              ],
            ),
          );
        });
  }
}
