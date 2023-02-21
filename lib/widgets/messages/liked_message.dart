import 'package:flutter/material.dart';

class LikedMessage extends StatelessWidget {
  final bool replyed;
  const LikedMessage({Key? key, required this.replyed}) : super(key: key);

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
        replyed
            ? Row(
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
              )
            : Container(
                height: 0,
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

        /**
         * reactions
         */
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(top: 4, right: 16),
              width: 85, // dynamic85
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 130, 194),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 55,
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/sender_images/user1m.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/sender_images/user2f.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: CircleAvatar(
                      foregroundImage:
                          AssetImage("assets/images/sender_images/user3m.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "👍",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(4),
            //   margin: EdgeInsets.only(top: 4, right: 16),
            //   width: 60, // dynamic
            //   decoration: BoxDecoration(
            //     color: Color.fromARGB(255, 30, 127, 176).withOpacity(0.2),
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(15),
            //     ),
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         left: 30,
            //         child: CircleAvatar(
            //           foregroundImage: AssetImage("assets/images/user3m.jpeg"),
            //           radius: 10,
            //           child: Text("NA"),
            //         ),
            //       ),
            //       Positioned(
            //         left: 15,
            //         child: CircleAvatar(
            //           foregroundImage: AssetImage("assets/images/user2f.jpeg"),
            //           radius: 10,
            //           child: Text("NA"),
            //         ),
            //       ),
            //       Positioned(
            //         child: CircleAvatar(
            //           foregroundImage: AssetImage("assets/images/user1m.jpeg"),
            //           radius: 10,
            //           child: Text("NA"),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(top: 4, right: 16),
              width: 60, // dynamic
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 30, 127, 176).withOpacity(0.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    child: CircleAvatar(
                      foregroundImage: AssetImage("assets/images/user3m.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    child: CircleAvatar(
                      foregroundImage: AssetImage("assets/images/user2f.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                  Positioned(
                    child: CircleAvatar(
                      foregroundImage: AssetImage("assets/images/user1m.jpeg"),
                      radius: 10,
                      child: Text("NA"),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "11:29 PM",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

class Separator extends StatelessWidget {
  final Color color;
  const Separator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    );
  }
}
