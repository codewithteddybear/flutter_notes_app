abstract interface class PinnedRepo {
  Future pinNote({required int pinId, required int noteId});
  Future unpinNote({required int pinId, required int noteId});
  Future reorderPins({required int pinId, required List<int> newOrder});
}
