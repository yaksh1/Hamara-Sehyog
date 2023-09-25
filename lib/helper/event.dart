import 'package:hamarasehyog/models/slide_show_event.dart';

List<SlideShowEvent> getEvents() {
  List<SlideShowEvent> events = List<SlideShowEvent>.empty(growable: true);

  void buildEvents(String eventName, String eventDate) {
    SlideShowEvent eventModel =
        SlideShowEvent(eventDate: eventDate, eventName: eventName);
    events.add(eventModel);
  }

  List eventsObj = [
    ["Food Distribution", "5th February 2023"],
    ["Presentation for children", "6th December 2022"],
    ["Tree Plantation", "3rd August 2023"],
    ["Tree Plantation Drive", "30th July 2023"],
    ["Food Distribution", "5th February 2023"],
  ];

  for (int i = 0; i < eventsObj.length; i++) {
    buildEvents(eventsObj[i][0], eventsObj[i][1]);
  }
  return events;
}
