import 'package:telegram_plus/models/sender.dart';

class Reaction {
  final String theReaction;
  int count;
  final List<Sender> reacters = [];

  Reaction({required this.theReaction, required this.count});
}
