import 'package:flutter_notes_app/features/note/data/data_sources/local/category_dao.dart';
import 'package:flutter_notes_app/features/note/data/data_sources/local/note_dao.dart';
import 'package:flutter_notes_app/features/note/data/data_sources/local/pinned_dao.dart';
import 'package:flutter_notes_app/features/note/data/models/note_table.dart';
import 'package:flutter_notes_app/features/note/data/models/pinned_table.dart';
import 'package:flutter_notes_app/features/note/data/repository/category_repo_impl.dart';
import 'package:flutter_notes_app/features/note/data/repository/note_repo_impl.dart';
import 'package:flutter_notes_app/features/note/data/repository/pinned_repo_impl.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';
import 'package:flutter_notes_app/features/note/domain/repository/note_repo.dart';
import 'package:flutter_notes_app/features/note/domain/repository/pinned_repo.dart';
import 'package:flutter_notes_app/features/note/domain/usecases/category/category_usecases.dart';
import 'package:flutter_notes_app/features/note/domain/usecases/note/note_usecases.dart';
import 'package:flutter_notes_app/features/note/domain/usecases/pin/pin_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar_community/isar.dart';

final sl = GetIt.instance;

Future initializeDependencies() async {
  // DB path
  final dbPath = await getApplicationDocumentsDirectory();

  // DB
  sl.registerSingleton<Isar>(
    await Isar.open([
      CategoryTableSchema,
      NoteTableSchema,
      PinnedTableSchema,
    ], directory: dbPath.path),
  );

  //* NOTE

  // DB DAOs
  sl.registerLazySingleton<CategoryDao>(() => CategoryDao(db: sl()));
  sl.registerLazySingleton<NoteDao>(() => NoteDao(db: sl()));
  sl.registerLazySingleton<PinnedDao>(() => PinnedDao(db: sl()));

  // REPOSITORIES
  sl.registerLazySingleton<CategoryRepo>(
    () => CategoryRepoImpl(categoryDao: sl(), pinnedDao: sl()),
  );
  sl.registerLazySingleton<NoteRepo>(
    () => NoteRepoImpl(noteDao: sl(), pinnedDao: sl()),
  );
  sl.registerLazySingleton<PinnedRepo>(() => PinnedRepoImpl(pinnedDao: sl()));

  // USECASES

  // CATEGORY
  sl.registerLazySingleton<AddNewCategoryUsecase>(
    () => AddNewCategoryUsecase(repo: sl()),
  );
  sl.registerLazySingleton<DeleteCategoryUsecase>(
    () => DeleteCategoryUsecase(repo: sl()),
  );
  sl.registerLazySingleton<GetAllCategoriesUsecase>(
    () => GetAllCategoriesUsecase(repo: sl()),
  );
  sl.registerLazySingleton<UpdateCategoryUsecase>(
    () => UpdateCategoryUsecase(repo: sl()),
  );

  // NOTE
  sl.registerLazySingleton<AddNewNoteUsecase>(
    () => AddNewNoteUsecase(repo: sl()),
  );
  sl.registerLazySingleton<DeleteNoteUsecase>(
    () => DeleteNoteUsecase(repo: sl()),
  );
  sl.registerLazySingleton<GetAllNotesUsecase>(
    () => GetAllNotesUsecase(repo: sl()),
  );
  sl.registerLazySingleton<GetFavoriteNotesUsecase>(
    () => GetFavoriteNotesUsecase(repo: sl()),
  );
  sl.registerLazySingleton<GetNotesByCategoryUsecase>(
    () => GetNotesByCategoryUsecase(repo: sl()),
  );
  sl.registerLazySingleton<UpdateNoteUsecase>(
    () => UpdateNoteUsecase(repo: sl()),
  );

  // PIN
  sl.registerLazySingleton<PinNoteUsecase>(() => PinNoteUsecase(repo: sl()));
  sl.registerLazySingleton<ReorderPinNotesUsecase>(
    () => ReorderPinNotesUsecase(repo: sl()),
  );
  sl.registerLazySingleton<UnpinNoteUsecase>(
    () => UnpinNoteUsecase(repo: sl()),
  );
}
