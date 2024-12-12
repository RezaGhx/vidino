import 'package:cached_network_image/cached_network_image.dart';
import 'package:competition/config/theme/my_theme.dart';
import 'package:competition/core/widgets/shimmer/my_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    this.url,
    this.placeHolder,
    this.errorWidget,
    this.imageAssets,
    this.width,
    this.height,
  });

  final String? url;
  final String? imageAssets;
  final Widget? placeHolder;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url ?? '',
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
          ),
        );
      },
      placeholder: (context, url) => MyShimmer(
        child: placeHolder ??
            Container(
              color: context.theme.neaDarkFc,
            ),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/error.png',
              fit: BoxFit.cover,
            ),
          ),
      fit: BoxFit.fill,
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 300),
      placeholderFadeInDuration: const Duration(milliseconds: 300),
    );
  }
}
