import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deleted Account",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 106, 7),
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.5,
              ),
              child: Text(
                "there is some text",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            Text(
              "12:45 PM",
              style: TextStyle(
                  color: Color.fromARGB(255, 111, 111, 111), fontSize: 14),
            )
          ],
        ),
      ],
    );
  }
}
