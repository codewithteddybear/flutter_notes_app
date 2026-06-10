import 'package:flutter_notes_app/features/note/domain/entities/note.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:isar_community/isar.dart';

// contains [category_table] generated codes too
part 'note_table.g.dart';

//? to prevent circular dependency
part 'category_table.dart';

@Collection(accessor: 'note')
class NoteTable {
  NoteTable({
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.dateModified,
    required this.isFavorite,
    required this.isLocked,
  });

  Id id = Isar.autoIncrement;
  final String title;
  final String? content;
  final DateTime dateCreated;
  @Index()
  final DateTime dateModified;
  final category = IsarLink<CategoryTable>();
  final bool isFavorite;
  final bool isLocked;

  // convert [NoteTable] to [NoteEntity]
  NoteEntity toEntity() => NoteEntity(
    id: id,
    title: title,
    content: content,
    dateCreated: dateCreated,
    dateModified: dateModified,
    categoryId: category.value?.id,
    isFavorite: isFavorite,
    isLocked: isLocked,
  );

  // create [NoteTable] from [NoteEntity]
  factory NoteTable.fromEntity(NoteEntity noteEntity) =>
      NoteTable(
          title: noteEntity.title,
          content: noteEntity.content,
          dateCreated: noteEntity.dateCreated,
          dateModified: noteEntity.dateModified,
          isFavorite: noteEntity.isFavorite,
          isLocked: noteEntity.isLocked,
        )
        ..category.value = noteEntity.categoryId != null
            ? CategoryTable.stub(id: noteEntity.categoryId!)
            : null;
}
