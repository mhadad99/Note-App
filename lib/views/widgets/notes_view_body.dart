import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: BlocProvider.of<NotesCubit>(context).notes.isEmpty
                          ? Center(
                              child: Text("Try Add some Notes".toUpperCase()),
                            )
                          : const NotesListView()),
                ],
              ),
            ));
  }
}
