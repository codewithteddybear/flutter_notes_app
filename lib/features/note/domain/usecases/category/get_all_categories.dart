import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';

class GetAllCategoriesUsecase implements Usecase<List<CategoryEntity>, void> {
  GetAllCategoriesUsecase({required CategoryRepo repo}) : _repo = repo;

  final CategoryRepo _repo;

  @override
  Future<List<CategoryEntity>> call(_) => _repo.getAllCategories();
}
