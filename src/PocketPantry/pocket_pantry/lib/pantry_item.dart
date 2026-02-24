import 'package:hive_flutter/hive_flutter.dart';

part 'pantry_item.g.dart';

@HiveType(typeId: 0)
class PantryItem extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String category;

  @HiveField(2)
  int quantity;

  @HiveField(3)
  DateTime? expirationDate;

  @HiveField(4)
  String? notes;

  @HiveField(5)
  DateTime dateAdded;


  PantryItem({
    required this.name,
    required this.category,
    required this.quantity,
    this.expirationDate,
    this.notes,
    required this.dateAdded,

  });

}