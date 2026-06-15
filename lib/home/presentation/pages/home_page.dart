import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_notes_app/config/constant/app_icons.dart';
import 'package:flutter_notes_app/config/theme/style_constants.dart';
import 'package:flutter_notes_app/core/constants/constants.dart' as constants;
import 'package:flutter_notes_app/core/extensions/context.dart';
import 'package:flutter_notes_app/core/types/tabs.dart';
import 'package:flutter_notes_app/features/note/presentation/pages/home_category_view.dart';
import 'package:flutter_notes_app/home/presentation/widgets/custom_tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ValueNotifier selectedTab = ValueNotifier<Tabs>(Tabs.allNotes);

  void changeTab(Tabs selected) {
    selectedTab.value = selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes', style: context.textTheme.displayLarge),
        centerTitle: false,
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 80,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(AppIcons.add),
        ),
        children: [
          FloatingActionButton.small(
            tooltip: 'Add folder',
            child: const Icon(AppIcons.folder),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            tooltip: 'Add quick note',
            child: const Icon(AppIcons.quickNote),
            onPressed: () {},
          ),
          FloatingActionButton.small(
            tooltip: 'Add note',
            child: const Icon(AppIcons.note),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeCategoryView()),
            const SliverToBoxAdapter(
              child: SizedBox(height: StyleConstants.largeSpacing),
            ),
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: ValueListenableBuilder(
                valueListenable: selectedTab,
                builder: (_, value, _) {
                  return CustomTabBar(
                    tabs: constants.homeTabs
                        .map(
                          (e) => CustomTabBarItem(
                            label: e.$1,
                            tab: e.$2,
                            isSelected: value == e.$2,
                          ),
                        )
                        .toList(),
                    onChanged: changeTab,
                  );
                },
              ),
            ),
            SliverFillRemaining(),
          ],
        ),
      ),
    );
  }
}
