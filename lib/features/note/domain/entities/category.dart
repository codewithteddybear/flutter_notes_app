class CategoryEntity {
  CategoryEntity({
    required this.id,
    required this.title,
    required this.color,
    required this.isLocked,
    required this.isAppLockedCategory,
  });

  final int id;
  final String title;
  final String color;
  final bool isLocked;
  final bool isAppLockedCategory;

  late final int notesCount;

  CategoryEntity copyWith({String? title, String? color, bool? isLocked}) {
    return CategoryEntity(
      id: id,
      title: title ?? this.title,
      color: color ?? this.color,
      isLocked: isLocked ?? this.isLocked,
      isAppLockedCategory: isAppLockedCategory,
    );
  }
}
