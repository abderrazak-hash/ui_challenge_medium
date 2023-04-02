import 'package:ui_hard/models/event.dart';

class EventsRepo {
  static List<Event> events = [
    Event(name: 'DevFest22', isCompleted: true),
    Event(name: 'Flutter Forward Extended', isCompleted: false),
  ];

  static List<Event> bootcamps = [
    Event(name: 'WebIT Bootcamp', isCompleted: true),
  ];

  static addEvent(Event event) {
    events.add(event);
  }

  static List<Event> completedEvents = events
      .where((event) => event.isCompleted)
      .toList()
    ..addAll(bootcamps.where((btcmp) => btcmp.isCompleted));

  static completeEvent(int index) {
    events[index].isCompleted = true;
  }
}
