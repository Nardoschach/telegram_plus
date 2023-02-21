import 'package:flutter/animation.dart';

class Chat {
  String reciverName;
  String text;
  String time;
  String? profile;
  bool seen;
  int messageCount;
  Color messageCountColor;
  bool active;

  Chat({
    required this.messageCount,
    required this.text,
    required this.time,
    required this.reciverName,
    this.profile,
    required this.seen,
    required this.active,
    required this.messageCountColor,
  });
}
