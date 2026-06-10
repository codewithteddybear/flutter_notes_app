import 'package:flutter_notes_app/core/constants/constants.dart' as constants;
import 'package:flutter_notes_app/features/note/data/data_sources/local/note_dao.dart';
import 'package:flutter_notes_app/features/note/data/data_sources/local/pinned_dao.dart';
import 'package:flutter_notes_app/features/note/data/models/note_table.dart';
import 'package:flutter_notes_app/features/note/domain/entities/note.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';

class NoteRepoImpl implements NoteRepo {
  NoteRepoImpl({required NoteDao noteDao, required PinnedDao pinnedDao})
    : _pinnedDao = pinnedDao,
      _noteDao = noteDao;

  final NoteDao _noteDao;
  final PinnedDao _pinnedDao;

  @override
  Future<dynamic> addNewNote(NoteEntity note) =>
      _noteDao.addNewNote(NoteTable.fromEntity(note));

  @override
  Future<dynamic> updateNote(NoteEntity note) =>
      _noteDao.updateNote(NoteTable.fromEntity(note));

  @override
  Future<dynamic> deleteNote(int noteId) async {
    // deleted note from pins
    await _pinnedDao.deleteNoteFromPins(noteId);
    await _noteDao.deleteNote(noteId);
  }

  // GET DATA

  List<NoteEntity> _toEntity(List<NoteTable> notes, {required bool isPinned}) =>
      notes.map((e) {
        final entity = e.toEntity();

        if (e.category.value != null) {
          entity
            ..categoryTitle = e.category.value!.title
            ..categoryColor = e.category.value!.color;
        }

        return entity..isPinned = isPinned;
      }).toList();

  @override
  Future<(List<NoteEntity>, List<NoteEntity>)> getAllNotes() async {
    final pinnedNotes = await _pinnedDao.getPinnedNotesId(
      constants.allNotesPageId,
    );
    return (
      _toEntity(await _noteDao.getNotesByIDs(pinnedNotes), isPinned: true),
      _toEntity(
        await _noteDao.getAllNotes(exclude: pinnedNotes),
        isPinned: false,
      ),
    );
  }

  @override
  Future<(List<NoteEntity>, List<NoteEntity>)> getFavoriteNotes() async {
    final pinnedNotes = await _pinnedDao.getPinnedNotesId(
      constants.favoriteNotesPageId,
    );

    return (
      _toEntity(await _noteDao.getNotesByIDs(pinnedNotes), isPinned: true),
      _toEntity(
        await _noteDao.getFavoriteNotes(exclude: pinnedNotes),
        isPinned: false,
      ),
    );
  }

  @override
  Future<(List<NoteEntity>, List<NoteEntity>)> getNotesByCategory(
    int categoryId,
  ) async {
    final pinnedNotes = await _pinnedDao.getPinnedNotesId(categoryId);

    return (
      _toEntity(await _noteDao.getNotesByIDs(pinnedNotes), isPinned: true),
      _toEntity(
        await _noteDao.getNotesByCategory(categoryId, exclude: pinnedNotes),
        isPinned: false,
      ),
    );
  }
}
