import 'package:flutter/material.dart';
import 'package:hamarasehyog/views/gallery/images_for_galley_container.dart';

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImagesForGallery(
              image: "assets/images/p1.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p2.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p3.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p4.jpg",
            ),ImagesForGallery(
              image: "assets/images/p5.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p6.jpg",
            ),ImagesForGallery(
              image: "assets/images/p7.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p8.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/p9.jpg",
            ),
            
          ],
        ),
      ),
    );
    
  }
}