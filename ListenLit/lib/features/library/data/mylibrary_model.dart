enum BookProgressStatus { inProgress, completed }

class BookProgressModel {
  String bookId;
  double progressPercentage;
  BookProgressStatus get statusType => progressPercentage == 100
      ? BookProgressStatus.completed
      : BookProgressStatus.inProgress;
  BookProgressModel({
    required this.bookId,
    required this.progressPercentage,
  });
}
