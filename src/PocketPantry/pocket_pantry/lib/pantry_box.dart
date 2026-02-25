import 'package:hive_flutter/hive_flutter.dart';
import 'pantry_item.dart';

class PantryBox{
  static Box<PantryItem> get box => Hive.box<PantryItem>('pantryItems');

  static void saveItem(PantryItem item){
    box.add(item);
  }

  static List<PantryItem> getAllItems(){
    return box.values.toList();
  }

  static void deleteItem(int index){
    box.deleteAt(index);
  }
}