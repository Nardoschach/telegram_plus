import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: const [
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/newMessage");
        },
        child: Icon(Icons.edit),
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
      leading: const CircleAvatar(
        foregroundImage: AssetImage("assets/images/user1m.jpeg"),
        child: Text("Ab"), // dynamic
      ),
      title: Text(name),
      subtitle: Text(lastSeen),
    );
  }
}
