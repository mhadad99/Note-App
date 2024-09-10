import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          CustomTextField(
            hint: 'Title',
            initialValue: note.title,
            onChanged: (value) {
              note.title = value!;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: 'Content',
            initialValue: note.subtitle,
            maxLines: 5,
            onChanged: (value) {
              note.subtitle = value!;
            },
          ),
        ],
      ),
    );
  }
}
