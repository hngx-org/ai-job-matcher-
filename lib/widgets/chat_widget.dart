import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  void copyToClipBoard(){
    Clipboard.setData(ClipboardData(text:  msg));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: chatIndex == 0 ? EdgeInsets.fromLTRB(20, 15, 3, 0) :  EdgeInsets.fromLTRB(3, 15, 20, 30),
        child: Column(
          // crossAxisAlignment: chatIndex == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          // mainAxisAlignment: chatIndex == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: chatIndex == 0
                    ? BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                      )
                    : BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                      ),
                color: chatIndex == 0 ? Colors.blue[900] : Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: chatIndex == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(
                        chatIndex == 0 ? 'assets/user.jpeg' : 'assets/profile.png',

                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextWidget(
                        color: chatIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        label: msg,
                      ),
                    ),
                    chatIndex == 0
                        ? const SizedBox.shrink()
                        : IconButton(
                      onPressed: () {
                        copyToClipBoard(); // Call the copy function when the copy icon is pressed
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Message copied to clipboard')),
                        );
                      },
                          icon: Icon(
                            size: 18,
                              FontAwesomeIcons.copy,
                              color: Colors.grey,
                            ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
