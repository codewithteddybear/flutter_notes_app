import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/note.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';

class UpdateNoteUsecase implements Usecase<void, NoteEntity> {
  UpdateNoteUsecase({required NoteRepo repo}) : _repo = repo;

  final NoteRepo _repo;

  @override
  Future<void> call(NoteEntity note) => _repo.updateNote(note);
}
