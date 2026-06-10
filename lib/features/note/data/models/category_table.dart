part of 'note_table.dart';

@Collection(accessor: 'category')
class CategoryTable {
  CategoryTable({
    required this.title,
    required this.color,
    required this.isLocked,
    required this.isAppLockedCategory,
  });

  // used when adding category to [NoteTable] only using id
  // Isar links uses only id of the given object to relate tables
  factory CategoryTable.stub({required Id id}) => CategoryTable(
    title: '',
    color: '',
    isLocked: false,
    isAppLockedCategory: false,
  )..id = id;

  Id id = Isar.autoIncrement;
  final String title;
  final String color;
  final bool isLocked;
  final bool isAppLockedCategory;

  @Backlink(to: 'category')
  final notes = IsarLinks<NoteTable>();

  // convert [CategoryTable] to [CategoryEntity]
  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    title: title,
    color: color,
    isLocked: isLocked,
    isAppLockedCategory: isAppLockedCategory,
  );

  // create [CategoryTable] from [CategoryEntity]
  CategoryTable.fromEntity(CategoryEntity categoryEntity)
    : this(
        title: categoryEntity.title,
        color: categoryEntity.color,
        isLocked: categoryEntity.isLocked,
        isAppLockedCategory: categoryEntity.isAppLockedCategory,
      );
}
