class DatabaseService {
//   final String userId;
//   DatabaseService({required this.userId});
//   StreamController channelsController = StreamController();

//   final CollectionReference userCollection =
//       FirebaseFirestore.instance.collection("users");
//   final CollectionReference chatCollection =
//       FirebaseFirestore.instance.collection("chats");
//   final CollectionReference channelCollection =
//       FirebaseFirestore.instance.collection("channels");
//   final CollectionReference groupCollection =
//       FirebaseFirestore.instance.collection("groups");

//   Future updateUserData({
//     required String userName,
//     required String email,
//   }) async {
//     return await userCollection.doc(userId).set({
//       "userName": userName,
//       "lastSeen": "", // Todo
//       "isActive": "", // Todo
//       "email": email,
//       "contacts": [],
//       "groups": [],
//       "chats": [],
//       "channels": [],
//       "profilePictures": [],
//       "userId": userId,
//     });
//   }

//   // search user by email

//   Future createContact({
//     required String firstName,
//     String? lastName,
//     required String email,
//   }) async {
//     // handle to not add more than once
//     Query query = userCollection.where("email", isEqualTo: email);

//     QuerySnapshot querySnapshot = await query.get();
//     // hoping it returns only one record

//     if (querySnapshot.docs.length > 0) {
//       String contactId = querySnapshot.docs[0].get("userId");
//       await userCollection.doc(userId).update({
//         "contacts": FieldValue.arrayUnion(["${contactId}"]),
//       });
//     }
//     // error handling
//   }
// /**
//  *
//  *

// jlkjklfa

// askldfj

// aslkdfjlk

//  */
// // avoid userName
//   // Stream<QuerySnapshot> getContacts() {
//   //   // List<String> contactIds = userCollection.doc(userId).get().
//   //   Query query =
//   //       userCollection.where("members", arrayContainsAny: "${userId}_userName");
//   //   return query.snapshots();
//   // }

// /**
//  *
//  *
//  *
//  * lkdsfj
//  * sdlkfj
//  * lskdfj
//  *
//  *
//  *
//  *
//  *
//  */
//   Future createChannel({
//     required Channel channel,
//   }) async {
//     DocumentReference channelDocumentReference =
//         await channelCollection.add(channel.toJson());
//     // await channelCollection.add({
//     //   "channelName": channelName,
//     //   "description": description ?? "",
//     //   "admin": "${userId}_$userName",
//     //   "profilePictures": [],
//     //   "subscribers": [],
//     //   "id": "",
//     // });

//     // update channel so that it have auto generated id
//     await channelDocumentReference.update({
//       // "subscribers": FieldValue.arrayUnion(["${userId}_$userName"]),
//       "subscribers": FieldValue.arrayUnion([channel.admin]),
//       "id": channelDocumentReference.id,
//     });

//     // update user

//     DocumentReference userDocumentReference = await userCollection.doc(userId);
//     return userDocumentReference.update({
//       "channels": FieldValue.arrayUnion(
//           ["${channelDocumentReference.id}_${channel.channelName}"])
//       // ["${channelDocumentReference.id}_${channelName}"])
//     });
//   }

//   // avoid userName
//   Stream<QuerySnapshot> getChannels(String userName) {
//     Query query = channelCollection.where("subscribers",
//         arrayContains: "${userId}_$userName");
//     return query.snapshots();
//     // return query.snapshots().map((snapshot) {
//     //   List<Channel> channels = [];
//     //   snapshot.docs.forEach((docSnapshot) {
//     //     channels
//     //         .add(Channel.fromJson(docSnapshot.data() as Map<String, dynamic>));
//     //     print(channels[0].admin);
//     //   });
//     //   // channels.forEach((element) {
//     //   //   print(element.channelName);
//     //   // });
//     //   return channels;
//     // });
//   }

//   Future createGroup({
//     required Group group,
//     // required String groupName,
//     // required String userId,
//     // required String userName,
//     // required String type,
//   }) async {
//     DocumentReference groupDocumentReference = await groupCollection.add(group);
//     // await groupCollection.add({
//     //   "groupName": groupName,
//     //   "type": type,
//     //   "admin": "${userId}_$userName",
//     //   "profilePictures": [],
//     //   "members": [],
//     //   "id": "",
//     // });

//     // update group so that it have auto generated id
//     await groupDocumentReference.update({
//       "members": FieldValue.arrayUnion([group.admin]),
//       // "members": FieldValue.arrayUnion(["${userId}_$userName"]),
//       "id": groupDocumentReference.id,
//     });

//     // update user

//     DocumentReference userDocumentReference = await userCollection.doc(userId);
//     return userDocumentReference.update({
//       "groups": FieldValue.arrayUnion(
//           ["${groupDocumentReference.id}_${group.groupName}"])
//       // FieldValue.arrayUnion(["${groupDocumentReference.id}_${groupName}"])
//     });
//   }

//   // avoid userName
//   Stream<List<Group>> getGroups(String userName) {
//     Query query =
//         groupCollection.where("members", arrayContains: "${userId}_userName");

//     return query.snapshots().map((snapshot) {
//       List<Group> groups = [];
//       snapshot.docs.forEach((docSnapshot) {
//         groups.add(Group.fromJson(docSnapshot.data() as Map<String, dynamic>));
//       });
//       return groups;
//     });
//   }

//   Future createChat({
//     required Chat chat,
//     // required String senderId,
//     // required String senderName,
//     // required String receiverName,
//     // required String receiverId,
//   }) async {
//     DocumentReference chatDocumentReference =
//         await channelCollection.add(chat.toJson());
//     // await chatCollection.add({
//     //   "senderId": "${senderId}_$senderName",
//     //   "receiverId": "${receiverId}_$receiverName",
//     //   "id": "",
//     // });

//     await chatDocumentReference.update({
//       "id": chatDocumentReference.id,
//     });

//     DocumentReference senderDocumentReference =
//         await userCollection.doc(chat.senderId);
//     // await userCollection.doc(senderId);
//     DocumentReference receiverDocumnentReference =
//         await userCollection.doc(chat.receiverId);
//     // await userCollection.doc(receiverId);

//     // update both users documnet

//     senderDocumentReference.update({
//       "chats": FieldValue.arrayUnion(
//           ["${chatDocumentReference.id}_${chat.receiverId}"])
//       // FieldValue.arrayUnion(["${chatDocumentReference.id}_${receiverId}"])
//     });
//     return receiverDocumnentReference.update({
//       "chats": FieldValue.arrayUnion(
//           ["${chatDocumentReference.id}_${chat.receiverId}"])
//       // FieldValue.arrayUnion(["${chatDocumentReference.id}_${senderId}"])
//     });
//   }

//   // avoid userName
//   Stream<List<Chat>> getChats(String userName) {
//     return chatCollection.snapshots().map((snapshot) {
//       List<Chat> chats = [];
//       snapshot.docs.forEach((docSnapshot) {
//         chats.add(Chat.fromJson(docSnapshot.data() as Map<String, dynamic>));
//       });
//       return chats;
//     });

//     // return chatCollection.snapshots();
//   }

//   /**
//    *
//    * send messages and reactions
//    */

//   Future sendChatMessage({
//     required ChatMessage message,
//     // required String chatId,
//     // required String text,
//   }) async {
//     CollectionReference messageCollectionReference =
//         chatCollection.doc(message.chatId).collection("messages");
//     // chatCollection.doc(chatId).collection("messages");

//     DocumentReference messageDocumentReference =
//         await messageCollectionReference.add(message.toJson());
//     //     await messageCollectionReference.add({
//     //   "text": text,
//     //   "id": "",
//     // });

//     await messageDocumentReference.update({"id": messageDocumentReference.id});
//   }

//   Stream<List<ChatMessage>> getChatMessages({required String chatId}) {
//     CollectionReference messageCollectionReference =
//         chatCollection.doc(chatId).collection("messages");

//     return messageCollectionReference.snapshots().map((snapshot) {
//       List<ChatMessage> messages = [];
//       snapshot.docs.forEach((docSnapshot) {
//         messages.add(
//             ChatMessage.fromJson(docSnapshot.data() as Map<String, dynamic>));
//       });
//       return messages;
//     });

//     // return messageCollectionReference.snapshots();
//   }

//   Future sendChannelMessage(
//       {required String channelId, required ChannelMessage message}) async {
//     CollectionReference messageCollectionRefernce =
//         channelCollection.doc(channelId).collection("messages");
//     DocumentReference messageDocumentReference =
//         await messageCollectionRefernce.add(required.toString());
//     //     await messageCollectionRefernce.add({
//     //   "text": "",
//     //   "picture": "",
//     //   "time": "",
//     //   "reactions": {
//     //     "fire": 0,
//     //     "like": 0,
//     //     "dislike": 0,
//     //     "clap": 0,
//     //   },
//     //   "seen": 0,
//     //   "share": 0,
//     //   "id": "",
//     // });

//     await messageDocumentReference
//         .update({"id": "${messageDocumentReference.id}"});
//   }

//   Stream<List<ChannelMessage>> getChannelMessages({required String channelId}) {
//     CollectionReference messageCollectionRefernce =
//         channelCollection.doc(channelId).collection("messages");

//     return messageCollectionRefernce.snapshots().map((snapshot) {
//       List<ChannelMessage> messages = [];
//       snapshot.docs.forEach((docSnapshot) {
//         messages.add(ChannelMessage.fromJson(
//             docSnapshot.data() as Map<String, dynamic>));
//       });
//       return messages;
//     });
//     // messageCollectionRefernce.snapshots();
//   }

//   Future sendGroupMessage({
//     required String groupId,
//     required GroupMessage message,
//     // required String text,
//     // String? replyedMessageId,
//   }) async {
//     CollectionReference messageCollectionRefernce =
//         groupCollection.doc(groupId).collection("messages");
//     DocumentReference messageDocumentReference =
//         await messageCollectionRefernce.add(message.toJson());
//     //     await messageCollectionRefernce.add({
//     //   "text": "",
//     //   "picture": "",
//     //   "time": "",
//     //   "reactions": {
//     //     "fire": 0,
//     //     "like": 0,
//     //     "dislike": 0,
//     //     "clap": 0,
//     //   },
//     //   "replyedMessage": replyedMessageId ?? "",
//     //   "seen": 0,
//     //   "share": 0,
//     //   "id": "",
//     // });

//     await messageDocumentReference
//         .update({"id": "${messageDocumentReference.id}"});
//   }

//   Stream<List<GroupMessage>> getGroupMessages({required String groupId}) {
//     CollectionReference messageCollectionRefernce =
//         groupCollection.doc(groupId).collection("messages");

//     return messageCollectionRefernce.snapshots().map((snapshot) {
//       List<GroupMessage> messages = [];
//       snapshot.docs.forEach((docSnapshot) {
//         messages.add(
//             GroupMessage.fromJson(docSnapshot.data() as Map<String, dynamic>));
//       });
//       return messages;
//     });

//     // return messageCollectionRefernce.snapshots();
//   }

//   // Future replyGroupMessage(String groupId, messageId) async {
//   //   CollectionReference messageCollectionRefernce =
//   //       groupCollection.doc(groupId).collection("messages");
//   //   DocumentReference messageDocumentReference =
//   //       await messageCollectionRefernce.add({
//   //     "text": "",
//   //     // "picture": "",
//   //     "time": "",
//   //     "reactions": {
//   //       "fire": 0,
//   //       "like": 0,
//   //       "dislike": 0,
//   //       "clap": 0,
//   //     },
//   //     "replyedMessage": messageId,

//   //     "id": "",
//   //   });

//   //   await messageDocumentReference
//   //       .update({"id": "${messageDocumentReference.id}"});
//   // }

//   Future commentMessage({
//     required String messageId,
//     required String channelId,
//     required CommentMessage comment,
//     // required String text,
//   }) async {
//     CollectionReference commentCollectionReference = groupCollection
//         .doc(channelId)
//         .collection("messages")
//         .doc(messageId)
//         .collection("comments");

//     DocumentReference commentDocumentReference =
//         await commentCollectionReference.add(comment.toJson());
//     //     await commentCollectionReference.add({
//     //   "userId": "${userId}_name",
//     //   "text": text,
//     //   "id": "",
//     // });
//     await commentDocumentReference
//         .update({"id": "${commentDocumentReference.id}"});
//   }

//   Stream<List<CommentMessage>> getComments(
//       {required String groupId, required String messageId}) {
//     CollectionReference commentCollectionReference = groupCollection
//         .doc(groupId)
//         .collection("messages")
//         .doc(messageId)
//         .collection("comments");

//     return commentCollectionReference.snapshots().map((snapshot) {
//       List<CommentMessage> messages = [];
//       snapshot.docs.forEach((docSnapshot) {
//         messages.add(CommentMessage.fromJson(
//             docSnapshot.data() as Map<String, dynamic>));
//       });
//       return messages;
//     });
//     // return commentCollectionReference.snapshots();
//   }
}
