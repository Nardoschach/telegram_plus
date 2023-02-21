import 'package:flutter/material.dart';
import 'package:telegram_plus/widgets/spoiler_image.dart';
import 'online_indicator.dart';

class ChatTile extends StatefulWidget {
  final VoidCallback? onTap;
  final String userName;
  final String? avatar;
  final IconData? icon;
  final bool withSeenIcon;
  final bool withOnlineIcon;
  final String? sender;
  final List<String>? spoilerImages;
  final int? chatCount;
  final Color? countColor;
  final String time;
  final String text;
  const ChatTile({
    Key? key,
    required this.text,
    required this.time,
    this.onTap,
    required this.userName,
    this.avatar,
    this.icon,
    required this.withSeenIcon,
    required this.withOnlineIcon,
    this.sender,
    this.spoilerImages,
    this.chatCount,
    this.countColor,
  }) : super(key: key);

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    String intial = widget.userName.substring(0, 2);
    List<SpoilerImage> spoilers;
    double textWidth;
    int length;
    double chatCountLength;
    if (widget.spoilerImages != null) {
      spoilers = widget.spoilerImages!
          .map(
            (imagePath) => SpoilerImage(imagePath),
          )
          .toList();
    } else {
      spoilers = []; // may not be necessary
    }

    if (widget.chatCount != null) {
      length = 1;
      int num = widget.chatCount!;
      while (num != 0) {
        num = num ~/ 10;
        length++;
      }
    } else {
      length = 0;
    }

    chatCountLength = length * (MediaQuery.of(context).size.width * 0.013);
    if (widget.sender != null) {
      textWidth = spoilers.length == 3
          ? MediaQuery.of(context).size.width * 0.445 - chatCountLength
          : spoilers.length == 2
              ? MediaQuery.of(context).size.width * 0.5 - chatCountLength
              : spoilers.length == 1
                  ? MediaQuery.of(context).size.width * 0.55 - chatCountLength
                  : MediaQuery.of(context).size.width * 0.6 - chatCountLength;
    } else {
      textWidth = spoilers.length == 3
          ? MediaQuery.of(context).size.width * 0.57 - chatCountLength
          : spoilers.length == 2
              ? MediaQuery.of(context).size.width * 0.62 - chatCountLength
              : spoilers.length == 1
                  ? MediaQuery.of(context).size.width * 0.68 - chatCountLength
                  : MediaQuery.of(context).size.width * 0.73 - chatCountLength;
    }

    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    foregroundImage: widget.avatar != null
                        ? AssetImage(widget.avatar!)
                        : null,
                    child: Text(
                      intial,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  widget.withOnlineIcon
                      ? Positioned(
                          top: 39,
                          left: 42,
                          child: OnlineIndicator(),
                        )
                      : emptyBox,
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5, top: 7, right: 1, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.icon != null ? Icon(widget.icon) : emptyBox,
                        widget.icon != null
                            ? SizedBox(
                                width: 5,
                              )
                            : emptyBox,
                        SizedBox(
                          width: widget.icon != null
                              ? MediaQuery.of(context).size.width * 0.48
                              : MediaQuery.of(context).size.width * 0.55,
                          child: Text(
                            widget.userName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        widget.withSeenIcon
                            ? Icon(
                                Icons.done_all_outlined,
                                color: Color.fromARGB(255, 45, 255, 21),
                              )
                            : emptyBox,
                        widget.withSeenIcon
                            ? SizedBox(width: 6)
                            : SizedBox(width: 29),
                        Text(
                          widget.time,
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(255, 110, 105, 105),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /**
                   * 
                   * 
                   */
                  Row(
                    children: [
                      widget.sender != null
                          ? SizedBox(
                              width: 52,
                              child: Text(
                                "${widget.sender!}:",
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          : emptyBox,
                      spoilers.length > 0 ? spoilers[0] : emptyBox,
                      spoilers.length > 1 ? spoilers[1] : emptyBox,
                      spoilers.length > 2 ? spoilers[2] : emptyBox,
                      SizedBox(
                        width: textWidth,
                        child: Text(
                          widget.text,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 111, 104, 104),
                          ),
                        ),
                      ),
                      widget.chatCount != null
                          ? Container(
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 8, right: 8),
                              decoration: BoxDecoration(
                                color: widget.countColor ??
                                    Color.fromARGB(
                                        255, 202, 200, 200), //color is variable
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              margin: EdgeInsets.only(left: 2, top: 4),
                              child: Text(
                                widget.chatCount.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : emptyBox,
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const emptyBox = SizedBox(
  height: 0,
  width: 0,
);
