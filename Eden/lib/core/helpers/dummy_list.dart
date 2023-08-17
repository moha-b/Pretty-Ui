import '../../features/activity/data/activity_model.dart';
import '../utils/app_assets.dart';

List<String> reviews = [
  AppAssets.kAngry,
  AppAssets.kFrown,
  AppAssets.kNeutral,
  AppAssets.kSmile,
  AppAssets.kHappy,
];

List<String> userImages = [
  ...todayActivities.map((activity) => activity.userImage),
  ...recentWeek.map((activity) => activity.userImage),
];
