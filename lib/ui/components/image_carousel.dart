import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease_detection/index.dart';

class ImageCarousel extends StatefulWidget {
  final double? height;

  const ImageCarousel({
    super.key,
    this.height,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Assets.updatesImage1,
        Assets.updatesImage2,
        Assets.updatesImage3,
        Assets.updatesImage4,
        Assets.updatesImage5,
        Assets.updatesImage6,
        Assets.updatesImage7,
        Assets.updatesImage8,
        Assets.updatesImage9,
        Assets.updatesImage10,
      ]
          .map(
            (imgPath) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imgPath),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1.2,
        enableInfiniteScroll: true,
        height: widget.height,
      ),
    );
  }
}
