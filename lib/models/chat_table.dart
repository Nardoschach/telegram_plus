import 'package:telegram_plus/models/chat.dart';

// class ChatTable {
//   Map<int, Chat> chats = Map();
//   ChatTable();
// }

class ChatStore {
  newMessageCount messageCount;

  Map<int, Chat> chats = Map<int, Chat>();

  ChatStore({
    required this.messageCount,
  });
}

class newMessageCount {
  late int totalMessage;
  int privateMessage;
  int channelMessage;
  int groupMessage;

  int botMessage;

  newMessageCount({
    this.privateMessage = 0,
    this.botMessage = 0,
    this.channelMessage = 0,
    this.groupMessage = 0,
  }) {
    totalMessage = privateMessage + channelMessage + groupMessage + botMessage;
  }
}
