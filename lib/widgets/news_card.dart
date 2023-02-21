import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/events/message_events.dart';
import 'package:telegram_plus/widgets/chat_tile.dart';
import 'package:telegram_plus/widgets/messages/message.dart';
import 'package:telegram_plus/widgets/reaction.dart';

class NewsCard extends StatefulWidget {
  final String channelName;
  final String? image;
  final String text;
  final int seen;
  final int share;
  final String time;
  final int messageId;
  final Map<String, int>? reactions;
  const NewsCard({
    Key? key,
    required this.text,
    required this.share,
    required this.messageId,
    required this.channelName,
    required this.time,
    required this.seen,
    this.image,
    this.reactions,
  }) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    var reactionIcons =
        widget.reactions != null ? widget.reactions!.keys.toList() : [];
    var reactionNumber =
        widget.reactions != null ? widget.reactions!.values.toList() : [];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.85,
              minWidth: MediaQuery.of(context).size.width * 0.75),
          child: Container(
            margin: EdgeInsets.only(
              left: 10.0,
              top: 4.0,
              // right: 60.0,
              bottom: 4.0,
            ),
            child: Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.elliptical(20, 20),
                bottomRight: Radius.elliptical(20, 25),
                bottomLeft: Radius.circular(5),
              ),
              elevation: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.image != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: 1.0,
                            top: 2.0,
                            right: 1.0,
                            bottom: 1.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/imageView");
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.elliptical(20, 20),
                                bottomRight: Radius.circular(2),
                                bottomLeft: Radius.circular(1),
                              ),
                              child: Image.asset(
                                widget.image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : emptyBox,
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            text: widget.text,
                            children: [
                              TextSpan(
                                text: "\n@tikvahethsport",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 84, 164, 229),
                                ),
                              ),
                              TextSpan(text: "                             "),
                              TextSpan(
                                text: "@kidusyoftahe",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 84, 164, 229),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      widget.reactions != null
                          ? Row(
                              children: [
                                Reaction(
                                    number: reactionNumber[1],
                                    reaction: reactionIcons[1],
                                    selected: reactionNumber[0] == 1,
                                    onPressed: () {
                                      handleReaction(
                                          context,
                                          widget.channelName,
                                          reactionIcons[1],
                                          widget.messageId);
                                    }),
                                Reaction(
                                  number: reactionNumber[2],
                                  reaction: reactionIcons[2],
                                  selected: reactionNumber[0] == 2,
                                  onPressed: () {
                                    handleReaction(context, widget.channelName,
                                        reactionIcons[2], widget.messageId);
                                  },
                                ),
                                Reaction(
                                  number: reactionNumber[3],
                                  reaction: reactionIcons[3],
                                  selected: reactionNumber[0] == 3,
                                  onPressed: () {
                                    handleReaction(context, widget.channelName,
                                        reactionIcons[3], widget.messageId);
                                  },
                                ),
                                Reaction(
                                  number: reactionNumber[4],
                                  reaction: reactionIcons[4],
                                  selected: reactionNumber[0] == 4,
                                  onPressed: () {
                                    handleReaction(context, widget.channelName,
                                        reactionIcons[4], widget.messageId);
                                  },
                                ),
                              ],
                            )
                          : emptyBox,
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 8, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 190,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    color: Colors.grey,
                                    Icons.reply,
                                  ),
                                  Text(
                                    "${widget.share}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    "${widget.seen}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "${widget.time}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        indent: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 17, right: 0),
                            child: SizedBox(
                              width: 80,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 6,
                                    left: 40,
                                    child: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          "assets/images/user3m.jpeg"),
                                      radius: 14,
                                      child: Text("NA"),
                                    ),
                                  ),
                                  Positioned(
                                    top: 6,
                                    left: 20,
                                    child: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          "assets/images/user2f.jpeg"),
                                      radius: 14,
                                      child: Text("NA"),
                                    ),
                                  ),
                                  Positioned(
                                    top: 6,
                                    left: 0,
                                    child: CircleAvatar(
                                      foregroundImage: AssetImage(
                                          "assets/images/user1m.jpeg"),
                                      radius: 14,
                                      child: Text("NA"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 100),
                            padding: EdgeInsets.zero,
                            child: Text("4 comments"),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: Icon(Icons.navigate_next),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.reply,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

void handleReaction(
    BuildContext context, String channelName, String reaction, int id) {
  AppStateContainer.of(context)
      .blockProvider
      .appBloc
      .reactChannelMessageSink
      .add(ReactMessageEvent(
          messageId: id, channelName: channelName, reaction: reaction));
}
