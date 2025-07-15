import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_project/data/class/activity_calss.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  late Future<Activity> futureActivity;

bool isFirst = true;
  @override
  void initState() {
    super.initState();
    futureActivity = fetchActivity();
  }

  Future<Activity> fetchActivity() async {
    final url = Uri.parse('https://bored-api.appbrewery.com/random');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }

  void _reload() {
    setState(() {
      futureActivity = fetchActivity();
    });
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Activity'),
        actions: [
          IconButton(
            onPressed:() {
              setState(() {
                isFirst = !isFirst;
              });
              
            },
            icon: Icon(Icons.switch_access_shortcut)),
        ],
      ),
      body: FutureBuilder<Activity>(
        future: futureActivity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No activity found.'));
          }

          final activity = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedCrossFade(firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📝 ${activity.activity}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  Text('👤 Participants: ${activity.participants}'),
                  Text('🎓 Type: ${activity.type}'),
                  Text('🧮 Availability: ${activity.availability}'),
                  Text('💰 Price: ${activity.price}'),
                  Text('♿ Accessibility: ${activity.accessibility}'),
                  Text('⏱ Duration: ${activity.duration}'),
                  Text(
                    '🧒 Kid Friendly: ${activity.kidFriendly ? "Yes" : "No"}',
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => _launchURL(activity.link),
                    child: const Text('🔗 Visit Activity Link'),
                  ),
                ],
              ),
            
             secondChild: Center(
              child: Image.asset('assets/image/bg.jpg'),
             ),
              crossFadeState: isFirst ?  CrossFadeState.showFirst : CrossFadeState.showSecond,
               duration: Duration(milliseconds: 1000),)
          );
        },
        
      ),
    );
  }
}
