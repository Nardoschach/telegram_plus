import 'dart:async';

import 'package:telegram_plus/models/channel.dart';
import 'package:telegram_plus/models/chat.dart';
import 'package:telegram_plus/models/chat_table.dart';
import 'package:telegram_plus/models/events/message_events.dart';
import 'package:telegram_plus/services/chat_service.dart';
import 'package:telegram_plus/services/databse_service.dart';

class ChatBloc {
  final DatabaseService service;

  //inputs
  StreamController<SendMessageEvent> sendMessageSink =
      StreamController<SendMessageEvent>();
  StreamController<ReactMessageEvent> reactMessageSink =
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

  StreamController<List<Channel>> _channelsStreamController =
      StreamController();
  Stream<List<Channel>> get channels => _channelsStreamController.stream;
  // Stream<List<Chat>> get privateChats => service.streamPrivateChat;

  // configuring
  ChatBloc({required this.service}) {}

  void _handleChannelUpdateFromService(List<Channel> channels) {
    _channelsStreamController.add(channels);
  }
}
