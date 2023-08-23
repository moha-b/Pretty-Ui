import 'package:listenlit/core/utils/icons_path.dart';

class ChipModel {
  String text;
  String icons;
  ChipModel({
    required this.text,
    required this.icons,
  });
}

List<ChipModel> chipList = [
  ChipModel(
    text: 'Trending',
    icons: AppIcons.kUilFire,
  ),
  ChipModel(
    text: '5-Minutes Read',
    icons: AppIcons.kBookmarkIcon,
  ),
  ChipModel(
    text: 'Quick Listen',
    icons: AppIcons.kmusicIcon,
  )
];
List<ChipModel> myLibraryChipList = [
  ChipModel(
    text: 'Saved Books',
    icons: AppIcons.kUilBookmark,
  ),
  ChipModel(
    text: 'In Progress',
    icons: AppIcons.kmusicIcon,
  ),
  ChipModel(
    text: 'Completed',
    icons: AppIcons.kChecked,
  )
];
