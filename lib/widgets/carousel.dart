import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageCarouselSlider extends StatelessWidget {
  final List<dynamic> images;

  ImageCarouselSlider(this.images);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.star_border,
            color: Colors.white,
          ),
          onPressed: () {
            ;
          },
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 200.0,
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
        flexibleSpace: Container(
          height: 300.0,
          child: Carousel(
            boxFit: BoxFit.fill,
            images: images
                .map((imgUrl) => NetworkImage(imgUrl.toString()))
                .toList(),
            autoplay: false,
            dotColor: Colors.grey,
            dotPosition: DotPosition.bottomLeft,
            dotSpacing: 15,
            dotBgColor: Colors.black12.withAlpha(0),
            dotSize: 6.0,
            showIndicator: true,
            overlayShadow: true,
          ),
        ));
  }
}
