import '../../../core/helpers/enums/activity_type.dart';
import '../../../core/utils/app_assets.dart';

class Activity {
  String id;
  String userImage;
  String userName;
  String activityInfo;
  ActivityType type;
  Activity({
    required this.id,
    required this.activityInfo,
    required this.userImage,
    required this.userName,
    required this.type,
  });
}

List<Activity> todayActivities = [
  Activity(
    id: '1',
    activityInfo: '2m •  Left a review',
    type: ActivityType.review,
    userImage: AppAssets.kUser1,
    userName: 'Hugo Saavedra',
  ),
  Activity(
    id: '2',
    activityInfo: '2m • Bought your course',
    type: ActivityType.other,
    userImage: AppAssets.kUser2,
    userName: 'Qin Shi',
  ),
  Activity(
    id: '3',
    activityInfo: '19m • Posted a project',
    userImage: AppAssets.kUser3,
    type: ActivityType.other,
    userName: 'Harinder Mondi',
  ),
];

List<Activity> recentWeek = [
  Activity(
    id: '4',
    userImage: AppAssets.kUser4,
    activityInfo: '2d • Bought your course',
    userName: 'Lilah Ioselev',
    type: ActivityType.other,
  ),
  Activity(
    id: '5',
    userImage: AppAssets.kUser5,
    activityInfo: '3d • Posted a project',
    userName: 'Ya Chin-Ho',
    type: ActivityType.other,
  ),
  Activity(
    id: '6',
    userImage: AppAssets.kUser6,
    activityInfo: '4d • Posted a project',
    userName: 'Nicolina Lindholm',
    type: ActivityType.other,
  ),
  Activity(
    id: '7',
    userImage: AppAssets.kUser7,
    activityInfo: '5d • Left a review',
    userName: 'Martín Abasto',
    type: ActivityType.review,
  ),
];
