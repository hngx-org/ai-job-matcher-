import 'package:ai_job_matcher/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../constants/contactcolors.dart';
// import '../services/api_services.dart';
import '../services/services.dart';
import '../widgets/chat_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  String userProfilePicture = "assets/profile.png";
  late TextEditingController textEditingController;
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void handleSendButtonPressed() {
    /// to added  texts to screen when Send Button is pressed
    setState(() {
      chatMessages.add({
        "msg": textEditingController.text,
        "chatIndex": 0.toString(),
      });
      textEditingController.clear();
    });
    print('Button clicked');


    /// Scroll to the new message
    _scrollController.animateTo(
      _scrollController.position.extentTotal,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () => Get.to(Profile(
                    userProfilePicture: userProfilePicture,
                  )),
              child: CircleAvatar(
                  backgroundImage: AssetImage(userProfilePicture),
                radius: 18,
              ),
          ),
        ),
        title: const Text("Ai Job Matcher"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.grey),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(
                          chatMessages[index]["chatIndex"].toString()),
                    );
                  }),
            ),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.black,
                size: 18,
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) {
                            // TODO send message
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can I help you",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                        onPressed: handleSendButtonPressed,
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),

                      // IconButton(
                      //     onPressed: () async {
                      //       try {
                      //         await ApiService.getModels();
                      //       } catch (error) {
                      //         print("error $error");
                      //       }
                      //     },
                      //     icon: const Icon(
                      //       Icons.send,
                      //       color: Colors.white,
                      //     ),)
                    ],
                  ),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
