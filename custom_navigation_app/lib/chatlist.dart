import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  final List<ChatUser> chatUsers = [
    ChatUser("Zayn", "assets/zayn.png", true),
    ChatUser("Sabbir", "assets/sabbir.png", false),
    ChatUser("Labib", "assets/labib.png", true),
    ChatUser("Zahed", "assets/zahed.png", false),
    ChatUser("Showrav", "assets/showrav.png", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatUsers.length,
        itemBuilder: (context, index) {
          final user = chatUsers[index];
          return ChatListItem(user: user);
        },
      ),
    );
  }
}

class ChatUser {
  final String name;
  final String profileImage;
  final bool isActive;

  ChatUser(this.name, this.profileImage, this.isActive);
}

class ChatListItem extends StatelessWidget {
  final ChatUser user;

  ChatListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(user.profileImage),
          ),
          if (user.isActive)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(user.name),
      subtitle: Text("Last message..."),
      trailing: Text("8:30 PM"),
    );
  }
}