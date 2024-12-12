import 'package:carousel_slider/carousel_slider.dart';
import 'package:competition/config/resoureces/my_color.dart';
import 'package:competition/core/widgets/containers/my_container_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
itemBannerSlider({String? banner, bool isVisible=true}) {
  return MyContainerPublic(
    backgroundColor: MyColor.transparent,
    onTap: (){

    },
    child: CarouselSlider.builder(
      itemBuilder: (context, index, realIdx) {
        return MyContainerPublic(
          backgroundColor: MyColor.transparent,
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child:
            OctoImage(
              image: functionSpecifectImageCheck(
                  isVisible,
                  NetworkImage('https://images.rawpixel.com/image_social_landscape/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0zMDktYWV3LTAxM18xXzEuanBn.jpg'),
                  AssetImage('assets/image/image.png')),
              placeholderBuilder: (context) {
                return BlurHash(
                  hash: '',
                );
              },
              errorBuilder: OctoError.icon(color: Colors.red),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 350,
            ),
          ),
        );
      },
      itemCount: 1,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    ),
  );
}

functionSpecifectImageCheck(isVisible, image1, image2) {
  if (isVisible) {
    return image1;
  } else {
    return image2;
  }
}
