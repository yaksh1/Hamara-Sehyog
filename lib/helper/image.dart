import 'package:hamarasehyog/models/slide_show_image.dart';

List<SlideShowImageModel> getImages() {
  List<SlideShowImageModel> paths =
      List<SlideShowImageModel>.empty(growable: true);

  // function
  void buildPaths(String imagePath,String eventName,String eventDate) {
    SlideShowImageModel imageModel = SlideShowImageModel(imagePath: imagePath, eventName: eventName, eventDate: eventDate,);
    paths.add(imageModel);
  }

  List imgPaths = [
    ["assets/images/tr2.jpg", "Tree Plantation", "3rd August 2023"],
    ["assets/images/tree2.jpg", "Tree Plantation Drive", "30th July 2023"],
    ["assets/images/fd1.jpg", "Food Distribution", "5th February 2023"],
    ["assets/images/fd4.jpg" ,"Food Distribution", "5th February 2023"],
    ["assets/images/p4.jpg", "Presentation for children", "6th December 2022"],
  ];

  for (int i = 0; i < imgPaths.length; i++) {
    buildPaths(imgPaths[i][0],imgPaths[i][1],imgPaths[i][2]);
  }

  return paths;
}
