import 'package:flutter/material.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/events/message_events.dart';
import 'package:telegram_plus/models/messages.dart';
import 'package:telegram_plus/widgets/messages/private_message.dart';

class ChatPage extends StatefulWidget {
  String userName;
  bool active;
  String? profile;
  ChatPage({
    required this.active,
    required this.userName,
    required this.profile,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var _textController = TextEditingController();
  String text = "";
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
                CircleAvatar(
                  radius: 23,
                  foregroundImage: AssetImage(widget.profile ?? ""),
                  child: Text(widget.userName.substring(0, 2)),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 13, bottom: 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.userName),
                      Text(
                        widget.active ? "online" : "last seen recently",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
            PopupMenuButton(itemBuilder: (context) {
              return [];
            }),
          ],
        ),
        body: Stack(
          children: [
            StreamBuilder(
                initialData: AppStateContainer.of(context)
                    .blockProvider
                    .appBloc
                    .privateChatMessagesCached,
                stream: AppStateContainer.of(context)
                    .blockProvider
                    .appBloc
                    .privateChatMessages,
                builder: (context, snapshot) {
                  var userMessages = snapshot.data![widget.userName];
                  return ListView.builder(
                    itemCount: userMessages!.length,
                    itemBuilder: (context, index) {
                      return userMessages[index].send
                          ? PrivateMessage(
                              type: "send",
                              text: userMessages[index].text,
                            )
                          : PrivateMessage(
                              type: "receive",
                              text: userMessages[index].text,
                            );
                    },
                  );
                }),
            /**
             * 
             */
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        size: 33,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, bottom: 0),
                      width: MediaQuery.of(context).size.width * 0.71,
                      child: TextField(
                        controller: _textController,
                        onChanged: (value) {
                          setState(() {
                            text = value;
                          });
                        },
                        decoration: InputDecoration(
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
                      icon: Icon(
                        Icons.attach_file_outlined,
                        size: 33,
                        color: Color.fromARGB(255, 109, 108, 108),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (text.length > 0) {
                          AppStateContainer.of(context)
                              .blockProvider
                              .appBloc
                              .sendMessageSink
                              .add(
                                SendMessageEvent(
                                    message: ChatMessage(
                                        send: true, time: "10:09", text: text),
                                    recevier: widget.userName),
                              );
                          _textController.clear();
                        }
                      },
                      icon: text.length == 0
                          ? const Icon(
                              Icons.mic_none_outlined,
                              size: 33,
                              color: Color.fromARGB(255, 109, 108, 108),
                            )
                          : const Icon(
                              Icons.send,
                              size: 33,
                              color: Color.fromARGB(255, 109, 108, 108),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        /*
        *
        *
         */
      ),
    );
  }
}
