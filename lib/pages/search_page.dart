import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.grey,
        // backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          autofocus: true,
          cursorHeight: 30,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 20),
            hintText: "Search",
            border: InputBorder.none,
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Media",
            ),
            Tab(
              text: "Downloads",
            ),
            Tab(
              text: "Links",
            ),
            Tab(
              text: "Files",
            ),
            Tab(
              text: "Music",
            ),
            Tab(
              text: "Voice",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChatTabView(),
          MediaTabView(),
          DownloadsTabView(),
          LinksTabView(),
          FilesTabView(),
          MusicTabView(),
          VoiceTabView(),
        ],
      ),
    );
  }
}

class ChatTabView extends StatefulWidget {
  const ChatTabView({super.key});

  @override
  State<ChatTabView> createState() => _ChatTabViewState();
}

class _ChatTabViewState extends State<ChatTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/images/user1m.jpeg"),
                ),
              ),
            ),
            Text("User 1"),
          ],
        );
      },
    );
  }
}

class MediaTabView extends StatefulWidget {
  const MediaTabView({super.key});

  @override
  State<MediaTabView> createState() => _MediaTabViewState();
}

class _MediaTabViewState extends State<MediaTabView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 80,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 1.5,
        crossAxisCount: 3,
        crossAxisSpacing: 1.5,
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          "assets/images/user2f.jpeg",
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class DownloadsTabView extends StatefulWidget {
  const DownloadsTabView({super.key});

  @override
  State<DownloadsTabView> createState() => _DownloadsTabViewState();
}

class _DownloadsTabViewState extends State<DownloadsTabView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LinksTabView extends StatefulWidget {
  const LinksTabView({super.key});

  @override
  State<LinksTabView> createState() => _LinksTabViewState();
}

class _LinksTabViewState extends State<LinksTabView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FilesTabView extends StatefulWidget {
  const FilesTabView({super.key});

  @override
  State<FilesTabView> createState() => _FilesTabViewState();
}

class _FilesTabViewState extends State<FilesTabView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MusicTabView extends StatefulWidget {
  const MusicTabView({super.key});

  @override
  State<MusicTabView> createState() => _MusicTabViewState();
}

class _MusicTabViewState extends State<MusicTabView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VoiceTabView extends StatefulWidget {
  const VoiceTabView({super.key});

  @override
  State<VoiceTabView> createState() => _VoiceTabViewState();
}

class _VoiceTabViewState extends State<VoiceTabView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
