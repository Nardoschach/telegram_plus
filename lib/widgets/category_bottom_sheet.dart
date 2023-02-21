import 'package:flutter/material.dart';
import 'package:telegram_plus/widgets/reusable_list_tile.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Material(
        child: Column(
          children: [
            ReusableListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/category");
              },
              title: "uuu",
            ),
            ReusableListTile(title: "yy"),
            ReusableListTile(title: "h"),
            ReusableListTile(
              onTap: () {
                Navigator.popAndPushNamed(context, "/addCategory");
              },
              title: "Add category",
            ),
          ],
        ),
      ),
    );
  }
}
