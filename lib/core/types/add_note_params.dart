class AddNoteParams {
  AddNoteParams({
    required this.title,
    required this.content,
    required this.categoryId,
  });

  final String title;
  final String? content;
  final int? categoryId;
}
