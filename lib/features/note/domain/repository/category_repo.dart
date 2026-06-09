import 'package:flutter_notes_app/core/types/type_aliases.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';

abstract interface class CategoryRepo {
  Future addNewCategory(CategoryEntity category);
  Future updateCategory(CategoryEntity category);
  Future deleteCategory(int categoryId);

  // GET DATA
  FutureListOf<CategoryEntity> getAllCategories();
}
