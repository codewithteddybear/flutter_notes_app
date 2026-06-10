import 'package:flutter_notes_app/core/types/pin_params.dart';
import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/repository/pinned_repo.dart';

class PinNoteUsecase implements Usecase<void, PinParams> {
  PinNoteUsecase({required PinnedRepo repo}) : _repo = repo;

  final PinnedRepo _repo;

  @override
  Future<void> call(PinParams params) =>
      _repo.pinNote(pinId: params.pinId, noteId: params.noteId!);
}
