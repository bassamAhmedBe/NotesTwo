import 'package:hive_flutter/adapters.dart';
part 'note_models.g.dart';
@HiveType(typeId: 0)
class NoteModels extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int colors;

  NoteModels({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.colors,
  });
}
