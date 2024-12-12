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
    isVisibleLoading = true;
    isCheck = false;
    videoUrl = Get.parameters["urlVideo"];
    update();
    videoPlayerController1 = VideoPlayerController.network(videoUrl!)
      ..initialize().then((_) {
        update();
      });

    // کنترلر برای Chewie
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController1,
      autoPlay: true,
    );
    super.onInit();
  }



  @override
  void dispose() {
    videoPlayerController1.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  //
  // @override
  // void dispose() {
  //   videoPlayerController1.dispose();
  //   chewieController!.dispose();
  //   update();
  //   super.dispose();
  // }
  //
  //
  // void toggleMute() {
  //   isMuted = !isMuted;
  //   chewieController!.setVolume(isMuted ? 0 : 1);
  //   update();
  // }
  //
  //
  // void _createChewieController(String? path, bool? check) {
  //   videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'))
  //
  //     ..addListener(() {
  //       if (videoPlayerController1.value.position ==
  //           videoPlayerController1.value.duration) {
  //         // closeVideoPlayer();
  //       }
  //       update();
  //     })
  //     ..initialize().then((_) {
  //       chewieController = ChewieController(
  //         videoPlayerController: videoPlayerController1,
  //         aspectRatio: 9 / 16,
  //         autoPlay: true,
  //         looping: false,
  //         allowedScreenSleep: false,
  //         allowMuting: false,
  //         allowFullScreen: false,
  //         allowPlaybackSpeedChanging: false,
  //         showOptions: false,
  //         isLive: false,
  //         showControls: false,
  //         autoInitialize: true,
  //         fullScreenByDefault: false,
  //         showControlsOnInitialize: false,
  //         errorBuilder: (context, errorMessage) {
  //           return Center(
  //             child: Text(
  //               errorMessage,
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           );
  //         },
  //         progressIndicatorDelay:
  //         bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
  //
  //         subtitleBuilder: (context, dynamic subtitle) => Container(
  //           padding: const EdgeInsets.all(10.0),
  //           child: subtitle is InlineSpan
  //               ? RichText(
  //             text: subtitle,
  //           )
  //               : Text(
  //             subtitle.toString(),
  //             style: const TextStyle(color: Colors.black),
  //           ),
  //         ),
  //         deviceOrientationsOnEnterFullScreen: [
  //           DeviceOrientation.portraitUp,
  //           DeviceOrientation.portraitDown,
  //           // DeviceOrientation.landscapeLeft,
  //           // DeviceOrientation.landscapeRight
  //         ],
  //         materialProgressColors: ChewieProgressColors(
  //             backgroundColor: MyColor.nearShadeLightFc,
  //             playedColor: MyColor.primary,
  //             bufferedColor: MyColor.white,
  //             handleColor: MyColor.primary),
  //
  //         deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
  //         hideControlsTimer: const Duration(seconds: 1),
  //
  //       );
  //       isVisibleLoading = false;
  //       update();
  //     });
  // }
  //
  // int currPlayIndex = 0;
  //
  // String getFullNumberShow(int? number) {
  //   return number! > 9 ? number.toString() : "0$number";
  // }
  //
  // void playVideo() {
  //   if (chewieController!.isPlaying) {
  //     chewieController!.pause();
  //     videoPlayerController1.pause();
  //   } else {
  //       chewieController!.play();
  //       videoPlayerController1.play();
  //
  //   }
  //   update();
  // }
  //
  // void changeSlider(double value) {
  //   Duration newPosition = Duration(seconds: value.toInt());
  //   videoPlayerController1.seekTo(newPosition);
  //   update();
  // }
  //
  // closeVideoPlayer() {
  //   videoPlayerController1.dispose();
  //   chewieController!.dispose();
  //   update();
  //   Get.back();
  // }
}