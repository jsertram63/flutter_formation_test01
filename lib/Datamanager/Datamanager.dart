import 'Course.dart';

class DataManager{
  DataManager._();
  static final DataManager _instance = DataManager._();
  factory DataManager() => _instance;
  static DataManager get shared => _instance;

 List<Course> catalogues = [];


}