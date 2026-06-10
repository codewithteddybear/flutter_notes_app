import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/data/data_sources/local/category_dao.dart';
import 'package:flutter_notes_app/features/note/data/data_sources/local/pinned_dao.dart';
import 'package:flutter_notes_app/features/note/data/models/note_table.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  const CategoryRepoImpl({
    required CategoryDao categoryDao,
    required PinnedDao pinnedDao,
  }) : _categoryDao = categoryDao,
       _pinnedDao = pinnedDao;

  final CategoryDao _categoryDao;
  final PinnedDao _pinnedDao;

  @override
  Future<dynamic> addNewCategory(CategoryEntity category) =>
      _categoryDao.addNewCategory(CategoryTable.fromEntity(category));

  @override
  Future<dynamic> updateCategory(CategoryEntity category) =>
      _categoryDao.updateCategory(CategoryTable.fromEntity(category));

  @override
  Future<dynamic> deleteCategory(int categoryId) async {
    // delete pin
    await _pinnedDao.deletePin(categoryId);
    await _categoryDao.deleteCategory(categoryId);
  }

  // GET DATA
  @override
  FutureListOf<CategoryEntity> getAllCategories() async =>
      (await _categoryDao.getAllCategories())
          .map((e) => e.$1.toEntity()..notesCount = e.$2)
          .toList();
}
