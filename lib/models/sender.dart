import 'package:telegram_plus/widgets/messages/message.dart';

abstract class Sender {
  final String name;
  final int id;
  final List<String> profilePictures = [];
  final List<Message> messages = [];

  Sender({
    required this.name,
    required this.id,
  });
}
