import 'package:flutter_notes_app/core/types/add_category_params.dart';
import 'package:flutter_notes_app/core/usecases/usecase.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:flutter_notes_app/features/note/domain/repository/category_repo.dart';

class AddNewCategoryUsecase implements Usecase<void, AddCategoryParams> {
  AddNewCategoryUsecase({required CategoryRepo repo}) : _repo = repo;

  final CategoryRepo _repo;

  @override
  Future<void> call(AddCategoryParams params) => _repo.addNewCategory(
    CategoryEntity(
      // will not be used
      // id generation is automatically handled by DB
      id: 0,
      title: params.title,
      color: params.color,
      // always false at creation
      isLocked: false,
      // always false
      isAppLockedCategory: false,
    ),
  );
}
