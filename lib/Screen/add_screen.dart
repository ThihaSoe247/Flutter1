import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Database/noteDao.dart';


class AddScreen extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  // final NoteDao noteDao = Get.find();

  @override
  Widget build(BuildContext context) {
    print("LEee pae ${Get.find<NoteDao>()}");


    return Scaffold(
      appBar: AppBar(
        title : const Text("Add Note")
      ),
      body:Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder()
              ),

            ),
            const SizedBox(height: 10),
            TextField(
              controller: message,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                hintText: "Message"
              ),

         ),
            OutlinedButton(onPressed: (){

            },
              child: const Text("Add Note"),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
              ),


            )
          ],
        ),
      )
    );
  }
}
