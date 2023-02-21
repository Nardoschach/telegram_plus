import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BageTab extends StatelessWidget {
  final int count;
  final IconData icon;
  const BageTab({
    Key? key,
    required this.count,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: count > 0,
      position: badges.BadgePosition.topStart(
        top: 20,
        start: 10,
      ),
      badgeContent: Text(
        count.toString(),
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          height: 1,
        ),
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: Color.fromARGB(255, 255, 3, 3),
        shape: badges.BadgeShape.square,
        padding: EdgeInsets.only(left: 3, top: 2, right: 3, bottom: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Tab(
        icon: Icon(icon),
      ),
    );
  }
}
