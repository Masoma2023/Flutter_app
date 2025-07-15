import 'package:flutter/material.dart';
class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key,
  required this.title,
  this.nextPage,
  });
final String title;
final Widget? nextPage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage != null ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return nextPage!;
            },
          ),
        );
      }
      : null,
      child: Stack(
        alignment: Alignment.center,
      children: [
      Hero(
        tag: 'hero1',
        child: AspectRatio(
          aspectRatio: 1920 / 1000,
            child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/image/bg.jpg',
                    color: Colors.teal,
                    colorBlendMode: BlendMode.darken,
                    ),
             ),
          ),
      ),
      FittedBox(
        child: Text(
          title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
          letterSpacing: 50.0,
          color: Colors.white30,
        )
        ),
      ),
      ],
      ),
    );
  }
}