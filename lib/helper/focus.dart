import 'package:flutter/foundation.dart';
import 'package:hamarasehyog/models/focus_area_model.dart';

List<FocusAreaModel> getAreas() {
  List<FocusAreaModel> areas = List<FocusAreaModel>.empty(growable: true);

  String health =
      "We organize medical camps providing generic medicines, multi-vitamins, ORS, and paracetamol along with a MD doctor consultancy was provided during the pandemic period to the needy. We aim to eradicate health-related issues of the needy people.";
  String edu =
      "Under children’s education notebooks, bags, stationery, colours are distributed to school going kids. Few candidates full term school fees are donated by our members and education of girl children is supported.";
  String meals =
      "Hamara Sehyog provides fresh meals to basti people free of cost on every Saturdays. Rations worth Rs 500 were distributed to many families during Pandemic.";
  String wage =
      "Hamara Sehyog donated generously ration to many needy and also supported in establishes small employments like establishing thelas for vegetable selling, giving contract to painters, tailors and carpenters and cooks.";
  "We organize medical camps providing generic medicines, multi-vitamins, ORS, and paracetamol along with a MD doctor consultancy was provided during the pandemic period to the needy. We aim to eradicate health-related issues of the needy people.";
  String tree =
      "Being environment-friendly, inspections were done in and around Pune to understand the need of plantation in barren lands and thus Hamara Sehyog became successful in adding oxygen to the environment by planting saplings and trees.";

  List details = [
    ["assets/images/area1.jpg", "Public Health", health],
    ["assets/images/area2.jpg", "Children Education", edu],
    ["assets/images/area3.jpg", "Employment Security", wage],
    ["assets/images/fd5.jpg", "Meals and Ration", meals],
    ["assets/images/tree1.jpg", "Tree Plantation", tree],
  ];

  for (int i = 0; i < details.length; i++) {
    FocusAreaModel model = FocusAreaModel(
        image: details[i][0], desc: details[i][2], title: details[i][1]);
    areas.add(model);
  }

  return areas;
}
