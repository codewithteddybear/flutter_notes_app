import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/note.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';

class GetNotesByCategoryUsecase
    implements Usecase<(List<NoteEntity>, List<NoteEntity>), int> {
  GetNotesByCategoryUsecase({required NoteRepo repo}) : _repo = repo;

  final NoteRepo _repo;

  @override
  Future<(List<NoteEntity>, List<NoteEntity>)> call(int categoryOd) =>
      _repo.getNotesByCategory(categoryOd);
}
