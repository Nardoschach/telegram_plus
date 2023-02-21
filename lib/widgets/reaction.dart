import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:telegram_plus/blocs/app_state.dart';
import 'package:telegram_plus/models/events/message_events.dart';

class Reaction extends StatelessWidget {
  final String reaction;
  final bool selected;
  final int number;
  final VoidCallback onPressed;
  const Reaction({
    Key? key,
    required this.number,
    required this.reaction,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: selected
            ? Theme.of(context).primaryColor.withOpacity(1)
            : Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "${reaction} ${number} ",
          style: TextStyle(
            color: Colors.white,
            fontSize: selected ? 18 : 15,
          ),
        ),
      ),
    );
  }
}
