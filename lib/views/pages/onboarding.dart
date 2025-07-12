import 'package:flutter/material.dart';
import 'package:flutter_project/views/widgets/hero_widget.dart';
import 'package:flutter_project/views/widget_tree.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_project/views/pages/login_page.dart'; // Adjust the path as needed

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/home.json', height: 499.0),
               
                
                SizedBox(height: 20.0),
                Text(
                  'Flutter Mapp is the way to learn Flutter, period',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage(title: 'Register');
                        },
            
                      ),
                    );
                    
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Next'),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  
