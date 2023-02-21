import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart' as clip;

class PrivateMessage extends StatelessWidget {
  final String type;
  final String text;
  const PrivateMessage({
    Key? key,
    required this.type,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clip.LowerNipMessageClipper(
        (type == "send") ? clip.MessageType.send : clip.MessageType.receive,
      ),
      child: Row(
        mainAxisAlignment:
            (type == "send") ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            child: Container(
              decoration: BoxDecoration(
                color:
                    (type == "send") ? Colors.lightGreenAccent : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: (type == "send") ? Radius.circular(20) : Radius.zero,
                  bottomLeft: (type == "send")
                      ? Radius.elliptical(50, 27)
                      : Radius.zero,
                  topRight:
                      (type == "receive") ? Radius.circular(20) : Radius.zero,
                  bottomRight: (type == "receive")
                      ? Radius.elliptical(50, 27)
                      : Radius.zero,
                ),
              ),
              margin: EdgeInsets.only(top: 2.0),
              // margin: EdgeInsets.only(
              //   left: (type == "send") ? 200 : 0,
              //   right: (type == "receive") ? 200 : 0,
              // ),
              padding: EdgeInsets.only(
                  left: 16.0, top: 5.0, right: 16.0, bottom: 11.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.55,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    "12:45 PM",
                    style: TextStyle(
                        color: Color.fromARGB(255, 111, 111, 111),
                        fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
