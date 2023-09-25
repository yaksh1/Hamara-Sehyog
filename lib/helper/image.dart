import 'package:hamarasehyog/models/slide_show_image.dart';

List<SlideShowImageModel> getImages() {
  List<SlideShowImageModel> paths =
      List<SlideShowImageModel>.empty(growable: true);

  // function
  void buildPaths(String imagePath) {
    SlideShowImageModel imageModel = SlideShowImageModel(imagePath: imagePath);
    paths.add(imageModel);
  }

  List imgPaths = [
    "assets/images/fd1.jpg",
    "assets/images/p4.jpg",
    "assets/images/tr2.jpg",
    "assets/images/tree2.jpg",
    "assets/images/fd4.jpg"
  ];

  for (int i = 0; i < imgPaths.length; i++) {
    buildPaths(imgPaths[i]);
  }

  return paths;
}
