import 'package:flutter/material.dart';

class ReusableListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leading;
  final IconData? trailing;
  final void Function()? onTap;

  const ReusableListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading != null ? Icon(leading) : null,
      title: Text(
        title,
        softWrap: false,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              softWrap: false,
            )
          : null,
      trailing: trailing != null
          ? Icon(
              trailing,
            )
          : null,
      onTap: onTap != null ? onTap : () {},
    );
  }
}
