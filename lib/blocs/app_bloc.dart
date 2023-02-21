import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telegram_plus/models/channel.dart';
import 'package:telegram_plus/models/chat.dart';
import 'package:telegram_plus/models/events/message_events.dart';
import 'package:telegram_plus/models/group.dart';
import 'package:telegram_plus/models/messages.dart';
import 'package:telegram_plus/utils/constants.dart';

class AppBloc {
  // storage
  _AppStore _appStore = _AppStore();
  //inputs
  StreamController<SendMessageEvent> sendMessageSink =
      StreamController<SendMessageEvent>();
  StreamController<VeiwNewMessageEvent> viewNewMessageSink =
      StreamController<VeiwNewMessageEvent>();

  StreamController<ReactMessageEvent> reactChannelMessageSink =
      StreamController<ReactMessageEvent>();
  StreamController<ReplyMessageEvent> ReplyMessageSink =
      StreamController<ReplyMessageEvent>();
  StreamController<commentMessageEvent> commentMessageSink =
      StreamController<commentMessageEvent>();
  StreamController<deleteMessageEvent> deleteMessageSink =
      StreamController<deleteMessageEvent>();
  StreamController<updateMessageEvent> updateMessageSink =
      StreamController<updateMessageEvent>();

  // outputs

  // Stream<newMessageCount> get newMessageCounts => service.streamNewMessageCount;
  // Stream<List<Chat>> get privateChats => service.streamPrivateChat;

// private chat
  StreamController<Map<String, Chat>> _privateChatController =
      StreamController<Map<String, Chat>>.broadcast();
  Stream<Map<String, Chat>> get privateChats => _privateChatController.stream;

  Map<String, Chat> get privateChatsCached => _appStore.privateChats;

  StreamController<List<int>> _newMessageCountController =
      StreamController<List<int>>.broadcast();

  Stream<List<int>> get newMessageCount => _newMessageCountController.stream;
  List<int> get newMessageCountCached => _appStore.newMessageCounts;

  Map<String, List<ChatMessage>> get privateChatMessagesCached =>
      _appStore.privateChatMessages;

  StreamController<Map<String, List<ChatMessage>>>
      _privateChatMessagesController =
      StreamController<Map<String, List<ChatMessage>>>.broadcast();
  Stream<Map<String, List<ChatMessage>>> get privateChatMessages =>
      _privateChatMessagesController.stream;

// channel
  StreamController<Map<String, Channel>> _channelsController =
      StreamController.broadcast();
  Stream<Map<String, Channel>> get channels => _channelsController.stream;
  Map<String, Channel> get channelsCached => _appStore.channels;
  StreamController<Map<String, List<ChannelMessage>>>
      _channelMessagesController = StreamController.broadcast();

  Stream<Map<String, List<ChannelMessage>>> get channelMessages =>
      _channelMessagesController.stream;
  Map<String, List<ChannelMessage>> get channelMessageCached =>
      _appStore.channelChatMessages;

  AppBloc() {
    sendMessageSink.stream.listen((event) {
      handleNewMessage(event);
    });
    viewNewMessageSink.stream.listen((event) {
      handleViewNewMessage(event);
    });

    reactChannelMessageSink.stream.listen((event) {
      handleChannelMessageReaction(event);
    });
  }

  void handleNewMessage(SendMessageEvent event) {
    _appStore.privateChatMessages[event.recevier]!.add(event.message);
    _privateChatMessagesController.add(_appStore.privateChatMessages);
  }

  void handleViewNewMessage(VeiwNewMessageEvent event) {
    switch (event.chatType) {
      case ChatType.private:
        _appStore.newMessageCounts[1] -=
            _appStore.privateChats[event.reciverName]!.messageCount;
        _appStore.newMessageCounts[0] -=
            _appStore.privateChats[event.reciverName]!.messageCount;
        _appStore.privateChats[event.reciverName]!.messageCount = 0;
        break;
    }
    _newMessageCountController.add(_appStore.newMessageCounts);
  }

  void handleChannelMessageReaction(ReactMessageEvent event) {
    int selected = _appStore
        .channelChatMessages[event.channelName]![event.messageId]
        .reactions!["selected"]!;
    var reactionMap = {
      1: "🔥",
      2: "👍",
      3: "👎",
      4: "👏",
    };
    var selectionMap = {
      "🔥": 1,
      "👍": 2,
      "👎": 3,
      "👏": 4,
    };

    var newReactionNumber;
    var oldReactionNumber;

    void handleOldNewReaction(String newR) {
      newReactionNumber = _appStore
              .channelChatMessages[event.channelName]![event.messageId]
              .reactions![newR]! +
          1;

      oldReactionNumber = _appStore
              .channelChatMessages[event.channelName]![event.messageId]
              .reactions![reactionMap[selected]]! -
          1;

      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions![reactionMap[selected]!] = oldReactionNumber;
      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions![newR] = newReactionNumber;

      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions!["selected"] = selectionMap[newR]!;
    }

    if (selected == -1) {
      // noting has been selected
      newReactionNumber = _appStore
              .channelChatMessages[event.channelName]![event.messageId]
              .reactions![event.reaction]! +
          1;
      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions![event.reaction] = newReactionNumber;

      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions!["selected"] = selectionMap[event.reaction]!;
    } else if (selected == selectionMap[event.reaction]) {
      newReactionNumber = _appStore
              .channelChatMessages[event.channelName]![event.messageId]
              .reactions![event.reaction]! -
          1;

      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions![event.reaction] = newReactionNumber;
      _appStore.channelChatMessages[event.channelName]![event.messageId]
          .reactions!["selected"] = -1;
    } else {
      handleOldNewReaction(event.reaction);
    }

    // _appStore.channelChatMessages[event.channelName]![event.messageId]
    //     .reactions![event.formerReaction] = oldReaction;
    // _appStore.channelChatMessages[event.channelName]![event.messageId]
    //     .reactions![event.reaction] = newReaction;

    _channelMessagesController.add(_appStore.channelChatMessages);
  }

  // group chat
  StreamController<Map<String, Group>> _groupsController =
      StreamController.broadcast();
  Stream<Map<String, Group>> get groups => _groupsController.stream;
  Map<String, Group> get groupsCached => _appStore.groups;

  Map<String, List<GroupMessage>> get groupMessagesCached =>
      _appStore.groupMessages;

  Map<String, Group> get groupCached => _appStore.groups;
  StreamController<Map<String, List<GroupMessage>>> _groupMessagesController =
      StreamController<Map<String, List<GroupMessage>>>.broadcast();
  Stream<Map<String, List<GroupMessage>>> get groupMessages =>
      _groupMessagesController.stream;

/**
 * 
 * 
 * storage
 */

}

class _AppStore {
  List<int> newMessageCounts = [9089, 48, 45, 98, 0];
  //
  //private chats
  Map<String, Chat> privateChats = {
    "USER 1": Chat(
      messageCount: 4,
      text: "kjkdsfjjdsjfdf jkljfjkdf lkdlkfkd ",
      time: "11:00 PM",
      reciverName: "USER 1",
      profile: imageLink[ImageTitle.user2],
      seen: false,
      messageCountColor: Color.fromARGB(255, 55, 207, 60),
      active: true,
    ),
    "USER 2": Chat(
      messageCount: 4,
      text: "kjkdsfjjdsjfdf",
      time: "11:00 PM",
      reciverName: "USER 2",
      seen: true,
      messageCountColor: Color.fromARGB(255, 55, 207, 60),
      active: true,
    ),
    "USER 3": Chat(
      messageCount: 0,
      text: "kjkdsfjjdsjfdf",
      time: "8:00 PM",
      reciverName: "USER 3",
      profile: imageLink[ImageTitle.user3],
      seen: false,
      messageCountColor: Color.fromARGB(255, 55, 207, 60),
      active: false,
    ),
    "USER 4": Chat(
      messageCount: 4,
      text: "kjkdsfjjdsjfdf",
      time: "10:00 AM",
      reciverName: "USER 4",
      profile: imageLink[ImageTitle.user4],
      seen: true,
      messageCountColor: Color.fromARGB(193, 152, 239, 53),
      active: true,
    ),
    "USER 5": Chat(
      messageCount: 4,
      text: "kjkdsfjjdsjfdf",
      time: "10:00 AM",
      reciverName: "USER 5",
      profile: imageLink[ImageTitle.user4],
      seen: true,
      messageCountColor: Color.fromARGB(193, 152, 239, 53),
      active: true,
    ),
    "USER 6": Chat(
      messageCount: 4,
      text: "kjkdsfjjdsjfdf",
      time: "10:00 AM",
      reciverName: "USER 6",
      profile: imageLink[ImageTitle.user4],
      seen: true,
      messageCountColor: Color.fromARGB(193, 152, 239, 53),
      active: true,
    ),
  };

//
//
// privateChatMessages

  Map<String, List<ChatMessage>> privateChatMessages = {
    "USER 1": [
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 2": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 3": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 4": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 5": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 6": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
    "USER 7": [
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "3:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "11:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "10:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: false, time: "8:00 PM", text: "jktjkajdfkdfjdksdfkd"),
      ChatMessage(send: true, time: "9:00 PM", text: "jktjkajdfkdfjdksdfkd"),
    ],
  };

  Map<String, Channel> channels = {
    "TIKVAH - ETHIOPIA": Channel(
      channelName: "Awaqi",
      lastMessageSentTime: "12:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 7,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 99999,
    ),
    "tikvak": Channel(
      channelName: "TIKVAH - ETHIOPIA",
      lastMessageSentTime: "7:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 4,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 4444,
    ),
    "atc": Channel(
      channelName: "ATC",
      lastMessageSentTime: "4:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 1,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 1234,
    ),
    "fashiontera": Channel(
      channelName: "Fashion Tera",
      lastMessageSentTime: "2:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 7,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 1235795,
    ),
    "mulesport": Channel(
      channelName: "Mule Sport",
      lastMessageSentTime: "12:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 7,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 98345,
    ),
    "ethiotel": Channel(
      channelName: "Ethio tel",
      lastMessageSentTime: "12:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 7,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 67534,
    ),
    "telebirr": Channel(
      channelName: "Tele birr",
      lastMessageSentTime: "12:00 PM",
      lastText: " kdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
      newMessages: 7,
      profilePicture: "",
      spoilerImages: [],
      subscribers: 6538,
    ),
  };

  Map<String, List<ChannelMessage>> channelChatMessages = {
    "Fashion Tera": [
      ChannelMessage(
          id: 0,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 1,
          text:
              "alsdfjkldfjdklfj alsdjf lksdjf alsdfj lasdjf lasjdf alsjdf lsfjfjjjjjjjjjj ",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 2,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 3,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 4,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 5,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 6,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 7,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik5],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
    ],
    "Mule Sport": [
      ChannelMessage(
          id: 0,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 1,
          text:
              "alsdfjkldfjdklfj alsdjf lksdjf alsdfj lasdjf lasjdf alsjdf lsfjfjjjjjjjjjj ",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 2,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 3,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 4,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 5,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 6,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 7,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik5],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
    ],
    "ATC": [
      ChannelMessage(
          id: 0,
          text: "kfjldkjfdjfkdfd  jkdffdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 1,
          text:
              "alsdfjkldfjdklfj alsdjf lksdjf alsdfj lasdjf lasjdf alsjdf lsfjfjjjjjjjjjj ",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 2,
          text: "kfj ldkjfdjf kdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 3,
          text: "kfjl dkjfdjfkdfdf djfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 4,
          text: "kfjldk jfdjfkdfd  fdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 5,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 6,
          text: "kfjldkj fdjfkdfd fdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 7,
          text: "kfjld kjfdjfkd fdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik5],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
    ],
    "TIKVAH - ETHIOPIA": [
      ChannelMessage(
          id: 0,
          text:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik1],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
      ChannelMessage(
          id: 1,
          text:
              "alsdfjkldfjdklfj alsdjf lksdjf alsdfj lasdjf lasjdf alsjdf lsfjfjjjjjjjjjj ",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 2,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
        id: 3,
        text: "kfjldkjfdjfkdfdfdjfkd",
        time: "11:00 PM",
        seen: 10,
        share: 200,
        picture: imageLink[ImageTitle.tik2],
      ),
      ChannelMessage(
        id: 4,
        text: "kfjldkjfdjfkdfdfdjfkd",
        time: "11:00 PM",
        seen: 10,
        share: 200,
        picture: imageLink[ImageTitle.tik3],
      ),
      ChannelMessage(
          id: 5,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 6,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 7,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik5],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
    ],
    "Awaqi": [
      ChannelMessage(
          id: 0,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 1,
          text:
              "alsdfjkldfjdklfj alsdjf lksdjf alsdfj lasdjf lasjdf alsjdf lsfjfjjjjjjjjjj ",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 2,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 3,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 4,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 5,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 6,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200),
      ChannelMessage(
          id: 7,
          text: "kfjldkjfdjfkdfdfdjfkd",
          time: "11:00 PM",
          seen: 10,
          share: 200,
          picture: imageLink[ImageTitle.tik5],
          reactions: {
            "selected": 1,
            "🔥": 65,
            "👍": 32,
            "👎": 8,
            "👏": 14,
          }),
    ],
  };

  Map<String, Group> groups = {
    "BiT SE 2012": Group(
      groupName: "BiT SE 2012",
      type: "basic",
      members: 56,
      lastMessageSentTime: "12:00",
      lastSender: "User 2",
      lastText: "ALKDJFDSKJFDKSJFDKLSJFL",
      spoilerImages: [],
      newMessages: 6,
    ),
    "Student Union": Group(
      groupName: "Student Union",
      type: "super",
      members: 34555,
      lastMessageSentTime: "8:00",
      lastSender: "User 8",
      lastText: "kkkkkkkkkkkkkkkk",
      spoilerImages: [],
      newMessages: 89,
    ),
  };

  Map<String, List<GroupMessage>> groupMessages = {
    "BiT SE 2012": [
      GroupMessage(
        text: "klfldsfjdsjf alsdjfjsdkfj lasjdf a alsdjf a",
        time: "12:00",
        replayed: false,
        share: 0,
        id: 0,
        sender: "Mesfin",
        senderActive: false,
      ),
      GroupMessage(
        text: "klfldsfjdsjf alsdjfjsdkfj lasjdf a alsdjf a",
        time: "12:67",
        replayed: true,
        share: 6,
        id: 1,
        sender: "Mesfin",
        senderActive: true,
        replayedMessageSender: "Muluken",
        replyedMessageId: 1,
      ),
      GroupMessage(
        text: "klfldsfjdsjf alsdjfjsdkfj lasjdf a alsdjf a",
        time: "12:99",
        replayed: false,
        share: 2,
        id: 0,
        sender: "Surafel",
        senderActive: false,
      ),
      GroupMessage(
          text: "klfldsfjdsjf alsdjfjsdkfj lasjdf a alsdjf a",
          time: "12:99",
          replayed: true,
          share: 9,
          id: 3,
          sender: "Mesfin",
          senderActive: true,
          replayedMessageSender: "Nati",
          replyedMessageId: 2),
    ]
  };
}
