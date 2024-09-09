import 'package:flutter/material.dart';
import 'package:note_app/views/notes_view.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        //primaryColor: Colors.cyanAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesView(),
    );
  }
}
