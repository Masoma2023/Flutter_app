import 'package:flutter/material.dart';
import 'package:flutter_project/data/notifiers.dart';
import 'package:flutter_project/views/pages/welcome_page.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage('assets/image/bg.jpg'),
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            selectedPageNotifier.value = 0;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
          },
        )
      ],
    ),
    );
  }
}