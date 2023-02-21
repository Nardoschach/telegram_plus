import 'package:telegram_plus/models/phone_number.dart';

class User {
  bool isActive;
  String firstName;
  DateTime? lastSeen;
  String username;
  String? bio;
  final PhoneNumber phoneNumber;
  final List<String> profilePictures = [];
  User({
    required this.firstName,
    required this.username,
    required this.phoneNumber,
    required this.isActive,
    this.bio,
    this.lastSeen,
  });
}
