import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:listenlit/features/library/data/book_model.dart';
import 'package:listenlit/features/profile/data/usermodel.dart';

import '../../library/data/chapter_model.dart';

class AudioController extends GetxController {
  final BookModel book;
  int currentChapterIndex;
  AudioController({required this.book, required this.currentChapterIndex});

  bool isPlaying = false;
  AudioPlayer? player;

  double sliderValue = 0.0;
  Duration duration = const Duration();
  Duration position = const Duration();
  List get chapters => book.chaptersList;
  ChaptersModel get currentChapterPlaying => chapters[currentChapterIndex];
  bool loading = true;
  ChaptersModel? get nextChapter {
    try {
      return chapters[currentChapterIndex + 1];
    } catch (e) {
      return null;
    }
  }

  ChaptersModel? get previousChapter {
    try {
      return chapters[currentChapterIndex - 1];
    } catch (e) {
      return null;
    }
  }

  @override
  void onInit() {
    player = AudioPlayer();
    super.onInit();
    initPlayer();
  }

  Future initPlayer() async {
    await player!.play(AssetSource(currentChapterPlaying.audio));
    isPlaying = true;
    duration = await player!.getDuration() ?? 1.seconds;
    player!.onDurationChanged.listen((Duration d) {
      duration = d;
      update();
      if (kDebugMode) {
        print('onDurationChanged ${duration.inSeconds}');
      }
    });

    player!.onPositionChanged.listen((Duration d) {
      position = d;
      update();

      if (kDebugMode) {
        print('onPositionChanged ${position.inSeconds}');
      }
    });
    player!.onPlayerComplete.listen((_) {
      position = duration;
      update();

      if (kDebugMode) {
        print('onPlayerComplete ${position.inSeconds}');
      }
    });

    loading = false;
    update();
  }

  @override
  void onClose() {
    player!.dispose();

    super.onClose();
  }

  void playPause() async {
    if (isPlaying) {
      await player!.pause();
      isPlaying = false;
      update();
    } else {
      await player!.play(AssetSource(currentChapterPlaying.audio));
      isPlaying = true;
      update();
    }
  }

  Future playNext() async {
    if (nextChapter == null) {
      Get.defaultDialog(title: "No more chapters");

      return;
    }
    if (nextChapter!.isPremium && currentUser.isPremium) {
      currentChapterIndex++; // Increment the current audio index
      update();
      if (currentChapterIndex >= chapters.length) {
        currentChapterIndex =
            0; // Reset back to 0 if it exceeds the list length
        update();
      }
    }

    await player!.stop(); // Stop the current audio

    update();
    await playChapter(currentChapterPlaying);
    update();
  }

  Future<void> onSliderValueChanged(double offset) async {
    await player!.seek((offset * duration.inSeconds.toDouble()).seconds);
    update();
  }

  Future<void> playChapter(ChaptersModel chapter) async {
    if (chapter.isPremium && !currentUser.isPremium) {
      Get.defaultDialog(title: "Subscribe to Premium");
    } else {
      player!.play(AssetSource(chapter.audio)); // Play the next audio
      isPlaying = true;
      update();
    }
    return;
  }

  Future playBack() async {
    if (previousChapter == null) {
      Get.defaultDialog(title: "You are at start of book");

      return;
    }
    if (currentChapterPlaying.isPremium && currentUser.isPremium) {
      currentChapterIndex--;
      update(); // Decrement the current audio index
      if (currentChapterIndex < 0) {
        currentChapterIndex = chapters.length -
            1; // Set it to the last index if it becomes negative
        update();
      }
    }

    await player!.stop(); // Stop the current audio
    update();

    await playChapter(currentChapterPlaying);

    update();
  }
}
