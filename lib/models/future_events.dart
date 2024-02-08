import 'package:breakdown/models/future_event.dart';
import 'package:hive/hive.dart';

class FutureEventsList {
  List<FutureEvent> _events = [];

  Future<void> init() async {
    await Hive.openBox<List>('events');
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    var box = Hive.box<List>('events');
    var storedEvents = box.get('events');
    if (storedEvents != null) {
      _events = storedEvents.cast<FutureEvent>();
    }
  }

  void _saveEvents() async {
    var box = Hive.box<List>('events');
    await box.put('events', _events);
  }

  List<FutureEvent> get events => List.unmodifiable(_events);

  FutureEvent getElementAtIndex(int index) {
    return _events[index];
  }

  void addEvent(FutureEvent event) {
    _events.add(event);
    _saveEvents();
  }

  void removeEvent(FutureEvent event) {
    _events.remove(event);
    _saveEvents();
  }
}
