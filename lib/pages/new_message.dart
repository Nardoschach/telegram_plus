import 'package:flutter/material.dart';
import 'package:telegram_plus/widgets/reusable_list_tile.dart';

class NewMessagePage extends StatefulWidget {
  const NewMessagePage({super.key});

  @override
  State<NewMessagePage> createState() => _NewMessagePageState();
}

class _NewMessagePageState extends State<NewMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableListTile(
              title: "New Group",
              leading: Icons.group_outlined,
            ),
            ReusableListTile(
              title: "New Secret Chat",
              leading: Icons.lock_outline,
            ),
            ReusableListTile(
              title: "New Channel",
              leading: Icons.campaign_outlined,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 217, 217).withOpacity(0.4),
              ),
              child: Text(
                "Sorted by last seen time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            const User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            const User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            const User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            const User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
            User(
              name: "Abrsh",
              lastSeen: "last seen recently",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addContact(context);
        },
        child: Icon(
          Icons.person_add_alt_1,
        ),
      ),
    );
  }
}

class User extends StatelessWidget {
  final String name;
  final String lastSeen;
  const User({Key? key, required this.name, required this.lastSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        foregroundImage: AssetImage("assets/images/user1m.jpeg"),
        child: Text("Ab"), // dynamic
      ),
      title: Text(name),
      subtitle: Text(lastSeen),
    );
  }
}

void addContact(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.width * 0.9,
        child: AddContactForm(),
      );
    },
  );
}

class AddContactForm extends StatefulWidget {
  const AddContactForm({super.key});

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final globalKey = GlobalKey<FormState>();
  late FocusNode firstNameFocusNode;
  late FocusNode phoneNumberFocusNode;
  @override
  void initState() {
    firstNameFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var validFields = [true, true]; // to track which field is invalid
    return Form(
      key: globalKey,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Contact",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              focusNode: firstNameFocusNode,
              validator: (value) {
                if (value!.isEmpty) {
                  validFields[0] = false;
                  return "";
                } else {
                  validFields[0] = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "First name (required)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              autofocus: true,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Last name (optional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            TextFormField(
              /**
               * dont forget keyboard type
               */
              keyboardType: TextInputType.number,
              focusNode: phoneNumberFocusNode,
              validator: (value) {
                if (value!.isEmpty) {
                  print("object"); //////////
                  validFields[1] = false;
                  return "";
                } else {
                  validFields[1] = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            // TextFormField(
            //   validator: (value) {
            //     if (value!.isEmpty) {}
            //   },
            //   decoration: InputDecoration(
            //     hintText: "First name (required)",
            //   ),
            // ),
            // FormField(
            //   builder: (field) {
            //     return Row(
            //       children: [
            //         IconButton(
            //           onPressed: () {},
            //           icon: Text("🇪🇹"),
            //         ),
            //         SizedBox(
            //           width: 40,
            //           child: TextField(
            //             decoration: InputDecoration(
            //               hintText: "+251", // must be intial value
            //             ),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(left: 8, right: 12),
            //           height: 20,
            //           width: 2,
            //           decoration: BoxDecoration(
            //             color: Colors.grey.withOpacity(0.5),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 200,
            //           child: TextField(
            //             decoration: InputDecoration(
            //               hintText: "00 000 0000",
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  var valid = globalKey.currentState?.validate() ?? false;
                  if (valid) {
                    Navigator.pop(context);
                  } else {
                    if (validFields[0] == false) {
                      firstNameFocusNode.requestFocus();
                    } else if (validFields[1] == false) {
                      phoneNumberFocusNode.requestFocus();
                    }
                  }
                },
                child: Text(
                  "Create Contact",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
