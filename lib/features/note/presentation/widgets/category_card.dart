import 'package:flutter/material.dart';
import 'package:flutter_notes_app/config/constant/app_icons.dart';
import 'package:flutter_notes_app/config/theme/style_constants.dart';
import 'package:flutter_notes_app/core/extensions/context.dart';
import 'package:flutter_notes_app/features/note/domain/entities/category.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category, required this.onTap});
  final CategoryEntity category;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(StyleConstants.cardBorderRadius);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          color: HexColor(category.color),
          borderRadius: borderRadius,
        ),
        width: StyleConstants.categoryCardSize,
        height: StyleConstants.categoryCardSize,
        padding: const EdgeInsets.symmetric(
          horizontal: StyleConstants.smallSpacing + 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                category.isLocked ? AppIcons.lock : AppIcons.folder,
                size: StyleConstants.categoryCardSize / 1.9,
                color: context.colorScheme.secondary,
              ),
            ),

            Text(
              category.title,
              style: context.textTheme.displayMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${category.notesCount} notes',
              style: context.textTheme.labelMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
