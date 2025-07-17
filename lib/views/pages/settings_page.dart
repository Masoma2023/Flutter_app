import 'package:flutter/material.dart';
import 'package:flutter_project/views/pages/onboarding.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key,
  required this.title,
  });
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool ? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    FilledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 5),
                    content: Text('Snackbar'),
                    behavior: SnackBarBehavior.floating,
                    ),);

                },
                
                child: Text('Open Snackbar'),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.0,
                endIndent: 200.0,
              ),
              FilledButton(
                onPressed: () {
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Alert Title'),
                      content: Text('Alert Contant'),
                      actions: [
                        FilledButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Close'),),
                      ],
                    );
                  });
                },

                child: Text('Show Dialog'),
              ),
          DropdownButton(
            value: menuItem,
            items: [
            DropdownMenuItem(value: 'e1', child:Text('Element 1'),),
            DropdownMenuItem(value: 'e2', child: Text('Element 2')),
            DropdownMenuItem(value: 'e3', child: Text('Element 3'))
          ], onChanged: (String? value){
            setState(() {
              menuItem = value;
            });
          },),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              ),
              onEditingComplete: () {
                setState(() {
                  
                });
              },
              ),
          Text(controller.text),
          Checkbox.adaptive
          (value: isChecked, onChanged: (bool? value){
            setState(() {
              isChecked = value;
            });
          }),
          CheckboxListTile.adaptive(
            tristate: true,
            title: Text('Open Snackbar'),
            value: isChecked, onChanged: (bool? value){
            setState(() {
              isChecked = value;
            });
          }),
          Switch.adaptive(
          value: isSwitched,
         onChanged: (bool value) {
          setState(() {
            isSwitched = value;
          });
         }),
         SwitchListTile.adaptive(
         
            title: Text('Switch me'),
          
          value: isSwitched,
         onChanged: (bool value) {
          setState(() {
            isSwitched = value;
          });
         }),
         Slider.adaptive(
          max: 10.0,
          
          value: sliderValue, onChanged: (value) {
           setState(() {
             sliderValue = value;
           });
           print(value);
         },),
        InkWell(
          splashColor: Colors.teal,
            onTap: () {
              print('image selected');
            },
           child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.white12,
           ),
            ),
    
              ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return OnboardingPage();
                        },
            
                      ),
                    );
              },
              child: Text('Show Flexible and Expanded'),
            ),
             FilledButton(
              onPressed: () {}, child: Text('Click me')),
              TextButton(
                onPressed: () {}, child: Text('Click me')),
                OutlinedButton(
                  onPressed: () {}, child: Text('Click me')),
                CloseButton(),
                BackButton(),
            
        ],
        ),
      ),
    ),
    );
  }
}