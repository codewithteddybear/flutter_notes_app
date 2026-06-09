import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/quick_note/domain/entities/quick_note.dart';

abstract class QuickNoteRepo {
  Future addNewNote(QuickNoteEntity quickNote);
  Future updateNote(QuickNoteEntity quickNote);
  Future deleteNote(int quickNoteId);

  // GET DATA
  FutureListOf<QuickNoteEntity> getAllQuickNotes();
}
