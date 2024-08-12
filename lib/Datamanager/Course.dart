
import 'package:hive/hive.dart';

part 'Course.g.dart';

@HiveType(typeId: 1)
class Course {
  @HiveField(0)
  String? nom;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool? surRoute;
  @HiveField(3)
  List<String> epreuves = [];
 
 
  @HiveField(4)
  double? latitude;
  @HiveField(5)
  double? longitude;
  Course(this.nom,this.description, this.surRoute, this.latitude, this.longitude);
}