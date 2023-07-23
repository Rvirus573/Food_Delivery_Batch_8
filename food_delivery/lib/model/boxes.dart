import 'package:food_delivery/model/notes_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('data_box');
}
