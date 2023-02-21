import 'package:telegram_plus/models/sender.dart';

class Category {
  String categoryName;

  final List<Sender> senders = [];
  Category({required this.categoryName});
}
