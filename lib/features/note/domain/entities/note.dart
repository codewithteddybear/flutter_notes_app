class NoteEntity {
  NoteEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.dateModified,
    required this.categoryId,
    required this.isFavorite,
    required this.isLocked,
  });

  final int id;
  final String title;
  final String? content;
  final DateTime dateCreated;
  final DateTime dateModified;
  final int? categoryId;
  final bool isFavorite;
  final bool isLocked;

  late final bool isPinned;
  late final String categoryTitle;
  late final String categoryColor;

  NoteEntity copyWith({
    String? title,
    String? content,
    DateTime? dateModified,
    int? categoryId,
    bool? isPinned,
    bool? isFavorite,
    bool? isLocked,
  }) {
    return NoteEntity(
      id: id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateCreated: dateCreated,
      dateModified: dateModified ?? this.dateModified,
      categoryId: categoryId ?? this.categoryId,
      isFavorite: isFavorite ?? this.isFavorite,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
