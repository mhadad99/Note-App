import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_search_icon.dart';
import 'package:note_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit"),
          actions: const [
            CustomSearchIcon(
              icon: Icons.check,
            ),
          ],
        ),
        body: const EditNoteViewBody());
  }
}
