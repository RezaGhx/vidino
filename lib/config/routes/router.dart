import 'package:competition/config/routes/routes.dart';
import 'package:competition/feature_category/presentation/binding/category_binding.dart';
import 'package:competition/feature_category/presentation/screen/category_screen.dart';
import 'package:competition/feature_chat/presentation/binding/chat_binding.dart';
import 'package:competition/feature_chat/presentation/screen/chat_screen.dart';
import 'package:competition/feature_detail/presentation/binding/detail_binding.dart';
import 'package:competition/feature_detail/presentation/screen/detail_screen.dart';
import 'package:competition/feature_filter/presentation/binding/filter_binding.dart';
import 'package:competition/feature_filter/presentation/screen/filter_screen.dart';
import 'package:competition/feature_home/presentation/binding/home_binding.dart';
import 'package:competition/feature_home/presentation/screen/home_screen.dart';
import 'package:competition/feature_video_player/presentation/binding/video_player_show_binding.dart';
import 'package:competition/feature_video_player/presentation/screen/video_player_show_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../core/middleware/auth_middleware.dart';
import '../../feature_login/presentation/binding/login_binding.dart';
import '../../feature_login/presentation/screen/login_screen.dart';
import '../../feature_splash/presentation/binding/splash_binding.dart';
import '../../feature_splash/presentation/screen/splash_screen.dart';
import '../../feature_verification/presentation/binding/verification_binding.dart';
import '../../feature_verification/presentation/screen/verification_screen.dart';

class MyAppRouter {
  const MyAppRouter._();

  static List<GetPage<dynamic>>? getPages() {
    return [
      GetPage(
        name: Routes.splashPage,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: Routes.loginPage,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        middlewares: [AuthMiddleware()],
      ),
      GetPage(
        name: Routes.verificationPage,
        page: () => const VerificationScreen(),
        binding: VerificationBinding(),
      ),
      GetPage(
        name: Routes.homePage,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: Routes.chatPage,
        page: () => const ChatScreen(),
        binding: ChatBinding(),
      ),
      GetPage(
        name: Routes.categoryPage,
        page: () => const CategoryScreen(),
        binding: CategoryBinding(),
      ),
      GetPage(
        name: Routes.filterPage,
        page: () => const FilterScreen(),
        binding: FilterBinding(),
      ),
      GetPage(
        name: Routes.detailPage,
        page: () => const DetailScreen(),
        binding: DetailBinding(),
      ),
      GetPage(
        name: Routes.videoPlayerPage,
        page: () => const VideoPlayerShowScreen(),
        binding: VideoPlayerShowBinding(),
      ),
    ];
  }
}
