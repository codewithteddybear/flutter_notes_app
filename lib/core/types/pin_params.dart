class PinParams {
  // PinParams({required this.pinId, this.noteId, this.notesOrder})
  //   : assert(
  //       noteId != null || notesOrder != null,
  //       'Either [noteId] or [notesOrder] must be provided',
  //     );

  // used for single note operations
  PinParams.note({required this.pinId, required int this.noteId})
    : notesOrder = null;

  // used for reorder notes operation
  PinParams.list({required this.pinId, required List<int> this.notesOrder})
    : noteId = null;

  final int pinId;
  final int? noteId;
  final List<int>? notesOrder;
}
