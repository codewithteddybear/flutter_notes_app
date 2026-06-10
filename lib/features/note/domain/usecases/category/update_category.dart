import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';

class UpdateCategoryUsecase implements Usecase<void, CategoryEntity> {
  UpdateCategoryUsecase({required CategoryRepo repo}) : _repo = repo;

  final CategoryRepo _repo;

  @override
  Future<void> call(CategoryEntity category) => _repo.updateCategory(category);
}
