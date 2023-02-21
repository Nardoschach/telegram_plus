import 'package:telegram_plus/models/messages.dart';
import 'package:telegram_plus/utils/constants.dart';
import 'package:telegram_plus/widgets/messages/message.dart';

class SendMessageEvent {
  ChatMessage message;
  String recevier;

  SendMessageEvent({
    required this.message,
    required this.recevier,
  });
}

class VeiwNewMessageEvent {
  ChatType chatType;
  String reciverName;

  VeiwNewMessageEvent({
    required this.chatType,
    required this.reciverName,
  });
}

class ReactMessageEvent {
  int messageId;
  String reaction;
  // String formerReaction;
  String channelName;

  ReactMessageEvent({
    required this.messageId,
    required this.channelName,
    required this.reaction,
    // required this.formerReaction,
  });
}

class ReplyMessageEvent {}

class commentMessageEvent {}

class deleteMessageEvent {}

class updateMessageEvent {}
