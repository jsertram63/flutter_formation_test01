import 'package:flutter/material.dart';
import 'package:flutter_test_application/Datamanager/FormulaireModel.dart';

class GpsImput extends StatefulWidget {
   GpsImput({super.key, required this.model});
  FormulaireModel model;

  @override
  State<GpsImput> createState() => _GpsImputState(
    

  );
}

class _GpsImputState extends State<GpsImput> {

  late TextEditingController latitudeController;
  late TextEditingController longitudeController;
  @override
  void initState() {
    latitudeController =  TextEditingController();
    longitudeController = TextEditingController();
     latitudeController.addListener(_ecouteurLat);
     longitudeController.addListener(_ecouteurLon);
     
  
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
  }

  void _ecouteurLat(){
    //print(double.parse(latitudeController.text));
    try {
       var temp =  latitudeController.text;
        widget.model.latitude = double.parse(temp) ?? 0;
    }catch(e){
      print("Erreur de conversion en double longitude : $e");
    }
  


  }

  void _ecouteurLon(){
    try {
       var temp =  longitudeController.text;
        widget.model.longitude = double.parse(temp) ?? 0;
    }catch(e){
      print("Erreur de conversion en double longitude : $e");
    }
   
 

  }

  


   Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Column(
        children: [
          // Titre "GPS"
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Départ GPS')),
              ),
            ],
          ),
          // Champs de saisie Latitude et Longitude
          Row(
            children: [
              // Champ de saisie Latitude
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: latitudeController,
                    decoration: InputDecoration(labelText: 'Latitude'),
                  ),
                ),
              ),
              // Trait de séparation
              Container(
                width: 1,
                height: 60,
                color: Colors.black,
              ),
              // Champ de saisie Longitude
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: longitudeController,
                    decoration: InputDecoration(labelText: 'Longitude'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}