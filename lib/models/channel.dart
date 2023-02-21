class Channel {
  String channelName;
  String profilePicture;
  String lastMessageSentTime;
  String lastText;
  List<String> spoilerImages;
  int newMessages;
  int subscribers;

  Channel({
    required this.channelName,
    required this.subscribers,
    required this.profilePicture,
    required this.lastMessageSentTime,
    required this.lastText,
    required this.spoilerImages,
    required this.newMessages,
  });
}
