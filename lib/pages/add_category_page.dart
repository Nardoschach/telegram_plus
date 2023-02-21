import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:telegram_plus/widgets/reusable_list_tile.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: const [
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
      ]),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, "/category");
      },
      leading: Text("uuu"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            "4",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return const AddCategoryBottomSheet();
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}

class AddCategoryBottomSheet extends StatelessWidget {
  const AddCategoryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "uuu",
            style: TextStyle(color: Colors.grey),
          ),
          const ReusableListTile(title: "Edit category name"),
          const ReusableListTile(title: "Edit categoty"),
          ReusableListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog();
                },
              );
            },
            title: "Delete",
          ),
          const ReusableListTile(title: "Select chats"),
          const ReusableListTile(title: "Add to Home Screen"),
          const ReusableListTile(title: "Create folder from this category"),
        ],
      ),
    );
  }
}
