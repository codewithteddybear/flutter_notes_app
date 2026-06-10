import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/data/models/note_table.dart';
import 'package:isar_community/isar.dart';

class CategoryDao {
  CategoryDao({required Isar db}) : _db = db;

  final Isar _db;

  Future<int> addNewCategory(CategoryTable category) =>
      _db.writeTxn(() => _db.category.put(category));

  Future<int> updateCategory(CategoryTable category) =>
      _db.writeTxn(() => _db.category.put(category));

  // Delete the category and optionally delete all notes associated with it
  // by default, it will delete all notes associated with the category
  Future deleteCategory(int categoryId, {bool deleteNotes = true}) async =>
      await _db.writeTxn(() async {
        if (deleteNotes) {
          await _db.note
              .filter()
              .category((q) => q.idEqualTo(categoryId))
              .deleteAll();
        }
        return await _db.category.delete(categoryId);
      });

  // GET DATA

  // Returns a list of tuples containing the category and the count of notes associated with it
  FutureListOf<(CategoryTable, int)> categoriesWithNotesCount(
    List<CategoryTable> categories,
  ) async {
    final List<(CategoryTable, int)> categoriesWithNotesCount = [];

    for (final c in categories) {
      // count notes
      final int notesCount = await c.notes.count();

      categoriesWithNotesCount.add((c, notesCount));
    }

    return categoriesWithNotesCount;
  }

  FutureListOf<(CategoryTable, int)> getAllCategories() => _db.txn(
    () async => categoriesWithNotesCount(await _db.category.where().findAll()),
  );
}
