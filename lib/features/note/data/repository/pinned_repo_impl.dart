import 'package:flutter_notes_app/features/note/data/data_sources/local/pinned_dao.dart';
import 'package:flutter_notes_app/features/note/data/models/pinned_table.dart';
import 'package:flutter_notes_app/features/note/domain/repository/pinned_repo.dart';

class PinnedRepoImpl implements PinnedRepo {
  PinnedRepoImpl({required PinnedDao pinnedDao}) : _pinnedDao = pinnedDao;

  final PinnedDao _pinnedDao;

  @override
  Future pinNote({required int pinId, required int noteId}) async {
    final pin = await _pinnedDao.getPinById(pinId);

    if (pin == null) {
      return _pinnedDao.addOrUpdatePin(PinnedTable(id: pinId, notes: [noteId]));
    }

    if (!pin.notes.contains(noteId)) {
      //? ``pin.notes.add(noteId)`` can't be used
      pin.notes = [...pin.notes, noteId];
      return _pinnedDao.addOrUpdatePin(pin);
    }
  }

  @override
  Future unpinNote({required int pinId, required int noteId}) async {
    final pin = await _pinnedDao.getPinById(pinId);

    if (pin != null) {
      //? ``pin.notes.remove(noteId)`` can't be used
      pin.notes = pin.notes.where((e) => e != noteId).toList();
      return _pinnedDao.addOrUpdatePin(pin);
    }
  }

  @override
  Future reorderPins({required int pinId, required List<int> newOrder}) =>
      _pinnedDao.addOrUpdatePin(PinnedTable(id: pinId, notes: newOrder));
}
