import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/widgets/news_card.dart';

class ChannelPage extends StatefulWidget {
  final String id;
  final String channelName;
  final int subscribers;
  final String? avatar;
  const ChannelPage({
    Key? key,
    required this.channelName,
    required this.id,
    required this.subscribers,
    this.avatar,
  }) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  foregroundImage:
                      widget.avatar != null ? AssetImage(widget.avatar!) : null,
                  child: const Text("TI"), //  replace by intial
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.channelName),
                    Text("${widget.subscribers} subscribers"),
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
        body: StreamBuilder(
          initialData: AppStateContainer.of(context)
              .blockProvider
              .appBloc
              .channelMessageCached,
          stream: AppStateContainer.of(context)
              .blockProvider
              .appBloc
              .channelMessages,
          builder: (context, snapshot) {
            var messageList = snapshot.data![widget.channelName];
            return ListView.builder(
              itemCount: messageList!.length,
              itemBuilder: (context, index) {
                var message = messageList[index];

                return NewsCard(
                  channelName: widget.channelName,
                  messageId: message.id,
                  reactions: message.reactions,
                  text: message.text,
                  image: message.picture,
                  seen: message.seen,
                  share: message.share,
                  time: message.time,
                );
              },
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.07,
          child: TextButton(
            child: const Text(
              "MUTE",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
