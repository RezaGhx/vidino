import 'package:chewie/chewie.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/widgets/loading/my_loading.dart';
import 'package:competition/feature_video_player/presentation/controller/video_player_show_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerShowScreen extends GetView<VideoPlayerShowController> {
  const VideoPlayerShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerShowController>(
      builder: (_) {
        return SafeArea(
          child: Form(
            // canPop: false,
            // onPopInvokedWithResult: (bool didPop, Object? result) {
            //   if (didPop) {
            //     return;
            //   }
            //   controller.closeVideoPlayer();
            // },
            child: Scaffold(
              body: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: Get.width,
                  height: controller.chewieController != null &&
                      controller.chewieController!.videoPlayerController.value
                          .isInitialized &&
                      controller.isVisibleLoading == false
                      ? Get.height
                      : Get.height,
                  decoration: BoxDecoration(
                      color: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized &&
                          controller.isVisibleLoading == false
                          ? MyColor.slightlyDarker
                          : MyColor.nearShadeDark,
                      // border: Border.all(width: 2, color: ColorsApp.defaultBlue),
                      borderRadius: BorderRadius.circular(0)),
                  child: controller.chewieController != null &&
                      controller.chewieController!.videoPlayerController
                          .value.isInitialized
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: AspectRatio(
                      aspectRatio: controller.chewieController!.aspectRatio!,
                      child: Chewie(
                        controller: controller.chewieController!,
                      ),
                    ),
                  )
                      : controller.videoUrl!.isEmpty ||
                      controller.videoUrl.toString() == "null"
                      ? SizedBox(
                    height: 200 - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/new/non_categorized.png"),
                        const Text('فیلم برای نمایش وجود ندارد'),
                      ],
                    ),
                  )
                      : const SizedBox(
                    height: 200 - 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyLoading(),
                        SizedBox(height: 20),
                        Text('در حال پردازش'),
                      ],
                    ),
                  )),
            ),
          ),
        );
      }
    );
  }
}
