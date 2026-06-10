import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';

class DeleteCategoryUsecase implements Usecase<void, int> {
  DeleteCategoryUsecase({required CategoryRepo repo}) : _repo = repo;

  final CategoryRepo _repo;

  @override
  Future<void> call(int categoryId) => _repo.deleteCategory(categoryId);
}
