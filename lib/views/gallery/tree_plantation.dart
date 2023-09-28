import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/gallery/images_for_galley_container.dart';

class TreePlantation extends StatelessWidget {
  const TreePlantation({super.key});

  get width10 => Dimensions.width10;

  get radius10 => Dimensions.radius10;

  get height10 => Dimensions.height10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ImagesForGallery(
              image: "assets/images/tree1.jpg",
            ),
            ImagesForGallery(
              image: "assets/images/tree2.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
