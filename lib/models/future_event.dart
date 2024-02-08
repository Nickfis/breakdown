import 'dart:io';
import 'package:hive/hive.dart';

part 'future_event.g.dart';

@HiveType(typeId: 0)
class FutureEvent {
  @HiveField(0)
  DateTime? date;
  @HiveField(1)
  String? imagePath;
  @HiveField(2)
  String title;
  @HiveField(3)
  String unit;
  @HiveField(4)
  DateTime createdAt;
  @HiveField(5)
  bool done;

  FutureEvent({
    this.date,
    required this.title,
    required this.unit,
    required this.createdAt,
    this.imagePath,
    this.done = false,
  });
}

@HiveType(typeId: 1)
class CustomUnitEvent extends FutureEvent {
  @HiveField(6)
  String unitName;
  @HiveField(7)
  int amountRequired;
  List<ProgressRecord> amountAchieved;

  CustomUnitEvent({
    required String title,
    required DateTime createdAt,
    required this.unitName,
    required this.amountRequired,
    String? imagePath, // Define image as a regular parameter
    List<ProgressRecord>? amountAchieved,
  })  : amountAchieved = amountAchieved ??
            [ProgressRecord(amount: 0, timestamp: DateTime.now())],
        super(
          title: title,
          unit: 'custom',
          createdAt: createdAt,
          imagePath: imagePath, // Pass image to the super constructor
        );
}

@HiveType(typeId: 2)
class ProgressRecord {
  @HiveField(0)
  int amount;
  @HiveField(1)
  DateTime timestamp;

  ProgressRecord({required this.amount, required this.timestamp});
}
