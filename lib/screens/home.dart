import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedAvatar = 'images/lady1.png'; // Initial selected avatar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 80, // Adjust the width as needed
                height: 80, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // Change the color as needed
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Create a scrollable list of avatars
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    11, // Change this to the number of avatars you have for both 'lady' and 'men'
                itemBuilder: (context, index) {
                  String avatarPath;
                  if (index % 2 == 0) {
                    avatarPath = 'images/lady${index ~/ 2 + 1}.png';
                  } else {
                    avatarPath = 'images/men${index ~/ 2 + 1}.png';
                  }

                  return GestureDetector(
                    onTap: () {
                      // Update the selectedAvatar when an avatar is clicked
                      setState(() {
                        selectedAvatar = avatarPath;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 90, // Adjust the width as needed
                        height: 50, // Adjust the height as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: selectedAvatar == avatarPath
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(avatarPath),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
