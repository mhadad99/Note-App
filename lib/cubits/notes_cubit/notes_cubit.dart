import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  List<NoteModel> searchedNotes = [];
  searchAtNotes(String value) {
    searchedNotes = notes
        .where(
          (note) => note.title.contains(value) || note.subtitle.contains(value),
        )
        .toList();
    emit(NotesSearch());
  }

  bool isSearching = false;
  final searchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: searchTextController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Find a note',
      ),
      onChanged: (value) {
        searchAtNotes(value);
      },
    );
  }

  Widget buildAppBarTitle() {
    return const Text(
      "Notes",
      style: TextStyle(color: Colors.white),
    );
  }

  List<Widget> buildAppBarAction(context) {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              startSearch(context);
            },
            icon: const Icon(Icons.search))
      ];
    }
  }

  void startSearch(context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: _stopSearching,
    ));
    isSearching = true;
    emit(NotesSearch());
  }

  void _stopSearching() {
    _clearSearch();
    isSearching = false;
    emit(NotesSearch());
  }

  void _clearSearch() {
    searchTextController.clear();
  }
}
