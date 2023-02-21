class Group {
  String groupName;
  String type;
  List<String>? profilePicture;
  int members;
  String lastMessageSentTime;
  String lastText;
  String lastSender;
  List<String> spoilerImages;
  int newMessages;
  Group({
    required this.groupName,
    required this.type,
    required this.lastSender,
    this.profilePicture,
    required this.members,
    required this.lastMessageSentTime,
    required this.lastText,
    required this.spoilerImages,
    required this.newMessages,
  });
}
