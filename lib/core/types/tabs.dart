import 'package:flutter_notes_app/core/constants/constants.dart' as constants;

enum Tabs {
  allNotes(constants.allNotesPageId),
  favoriteNotes(constants.favoriteNotesPageId),
  quickNotes(0);

  final int pageId;
  const Tabs(this.pageId);
}
