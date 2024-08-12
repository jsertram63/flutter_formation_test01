class FormulaireModel {

  String? nom;
  String? descriptif;
  bool? surRoute;
  double? latitude;
  double? longitude;

   Map<String,bool> courses = {
      "marathon":false,
      "semi-marathon":false,
      "10 kms":false,
     
    };


  void remiseZeroModel(){
 
    // modelForm.courses.clear();
    descriptif = "";
    nom ="";
    surRoute = false;
    print("Remise à zero");
  }


  FormulaireModel({this.nom ="", this.descriptif= "",this.surRoute=true, this.latitude, this.longitude});




}