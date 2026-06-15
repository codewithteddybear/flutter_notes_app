import 'package:flutter/material.dart';
import 'package:flutter_notes_app/config/theme/style_constants.dart';
import 'package:flutter_notes_app/core/extensions/context.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:flutter_notes_app/features/note/presentation/widgets/category_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeCategoryView extends ConsumerWidget {
  const HomeCategoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //! TEMP: mock data
    final category = CategoryEntity(
      id: 0,
      title: 'archive of my favorite books',
      color: '#4B4E53',
      isLocked: false,
      isAppLockedCategory: false,
    )..notesCount = 50;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleConstants.largeSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: StyleConstants.defaultSpacing,
        children: [
          Text('Categories', style: context.textTheme.headlineMedium),
          SizedBox(
            height: StyleConstants.categoryCardSize,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) {
                return CategoryCard(category: category, onTap: () {});
              },
              separatorBuilder: (_, _) =>
                  const SizedBox(width: StyleConstants.defaultSpacing),
            ),
          ),
        ],
      ),
    );
  }
}
