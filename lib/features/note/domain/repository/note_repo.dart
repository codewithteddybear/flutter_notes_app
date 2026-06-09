import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/domain/entities/note.dart';

abstract interface class NoteRepo {
  Future addNewNote(NoteEntity note);
  Future updateNote(NoteEntity note);
  Future deleteNote(int noteId);

  // GET DATA
  FutureListOf<NoteEntity> getAllNotes();
  FutureListOf<NoteEntity> getNotesByCategory();
  FutureListOf<NoteEntity> getFavoriteNotes();
}
