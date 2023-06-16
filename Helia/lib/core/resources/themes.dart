// ThemeData lightTheme = ThemeData(
//   brightness: Brightness.light,
//   scaffoldBackgroundColor: AppColors.background,
//   colorScheme: const ColorScheme.light(
//     primary: AppColors.primary,
//     secondary: AppColors.secondary,
//     tertiary: AppColors.primary,
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
//     bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
//     bodySmall: TextStyle(color: Colors.grey),
//   ),
//   useMaterial3: true,
//   // Define other light theme properties
// );
//
// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//     primary: AppColors.primary,
//     secondary: AppColors.secondary,
//     tertiary: Colors.white,
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(),
//     bodyMedium: TextStyle(),
//     bodySmall: TextStyle(color: Colors.grey),
//   ),
//   useMaterial3: true,
//   // Define other dark theme properties
// );
//
// class AppThemes extends ChangeNotifier {
//   ThemeMode _mode = ThemeMode.light;
//   get themeMode => _mode;
//
//   void switchTheme(bool isDark) {
//     _mode = isDark ? ThemeMode.dark : ThemeMode.light;
//     notifyListeners();
//   }
// }
