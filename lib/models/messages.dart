class ChatMessage {
  String time;
  String text;
  bool send;

  ChatMessage({
    required this.send,
    required this.time,
    required this.text,
  });
}

class ChannelMessage {
  int id;
  String text;
  String? picture;
  String time;
  Map<String, int>? reactions;
  Map<String, String>? comments;
  int seen;
  int share;

  ChannelMessage({
    required this.text,
    required this.time,
    required this.id,
    this.comments,
    this.picture,
    this.reactions,
    required this.seen,
    required this.share,
  });
}

class GroupMessage {
  String sender;
  bool senderActive;
  bool replayed;
  String text;
  String time;
  Map<String, int>? reactions;
  int share;
  int id;
  int? replyedMessageId;
  String? replayedMessageSender;

  GroupMessage({
    required this.text,
    required this.time,
    required this.replayed,
    this.reactions,
    required this.share,
    required this.id,
    this.replyedMessageId,
    required this.sender,
    required this.senderActive,
    this.replayedMessageSender,
  });
}
