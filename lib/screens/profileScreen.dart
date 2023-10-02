import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


import '../widgets/largeBottomButton.dart';

class Profile extends StatefulWidget {

  final String userProfilePicture;

  Profile({
    required this.userProfilePicture
});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
/// method to update user profile
  // void _updateUsername() async {
  //   final newUsername = _usernameController.text.trim();
  //   print("New Username: $newUsername");
  //   if (newUsername.isNotEmpty) {
  //     // Update the username in the AuthService
  //     AuthService authService = AuthService();
  //     await authService.updateUsername(newUsername);
  //
  //     // Show a confirmation message or navigate back to the profile screen
  //     Navigator.pop(context);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapped outside of a text field
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      Get.back();
                    },
                    color: Colors.grey,
                    icon: Icon(
                      FontAwesomeIcons.leftLong,
                      size: 15,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.userProfilePicture),
                    radius: 30,
                  ),
                  IconButton(
                    onPressed: () async {
                    null;
                    },
                    color: Colors.grey,
                    icon: Icon(
                      FontAwesomeIcons.gear,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 60,
              padding: EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
            ),
            SizedBox(height: 40,), LargeBottomButton(
              function: (){},
                text: "Upload",
                color: Colors.blue[900])
          ],
        ),
      ),
    );
  }
}
