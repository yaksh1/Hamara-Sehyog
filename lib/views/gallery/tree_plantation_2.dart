import 'package:flutter/material.dart';
import 'package:hamarasehyog/views/gallery/images_for_galley_container.dart';

class TreePlantation2 extends StatelessWidget {
  const TreePlantation2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImagesForGallery(
              image: "assets/images/tr1.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/tr2.jpg",
            ),
          ],
        ),
      ),
    );
    
  }
}