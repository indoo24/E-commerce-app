import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_mananger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidget extends StatelessWidget {
  final List<String> adsImages = [
    ImageAssets.adsImage1,
    ImageAssets.adsImage2,
    ImageAssets.adsImage3
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorBackgroundColor: ColorManager.white,
      indicatorColor: ColorManager.primary,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: adsImages
          .map((url) => Image.asset(
                url,
                fit: BoxFit.fill,
                width: 210.w,
                height: 210.h,
              ))
          .toList(),
    );
  }
}
