import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/data/models/note_table.dart';
import 'package:isar_community/isar.dart';

class NoteDao {
  NoteDao({required Isar db}) : _db = db;

  final Isar _db;

  Future addNewNote(NoteTable note) => _db.writeTxn(() async {
    await _db.note.put(note);
    //! required
    // otherwise the link between note and its category will not be saved
    await note.category.save();
  });

  Future updateNote(NoteTable note) => _db.writeTxn(() async {
    await _db.note.put(note);

    if (note.category.isChanged) {
      //! required
      // otherwise the link between note and its category will not be updated
      await note.category.save();
    }
  });

  Future deleteNote(int noteId) => _db.writeTxn(() => _db.note.delete(noteId));

  // GET DATA

  // populate notes category field with associated category information
  FutureListOf<NoteTable> loadNotesCategories(List<NoteTable> notes) async {
    for (final n in notes) {
      await n.category.load();
    }

    return notes;
  }

  QueryBuilder<NoteTable, NoteTable, QAfterFilterCondition> excludeNotes(
    List<int> exclude,
  ) => _db.note.filter().allOf(exclude, (q, id) => q.not().idEqualTo(id));

  //? not used ``_db.note.getAll(ids)`` because it returns [List<NoteTable>>]
  //? handling that in [loadNotesCategories] would've been a lot of hassle
  FutureListOf<NoteTable> getNotesByIDs(List<int> ids) => _db.txn(
    () async => loadNotesCategories(
      await _db.note.where().anyOf(ids, (q, id) => q.idEqualTo(id)).findAll(),
    ),
  );

  FutureListOf<NoteTable> getAllNotes({List<int> exclude = const []}) =>
      _db.txn(
        () async => loadNotesCategories(await excludeNotes(exclude).findAll()),
      );

  FutureListOf<NoteTable> getFavoriteNotes({List<int> exclude = const []}) =>
      _db.txn(
        () async => loadNotesCategories(
          await excludeNotes(exclude).isFavoriteEqualTo(true).findAll(),
        ),
      );

  FutureListOf<NoteTable> getNotesByCategory(
    int categoryId, {
    List<int> exclude = const [],
  }) => _db.txn(
    () async => loadNotesCategories(
      await excludeNotes(
        exclude,
      ).category((q) => q.idEqualTo(categoryId)).findAll(),
    ),
  );
}
