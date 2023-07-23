import 'package:hive/hive.dart';
part 'notes_model.g.dart';

@HiveType(typeId:1)
class NotesModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String age;

  @HiveField(2)
  String mobile;

  NotesModel({
    required this.name,
    required this.age,
    required this.mobile,
  });
}
