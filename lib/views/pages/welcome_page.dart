import 'package:flutter/material.dart';
import 'package:flutter_project/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('asstes/Lottie/welocme.json'),
          FittedBox(
            child: Text('Flutter Mapp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
            ),
            ),
          ),
          SizedBox(height: 20.0,),
          FilledButton(
            onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },

                ),
              );
              
          },
          style: FilledButton.styleFrom(
            minimumSize: Size(double.infinity, 40.0),
          ),
          child: Text('Get Started'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            style: FilledButton.styleFrom(
              minimumSize: Size(double.infinity, 40.0),
            ),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}