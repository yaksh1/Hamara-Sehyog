import 'package:flutter/material.dart';
import 'package:hamarasehyog/views/gallery/images_for_galley_container.dart';

class FoodDistribution1 extends StatelessWidget {
  const FoodDistribution1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ImagesForGallery( image: "assets/images/fd1.jpg"),
            ImagesForGallery(image: "assets/images/fd2.jpg"),
            ImagesForGallery(image: "assets/images/fd3.jpg"),
            ImagesForGallery(image: "assets/images/fd4.jpg"),
            ImagesForGallery(image: "assets/images/fd5.jpg"),
            ImagesForGallery(image: "assets/images/fd6.jpg"),
            ImagesForGallery(image: "assets/images/fd7.jpg"),

          ],
        ),
      ),
    );
  }
}