
import 'package:floor/floor.dart';
import 'package:project_1/Database/notedao.dart';

import 'note_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;
}