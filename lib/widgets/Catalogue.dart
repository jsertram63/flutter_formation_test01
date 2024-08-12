



import 'package:flutter/material.dart';
import 'package:flutter_test_application/Datamanager/Boxes.dart';
import 'package:flutter_test_application/widgets/DetailCourse.dart';

import '../Datamanager/Course.dart';
import '../Datamanager/Datamanager.dart';

class Catalogue extends StatelessWidget {
Catalogue({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Catalogue de courses"),
    ),
    body: ListView.separated(itemBuilder: ( context, index){
    

      //return _buildRows(DataManager.shared.catalogues[index],context);
      Course course = boxCourses.getAt(index);
      print(course.nom);
      print(course.toString());
      print(boxCourses.length);
      return _buildRows(course, context);
   

    }, separatorBuilder: (index, context){
      return Container(
        height: 2,
        color: Colors.black,
      );

    }, 
    //itemCount: DataManager.shared.catalogues.length)
    itemCount: boxCourses.length),
    );
  }

     Widget _buildRows(Course course, BuildContext context){

      print(course.description);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: ListTile(
        title: Padding(padding: const EdgeInsets.only(bottom: 16.0),
        child: Text(course.nom ?? "marathon", style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
        ),
        subtitle: Text(course.description ?? "Description", style: TextStyle(fontSize: 12),) ,
        trailing: ClipRRect(borderRadius: BorderRadius.circular(8),
        child: Image.asset("assets/images/running.png")),
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailCourse(courseParse: course)));
         
        },
       
      ),
    );
  }
}