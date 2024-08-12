import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test_application/Datamanager/Boxes.dart';
import 'package:flutter_test_application/widgets/GpsField.dart';
import '../Datamanager/Course.dart';
import '../Datamanager/Datamanager.dart';
import '../Datamanager/FormulaireModel.dart';

import 'package:flutter/cupertino.dart';

class FormulairePage extends StatefulWidget {
  FormulairePage({super.key});

  @override
  State<FormulairePage> createState() => _FormulairePageState();
}

class _FormulairePageState extends State<FormulairePage> {
  Map<String, bool> courses = {
    "marathon": false,
    "semi-marathon": false,
    "10 kms": false,
  };

  FormulaireModel modelForm = FormulaireModel();
  bool isEditing = false;

  late TextEditingController controller;
  String nom = "";
  //String descriptif = "";
  //bool switchValue = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.addListener(_ecouteurText);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void _ecouteurText() {
    setState(() {
      //descriptif = controller.text;
      modelForm.descriptif = controller.text;
      isEditing = true;
      print(modelForm.descriptif);
    });
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = modelForm.nom;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text!.isEmpty) {
      return 'ne pas être vide';
    }
    if (text!.length < 4) {
      return 'Trop court';
    }
    // return null if the text is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    bool plateForm = Platform.isIOS;
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: !plateForm
              ? TextField(
                  onChanged: (value) {
                    setState(() {
                      //nom = value;
                      isEditing = true;
                      modelForm.nom = value;
                      //print(nom);
                    });
                  },
                  decoration: InputDecoration(
                      errorText: _errorText,
                      labelText: "Entrée le nom de la course",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              : CupertinoTextField(
                  onChanged: (value) {
                    setState(() {
                      //nom = value;
                      isEditing = true;
                      modelForm.nom = value;
                      //print(nom);
                    });
                  },
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CupertinoColors.systemGrey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: "decriptif",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text((modelForm.surRoute! ? "sur route" : "trail")),
                !plateForm ?
               
                Switch(
                    value: modelForm.surRoute!,
                    onChanged: (bool) {
                      setState(() {
                        //switchValue = bool;
                        modelForm.surRoute = bool;
                      });
                    }) : CupertinoSwitch(value: modelForm.surRoute!, onChanged: (bool) {
                      setState(() {
                        //switchValue = bool;
                        modelForm.surRoute = bool;
                      });
                    })
              ],
            )),
        Padding(
          padding: EdgeInsets.all(10),
          child: constructionListDecourses(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Récapitulatif ${modelForm.nom}",
            style: TextStyle(fontFamily: "delicious", fontSize: 16),
          ),
        ),
        GpsImput(model: modelForm),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Description : ${modelForm.descriptif}"),
        ),
     
        Padding(
          padding: EdgeInsets.all(5),
          child: recapcourses(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                print(boxCourses);
                ajoutCourses();
              },
              child: Text('Ajout')),
        )
      ],
    ));
  }

  void ajoutCourses() {
    //Course coursAjout = Course(modelForm.nom, modelForm.descriptif,
      //  modelForm.surRoute! ? true : false,);
      print(modelForm.latitude.toString());
   Course courseAjout = Course(modelForm.nom, modelForm.descriptif, modelForm.surRoute! ? true : false,modelForm.latitude!, modelForm.longitude!);
    modelForm.courses.forEach((langageKey, coche) {
      if (coche == true) {
        courseAjout.epreuves.add(langageKey);
      }
    });
    boxCourses.add(courseAjout); // Ajout dans la box

    DataManager.shared.catalogues.add(courseAjout);
    print(DataManager.shared.catalogues);
    //remiseZeroModel(modelForm);
    print("ajout");
    Navigator.pop(context);

    // modelForm.remiseZeroModel();
  }

  Column constructionListDecourses() {
    List<Widget> items = [];
    modelForm.courses.forEach((langageKey, coche) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(langageKey),
          Checkbox(
              value: coche,
              onChanged: ((newValue) {
                // la méthode setState
                setState(() {
                  modelForm.courses[langageKey] = newValue ?? false;
                });
              }))
        ],
      );
      items.add(row);
    });
    return Column(
      children: items,
    );
  }

  Column recapcourses() {
    List<Widget> itemscourses =
        []; // on déclare un tableau pour ranger des cellules
    modelForm.courses.forEach((langageKey, value) {
      // on parcours un dictionnaire
      if (value == true) {
        Widget row = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(langageKey)]);
        itemscourses.add(row);
      }
    });
    return Column(children: itemscourses);
  }
}
