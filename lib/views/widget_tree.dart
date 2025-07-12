import 'package:flutter/material.dart';
import 'package:flutter_project/data/notifiers.dart';
import 'package:flutter_project/views/pages/home_page.dart';
import 'package:flutter_project/views/pages/profile_page.dart';
import 'package:flutter_project/views/widgets/navbar_widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';


class KConstants {
  static const String themeModeKey = 'themeMode';
}
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);
List<Widget> pages = [
 HomePage(),
 ProfilePage(),
];
class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title:  Text('Flutter Project'),
         centerTitle: true,
         actions: [
          IconButton(
            onPressed: ()async{
            final SharedPreferences prefs = 
            await SharedPreferences.getInstance();
            await prefs.setBool(KConstants.themeModeKey, true);
            isDarkModeNotifier.value = !isDarkModeNotifier.value;
          }, 
          icon: ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
             builder: (context, isDarkMode, child){
            return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode,);
          }),),
          IconButton(
            onPressed: (){
              
            },
            icon: Icon(Icons.settings),
          ),

          
         ],
         
         
        ),
        body: ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedpage, child){
          return pages.elementAt(selectedpage);
        }),
        
        
        bottomNavigationBar: NavbarWidgets()
      );
  }
}