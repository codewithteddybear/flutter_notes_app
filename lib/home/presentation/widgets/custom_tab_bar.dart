import 'package:flutter/material.dart';
import 'package:flutter_notes_app/config/theme/theme.dart';
import 'package:flutter_notes_app/core/extensions/context.dart';
import 'package:flutter_notes_app/core/extensions/text_style.dart';
import 'package:flutter_notes_app/core/types/tabs.dart';

class CustomTabBarItem {
  CustomTabBarItem({
    required this.label,
    required this.tab,
    required this.isSelected,
  });

  final String label;
  final Tabs tab;
  final bool isSelected;
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.onChanged,
    this.height = StyleConstants.tabBarHeight,
  });

  final List<CustomTabBarItem> tabs;
  final double height;
  final void Function(Tabs) onChanged;

  @override
  Widget build(BuildContext context) {
    final tabsTextStyle = context.textTheme.displayMedium!;
    final borderRadius = BorderRadius.circular(
      StyleConstants.defaultBorderRadius,
    );

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: borderRadius,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, _) =>
            const SizedBox(width: StyleConstants.defaultSpacing),
        itemBuilder: (context, index) {
          final tab = tabs[index];
          return GestureDetector(
            onTap: () => onChanged(tab.tab),
            child: AnimatedContainer(
              duration: StyleConstants.animationDuration,
              decoration: BoxDecoration(
                color: tab.isSelected ? context.colorScheme.secondary : null,
                borderRadius: borderRadius,
              ),

              padding: const EdgeInsets.symmetric(
                horizontal: StyleConstants.defaultSpacing,
              ),
              child: Center(
                child: Text(
                  tab.label,
                  style: tab.isSelected
                      ? tabsTextStyle.medium().foregroundColor(Colors.black)
                      : tabsTextStyle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
