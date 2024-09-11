import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes;
        return ListView.builder(
          itemCount: BlocProvider.of<NotesCubit>(context)
                  .searchTextController
                  .text
                  .isEmpty
              ? notes.length
              : BlocProvider.of<NotesCubit>(context).searchedNotes.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: BlocProvider.of<NotesCubit>(context)
                    .searchTextController
                    .text
                    .isEmpty
                ? Dismissible(
                    key: Key(notes.toString()),
                    onDismissed: (direction) {
                      notes[index].delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Note dismissed')));
                    },
                    child: NoteItem(
                      note: notes[index],
                    ),
                  )
                : NoteItem(
                    note: BlocProvider.of<NotesCubit>(context)
                        .searchedNotes[index],
                  ),
          ),
        );
      },
    );
  }
}
