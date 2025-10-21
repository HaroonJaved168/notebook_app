import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notebook_app/model/note_model.dart';
import 'package:notebook_app/repository/note_repository.dart';
import 'package:notebook_app/screens/addnote/add_note.dart';
import 'package:notebook_app/screens/home/widgets/item_note.dart';
import 'package:path/path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text('Notebook'),
      ),

      body: FutureBuilder<List<NoteModel>>(
        future: NoteRepository.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notes found'));
          }

          final notes = snapshot.data!;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.description),
              );
            },
          );
        },
      ),


      floatingActionButton: FloatingActionButton(onPressed: (){

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddNote()));

        
      },
      
      child: Icon(Icons.add),),
    );
  }
}
