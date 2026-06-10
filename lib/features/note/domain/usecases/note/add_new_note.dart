import 'package:flutter_notes_app/core/types/add_note_params.dart';
import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/note.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';

class AddNewNoteUsecase implements Usecase<void, AddNoteParams> {
  AddNewNoteUsecase({required NoteRepo repo}) : _repo = repo;

  final NoteRepo _repo;

  @override
  Future<void> call(AddNoteParams params) => _repo.addNewNote(
    NoteEntity(
      // will not be used
      // id generation is automatically handled by DB
      id: 0,
      title: params.title,
      content: params.content,
      dateCreated: DateTime.now(),
      dateModified: DateTime.now(),
      categoryId: params.categoryId,
      // always false at creation
      isFavorite: false,
      // always false at creation
      isLocked: false,
    ),
  );
}
