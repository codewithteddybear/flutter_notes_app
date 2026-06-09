class QuickNoteEntity {
  const QuickNoteEntity({
    required this.id,
    required this.content,
    required this.dateCreated,
    required this.dateModified,
  });

  final int id;
  final String content;
  final DateTime dateCreated;
  final DateTime dateModified;

  QuickNoteEntity copyWith({String? content, DateTime? dateModified}) {
    return QuickNoteEntity(
      id: id,
      content: content ?? this.content,
      dateCreated: dateCreated,
      dateModified: dateModified ?? this.dateModified,
    );
  }
}
