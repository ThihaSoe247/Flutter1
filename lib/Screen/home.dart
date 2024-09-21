import 'package:flutter/material.dart';

import '../Database/note_table.dart';
import '../Database/notedao.dart';
import 'package:get/get.dart';

import 'add_screen.dart';

class Home extends StatelessWidget {
  final NoteDao? noteDao = Get.find();
  Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Floor Database"),
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {
              // Get.to(AddScreen());

              Get.to(() => AddScreen());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "delete",
            onPressed: () {},
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: noteDao?.getAllNotes(),
      builder: (_, data) {
        if (data.hasData) {
          return ListView.builder(
            itemBuilder: (_, position) {
              // Safely handle potential null values for title
              return Card(
                child: ListTile(
                  title: Text(data.data![position].title ?? "Untitled"),
                  subtitle: Text(data.data![position].message ?? "No message"),
                ),
              );
            },
            itemCount: data.data?.length ?? 0, // Null check for data length
          );
        } else if (data.hasError) {
          return Text("Error");
        } else {
          // Return a fallback widget if no data is available or while loading
          return Center(child: Text('Loading...'));
        }
      },
    );
  }
}
