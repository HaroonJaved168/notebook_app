import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook_app/model/note_model.dart';
import 'package:notebook_app/repository/note_repository.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Add Note'),

        actions: [

          IconButton(onPressed: (){ _insertNote();
            }, icon: Icon(Icons.check))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(

          children: [

            TextFormField(

              controller: titleController,
              decoration: InputDecoration(

                hintText: 'title',

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15)
                )
              )

            ),

            SizedBox(height: 15,),

        Expanded(
          child: TextFormField(
            controller: descriptionController,
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: 'description...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),

          ],

        ),
      ),
    );
  }

  _insertNote() async{

    final note = NoteModel(

      title : titleController.text,
      description: descriptionController.text,
      createdAT: DateTime.now()
        
    );
    
    await NoteRepository.insert(note : note);
  }




}
