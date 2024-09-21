import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_1/Database/note_database.dart';

import 'Database/notedao.dart';
import 'Screen/home.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder("note.db").build(),
        builder: (context, data) {
          if(data.hasData) {
            final NoteDao? noteDao = data.data?.noteDao;
            print("Note Dao =====>  $noteDao");
            Get.put(noteDao);
            return Home();
          } else if(data.hasError) {
            return Text("Error");
          } else {
            return Text("Loading");
          }
        },
      ),
    );
  }
}