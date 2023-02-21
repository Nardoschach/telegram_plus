import 'package:flutter/material.dart';

import 'liked_message.dart';

class ReplyedMessage extends StatelessWidget {
  const ReplyedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Created Account",
          style: TextStyle(
            color: Color.fromARGB(255, 15, 187, 46),
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Separator(
              color: Color.fromARGB(255, 15, 187, 46),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deleted Account",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 106, 7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                      maxHeight: 30),
                  child: Text(
                    "there is some text fdfjk",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          child: Text(
            "there is some text with new line and bla bla ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
