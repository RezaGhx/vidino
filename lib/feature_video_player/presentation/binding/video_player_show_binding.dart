import 'package:competition/feature_video_player/presentation/controller/video_player_show_controller.dart';
import 'package:get/get.dart';

class VideoPlayerShowBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<VideoPlayerShowController>(VideoPlayerShowController());
  }
}