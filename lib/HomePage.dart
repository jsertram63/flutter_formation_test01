import 'package:flutter/material.dart';
import 'package:flutter_test_application/SecondPage.dart';
import 'package:flutter_test_application/TroisiemePage.dart';
import 'package:flutter_test_application/widgets/MyDrawer.dart';
import 'package:flutter_test_application/widgets/Onglet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int cpt = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(title:const Text("Ma première application"),
      
    
      ) ,
      drawer:DrawerList(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Expanded(
              flex: 1,
              child:Container(
              color: Colors.red,
              )),
            Expanded(
              flex: 3,
              child: Container(
              child: Center(child: Text("${cpt}",style: const TextStyle(fontSize: 100),)),
              color: Colors.blue
            )),
             Expanded(
              flex: 1,
              child: Container(
              
              color: Colors.green
            )),
            
          ],
      
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          print("Boutton appuuyé");
          setState(() {
            
            cpt = cpt + 1;
          });

        },
        child: Icon(Icons.add),
        ),
        
      
                

    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
      Padding(
        padding: EdgeInsets.only(top:screenHeight*0.06),
        child: Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.blue),
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 75,
                width: 75,
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/lapin.png'),
                    
                  ),
              ),
            ),
          ],
        ),
          
        ),
      ),
      GestureDetector(child:
       SizedBox(width: MediaQuery.of(context).size.width,
       child: const  Padding(
         padding:EdgeInsets.all(10.0),
         child:  Text("Rubrique 1"),
       ),),
      onTap: () => {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const HomePage()))
        
      },),
      const Divider(color: Colors.blue,
      thickness: 2,
      indent:20,
      endIndent: 20,
      ),
      GestureDetector(
        onTap: () => Navigator.push(context, (MaterialPageRoute(builder: (context)=> const SecondPage()))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Rubrique 2"),
          )),
      ),
      const Divider(color: Colors.blue,
      thickness: 2,
      indent:20,
      endIndent: 20,
      ),
      GestureDetector(
         onTap: () => Navigator.push(context, (MaterialPageRoute(builder: (context)=> const TroisiemePage()))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: OngletTextStyle(text: "rubrique 3"),
          )),
      ),
       const Divider(color: Colors.blue,
      thickness: 2,
      indent:20,
      endIndent: 20,
      ),


    ]),);
  }
}