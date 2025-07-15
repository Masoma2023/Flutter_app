import 'package:flutter/material.dart';
import 'package:flutter_project/data/constants.dart';
import 'package:flutter_project/views/pages/course_page.dart';
import 'package:flutter_project/views/widgets/container_widget.dart';
import 'package:flutter_project/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.basicLayout,
      KValue.cleanUi,
      KValue.fixBuds,
      KValue.keyConcepts,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.0,),
          HeroWidget(
          title: 'Fluttet Mapp',
          nextPage: CoursePage(),
          ),
    SizedBox(height: 5.0),
      ...List.generate(
        list.length,
        (index) {
          return ContainerWidget(
            title: list.elementAt(index),
            description: 'This is a description',
          );
        },
      ),
   
        ],
    ),
    ),
    );
    
}
}
