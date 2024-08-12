
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../Datamanager/Course.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
class DetailCourse extends StatelessWidget {


  final Course courseParse; // 
   DetailCourse({super.key, required this.courseParse});

   
  Marker marker =   Marker(child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 35.0,
                      ),
                      point: LatLng(48.866, 2.33)
                      );
                      
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Detail Course"),

    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Center(child: Image.asset("assets/images/running.png",height: 100,width: 100,)),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text("${courseParse.nom}",style: const TextStyle(fontFamily: "delicious",fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20),
            child: Text("${courseParse.description}",style:const TextStyle(fontFamily: "delicious",fontSize: 20),),
          ),
          const Padding(padding:const EdgeInsets.only(top:10)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("EPREUVES :",style: TextStyle(fontFamily: "delicius",fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildTextColumn(),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 10),
            child:  Text('Les coordonées gps - Départ latitude : ${courseParse.latitude.toString()} longitude : ${courseParse.longitude.toString()} ')
          ),Padding(
            padding: const EdgeInsets.only(top: 20),
            child:  Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: ShowMap(context,courseParse))
          ),
         
        ],
      ),
    ),

    );
  }

  Column buildTextColumn() {

    print("Build column");
    print(courseParse.epreuves);

    List<Widget> items = [];
  

    // Itération à travers le tableau de chaînes
    for (String current in courseParse.epreuves) {

      print(String);
      Widget row = Row(children: [
        Text(current)
      ],);
      // Création d'un widget Text pour chaque élément du tableau
      items.add(row);
    }

    // Retourne la colonne avec les widgets Text
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }

 FlutterMap ShowMap(BuildContext contex, Course course){
  Marker marker =   Marker(child: Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 35.0,
                      ),
                      point: LatLng(course.latitude!,course.longitude!)
                      );


   
    // Ajoutez d'autres épingles avec les coordonnées GPS nécessaires
     LatLng markerLatLng =  LatLng(course.latitude!,course.longitude!);
  
    return FlutterMap(options: MapOptions(
      initialCenter: LatLng(48.866, 2.333),
      initialZoom: 13.0 ),
      
      
      
        children: [
         TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
              ),  MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 45,
              size: const Size(40, 40),
              markers: [ marker],
              builder: (context, markers) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      markers.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
             
              
                
            
            
            
          
               

        ],
        );


  }
  


}
