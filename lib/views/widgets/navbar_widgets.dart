import 'package:flutter/material.dart';
import 'package:flutter_project/data/notifiers.dart';

class NavbarWidgets extends StatefulWidget {
  const NavbarWidgets({super.key});

  @override
  State<NavbarWidgets> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidgets> {
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child){
      return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: ( value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
    },
    );
  }
}