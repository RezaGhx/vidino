import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../config/resoureces/my_color.dart';

class VideoPlayerShowController extends GetxController{
  late VideoPlayerController videoPlayerController1;
  ChewieController? chewieController;
  int? bufferDelay;
  bool isMuted = false,
      downloading = false,
      isDownload = false,
      isCheck = false,
      isFullScreen = false,
      isVisibleLoading = false;
  String? progressString, nameFile, local;
  var nameFolder;
  int _counter = 0;
  EdgeInsetsGeometry? padding;
  String? videoUrl;
  double? size;
  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    isVisibleLoading = true;
    isCheck = false;
    videoUrl = Get.arguments["urlVideo"];
    update();
    _createChewieController(videoUrl!, false);
    super.onInit();
  }


  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    print(videoPlayerController1);
    print(chewieController);
    videoPlayerController1.dispose();
    chewieController!.dispose();
    print("FFFFFFFFFFFFF");
    print(videoPlayerController1);
    print(chewieController);
    update();
  }

  // @override
  // void onClose() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  //   print(videoPlayerController1.value.isInitialized);
  //   print(chewieController);
  //   if (videoPlayerController1.value.isInitialized) {
  //     videoPlayerController1.dispose();
  //   }
  //   if (chewieController != null) {
  //     chewieController!.dispose();
  //   }
  //   super.onClose();
  // }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    print(videoPlayerController1);
    print(chewieController);
    videoPlayerController1.dispose();
    chewieController!.dispose();
    videoUrl=null;
    print("FFFFFFFFFFFFF");
    print(videoPlayerController1);
    print(chewieController);
    update();
    super.dispose();
  }


  void toggleMute() {
    isMuted = !isMuted;
    chewieController!.setVolume(isMuted ? 0 : 1);
    update();
  }


  void _createChewieController(String? path, bool? check) {
    videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(videoUrl!))

      ..addListener(() {
        if (videoPlayerController1.value.position ==
            videoPlayerController1.value.duration) {
          closeVideoPlayer();
        }
        update();
      })
      ..initialize().then((_) {
        update();
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController1,
          aspectRatio: videoPlayerController1.value.aspectRatio,
          autoPlay: true,
          looping: false,
          allowedScreenSleep: false,
          allowMuting: false,
          allowFullScreen: true,
          allowPlaybackSpeedChanging: false,
          showOptions: false,
          isLive: false,
          showControls: true,
          autoInitialize: true,
          fullScreenByDefault: false,
          showControlsOnInitialize: false,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,


          deviceOrientationsOnEnterFullScreen: [
            // DeviceOrientation.portraitUp,
            // DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ],
          materialProgressColors: ChewieProgressColors(
              backgroundColor: MyColor.nearShadeLightFc,
              playedColor: MyColor.primary,
              bufferedColor: MyColor.white,
              handleColor: MyColor.primary),

          deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
          hideControlsTimer: const Duration(seconds: 1),

        );
        isVisibleLoading = false;
        update();
      });
  }

  int currPlayIndex = 0;

  String getFullNumberShow(int? number) {
    return number! > 9 ? number.toString() : "0$number";
  }

  void playVideo() {
    if (chewieController!.isPlaying) {
      chewieController!.pause();
      videoPlayerController1.pause();
    } else {
        chewieController!.play();
        videoPlayerController1.play();

    }
    update();
  }

  void changeSlider(double value) {
    Duration newPosition = Duration(seconds: value.toInt());
    videoPlayerController1.seekTo(newPosition);
    update();
  }

  closeVideoPlayer() {
    Get.back();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    print(videoPlayerController1);
    print(chewieController);
    videoPlayerController1.dispose();
    chewieController!.dispose();
    videoUrl=null;
    print("FFFFFFFFFFFFF");
    print(videoPlayerController1);
    print(chewieController);
    update();

  }
}