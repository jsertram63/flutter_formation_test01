import 'package:flutter/material.dart';
import 'package:flutter_test_application/Datamanager/Boxes.dart';
import 'package:flutter_test_application/Datamanager/Course.dart';
import 'package:flutter_test_application/Datamanager/Post.dart';
import 'package:flutter_test_application/HomePage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
 
 
 
 
  Hive.registerAdapter(CourseAdapter());
  Hive.registerAdapter(PostAdapter());
  boxCourses = await Hive.openBox<Course>('CourseBox');
  boxPosts = await Hive.openBox<Post>('PostBox');

  // Obtain a list of the available cameras on the device.


// Get a specific camera from the list of available cameras.

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    print("=====================");
    print(context);
  print("======================");
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage()
    );
  }
}

