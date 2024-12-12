import 'package:chewie/chewie.dart';
import 'package:competition/feature_video_player/presentation/controller/video_player_show_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerShowScreen extends GetView<VideoPlayerShowController> {
  const VideoPlayerShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.chewieController != null && controller.chewieController!.videoPlayerController.value.isInitialized
          ? Chewie(
        controller: controller.chewieController!,
      )
          : const CircularProgressIndicator(),
      // Container(
      //     margin: const EdgeInsets.only(bottom: 20),
      //     width: Get.width,
      //     height: controller.chewieController != null &&
      //         controller.chewieController!.videoPlayerController.value
      //             .isInitialized &&
      //         controller.isVisibleLoading == false
      //         ? Get.height
      //         : Get.height,
      //     decoration: BoxDecoration(
      //         color: controller.chewieController != null &&
      //             controller.chewieController!.videoPlayerController
      //                 .value.isInitialized &&
      //             controller.isVisibleLoading == false
      //             ? MyColor.black
      //             : MyColor.shadeLight50,
      //         // border: Border.all(width: 2, color: ColorsApp.defaultBlue),
      //         borderRadius: BorderRadius.circular(0)),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         controller.chewieController != null &&
      //             controller.chewieController!.videoPlayerController
      //                 .value.isInitialized
      //             ? ClipRRect(
      //           borderRadius: BorderRadius.circular(0),
      //           child: AspectRatio(
      //             aspectRatio: 9 / 16,
      //             child: Stack(
      //               children: [
      //                 Chewie(
      //                   controller: controller.chewieController!,
      //                 ),
      //                 Visibility(
      //                   visible:
      //                   controller.chewieController!.isPlaying
      //                       ? false
      //                       : true,
      //                   child: GestureDetector(
      //                     onTap: controller.playVideo,
      //                     child: Align(
      //                       alignment: Alignment.center,
      //                       child: Container(
      //                         decoration: const BoxDecoration(
      //                             color: MyColor.white,
      //                             shape: BoxShape.circle),
      //                         child: const Icon(
      //                           Icons.play_arrow,
      //                           size: 70,
      //                           color: MyColor.black,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         )
      //             : controller.videoUrl!.isEmpty ||
      //             controller.videoUrl.toString() == "null"
      //             ? SizedBox(
      //           height: 200 - 50,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Image.asset("assets/new/non_categorized.png"),
      //               const Text('فیلم برای نمایش وجود ندارد'),
      //             ],
      //           ),
      //         )
      //             : SizedBox(
      //           height: 200 - 50,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               MyLoading(),
      //               const SizedBox(height: 20),
      //               const Text('در حال پردازش'),
      //             ],
      //           ),
      //         ),
      //       ],
      //     )),
    );
  }
}
