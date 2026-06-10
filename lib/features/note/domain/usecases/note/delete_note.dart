import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';

class DeleteNoteUsecase implements Usecase<void, int> {
  DeleteNoteUsecase({required NoteRepo repo}) : _repo = repo;

  final NoteRepo _repo;

  @override
  Future<void> call(int noteId) => _repo.deleteNote(noteId);
}
