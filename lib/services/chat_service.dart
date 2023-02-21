import 'dart:async';

class ChatService {
  // AppStore appDataBase;

  // Stream<ChatStore> streamChatStore() {
  //   return appDataBase.chatNotifier.stream;
  // }

  // ChatService(this.appDataBase);

  // Future addToChatTable(Chat c, int chatId) async {
  //   appDataBase.chatTable.chats[chatId] = c;
  //   appDataBase.chatTable = appDataBase.chatTable;
  // }

  // Future removeFromChatTable(Chat c, int chatId) async {
  //   appDataBase.chatTable.chats.remove(chatId);
  //   appDataBase.chatTable = appDataBase.chatTable;
  // }

  // Future addMessageToChat(Message m, int messageId, int chatId) async {
  //   appDataBase.chatTable.chats[chatId]!.messages[messageId] = m; // check null
  //   appDataBase.chatTable = appDataBase.chatTable;
  // }

  // Future deleteMessageFromChat(int messageId, int chatId) async {
  //   appDataBase.chatTable.chats[chatId]!.messages
  //       .remove(messageId); // check null
  //   appDataBase.chatTable = appDataBase.chatTable;
  // }

  Future commentMessageFromChat(int messageId, int chatId) async {}
  Future reactMessageFromChat(int messageId, int chatId) async {}
  Future replyMessageFromChat(int messageId, int chatId) async {}

  // Stream<newMessageCount> get streamNewMessageCount {
  //   return appDataBase.chatNotifier.stream
  //       .map((chatStore) => chatStore.messageCount);
  // }

  // Stream<Message> get streamUpdatedChats {
  //   return appDataBase.chatNotifier.stream.map((chatStore) {

  //   });
  // }
}

////
///
/// close streams
///
class AppStore {}
