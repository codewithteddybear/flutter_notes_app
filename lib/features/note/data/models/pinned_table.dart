import 'package:isar_community/isar.dart';

part 'pinned_table.g.dart';

// [PinnedTable] objects are called 'pin' in the code
// each 'pin' represents a category or custom page
// the id of each 'pin' is equal to its associated category or custom page
// this allows custom pinned orders that differs from each category or page to another
@Collection(accessor: "pinned")
class PinnedTable {
  PinnedTable({required this.id, required this.notes});

  final Id id;
  // only contains notes id
  @Index(type: IndexType.value)
  List<int> notes;
}
