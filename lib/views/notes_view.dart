import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/views/widgets/notes_view_body.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: BlocProvider.of<NotesCubit>(context).isSearching
                ? BlocProvider.of<NotesCubit>(context).buildSearchField()
                : BlocProvider.of<NotesCubit>(context).buildAppBarTitle(),
            actions:
                BlocProvider.of<NotesCubit>(context).buildAppBarAction(context),
          ),
          body: const NotesViewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                },
              );
            },
            shape: const CircleBorder(),
            backgroundColor: kPrimaryColor,
            child: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
