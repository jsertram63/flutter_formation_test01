import 'package:flutter/material.dart';
import 'package:flutter_test_application/SecondPage.dart';
import 'package:flutter_test_application/TroisiemePage.dart';
import 'package:flutter_test_application/widgets/Catalogue.dart';
import 'package:flutter_test_application/widgets/FetchPage.dart';
import 'package:flutter_test_application/widgets/FetchPage2.dart';
import 'package:flutter_test_application/widgets/FormulairePage.dart';
import 'package:flutter_test_application/widgets/GridPage.dart';
import 'package:flutter_test_application/widgets/Multimediat.dart';

import '../HomePage.dart';
import '../LiveList.dart';


class DrawerList extends StatelessWidget {
  const DrawerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/lapin.png'),
          radius: 50,),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text('Menu Flutter',style: TextStyle(
              fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold),),
          )
        ]),
      ),
      ListTile(title:Text("Rubrique 1"),
      // le callback 
      onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage()));
      },
      
      ),
      Divider(color: Colors.black,thickness: 2.0,),
      ListTile(title: Text("Rubrique 2"),
      onTap: (){
       Navigator.push(context, (MaterialPageRoute(builder: (context)=> const SecondPage())));
      },),
   
      
      
       Divider(color: Colors.black,thickness: 2.0,),
      ListTile(title:Text("live des listes"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => MaListe()));
      },
      
      ),
      Divider(color: Colors.black,thickness: 2.0,),
        ListTile(title:Text("Formulaire"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => TroisiemePage()));
      }),
       Divider(color: Colors.black,thickness: 2.0,),
        ListTile(title:Text("Catalogue courses"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Catalogue()));
      }),
        Divider(color: Colors.black,thickness: 2.0,),
        ListTile(title:Text("Récupération de données 1"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageList()));
      }),
         Divider(color: Colors.black,thickness: 2.0,),
        ListTile(title:Text("Récupération de données 2"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageListe2()));
      }),
         Divider(color: Colors.black,thickness: 2.0,),
        ListTile(title:Text("Affichage Grille"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => GridPage()));
      }),
         Divider(color: Colors.black,thickness: 2.0,),
       ListTile(title:Text("Multimedia"),
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => MultimediaPage()));
      })

      



    ]), );
  }
}

