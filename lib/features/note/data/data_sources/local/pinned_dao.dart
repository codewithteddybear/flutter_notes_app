import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/data/models/pinned_table.dart';
import 'package:isar_community/isar.dart';

class PinnedDao {
  PinnedDao({required Isar db}) : _db = db;

  final Isar _db;

  // PIN

  // when pinning or unpinning a note only notes property of [PinnedTable] changes
  // if [PinnedNote] object already exists, it will be updated otherwise added
  Future addOrUpdatePin(PinnedTable pin) =>
      _db.writeTxn(() => _db.pinned.put(pin));

  Future deletePin(int pinId) => _db.writeTxn(() => _db.pinned.delete(pinId));

  Future<PinnedTable?> getPinById(int pinId) =>
      _db.txn(() => _db.pinned.get(pinId));

  // PIN NOTES
  Future deleteNoteFromPins(int noteId) => _db.writeTxn(() async {
    // get pins that their notes property contains [noteId]
    final pins = await _db.pinned.where().notesElementEqualTo(noteId).findAll();

    // remove [noteId] from notes field of each pin
    //? ``pin.notes.remove(noteId)`` can't be used
    for (final pin in pins) {
      pin.notes = pin.notes.where((e) => e != noteId).toList();
    }

    // update pins
    _db.pinned.putAll(pins);
  });

  FutureListOf<int> getPinnedNotesId(int pinId) =>
      _db.txn(() async => (await _db.pinned.get(pinId))?.notes ?? []);
}
