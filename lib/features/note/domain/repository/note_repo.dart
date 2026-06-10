import 'package:flutter_notes_app/features/note/domain/entities/note.dart';

abstract interface class NoteRepo {
  Future addNewNote(NoteEntity note);
  Future updateNote(NoteEntity note);
  Future deleteNote(int noteId);

  // GET DATA
  // FIRST LIST CONTAINS PINNED ENTITIES
  // SECOND LIST CONTAINS ENTITIES
  Future<(List<NoteEntity>, List<NoteEntity>)> getAllNotes();
  Future<(List<NoteEntity>, List<NoteEntity>)> getNotesByCategory(
    int categoryId,
  );
  Future<(List<NoteEntity>, List<NoteEntity>)> getFavoriteNotes();
}
