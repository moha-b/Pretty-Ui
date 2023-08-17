import 'package:get/get.dart';

import 'features/course_detail/data/course_model.dart';

class SavedController extends GetxController {
  List<Course>? get saveCourses => _savedCourses.value;
  final Rx<List<Course>?> _savedCourses = Rx<List<Course>?>([]);

  void addToSaved(Course course) {
    if (saveCourses != null) {
      if (!isSavedCourse(course)) {
        _savedCourses.value!.add(course);
        _savedCourses.refresh();
      }
    } else {
      _savedCourses
        ..value = [course]
        ..refresh();
    }
  }

  void removeFromSaved(Course course) {
    if (saveCourses != null) {
      if (isSavedCourse(course)) {
        _savedCourses.value!.remove(course);
        _savedCourses.refresh();
      }
    }
  }

  bool isSavedCourse(Course course) {
    return saveCourses!.any((p) => p.id == course.id);
  }
}
