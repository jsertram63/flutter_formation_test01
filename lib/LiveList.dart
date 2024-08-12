import 'package:flutter/material.dart';


class MaListe extends StatelessWidget {
 

 final List mois = ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septemnbre","Octobre","Novembre","Decembre"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ma Liste")),
      body:ListView.separated(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(mois[index], style: TextStyle(fontSize: 30)),
            ),
          );
        },
        separatorBuilder: (context, position) {
          return Container(
            color: Colors.greenAccent,
            child: Text('Un exemple de séparateur',
                style: TextStyle(fontSize: 20)),
          );
        },
        itemCount: mois.length));
      
 

      
    
  }


}