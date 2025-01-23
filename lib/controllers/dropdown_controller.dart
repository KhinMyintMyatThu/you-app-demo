import 'package:get/get.dart';

class DropdownController extends GetxController {
  // List of items
  final items = ['Male', 'Female'];

  // Observable for selected item
  RxString selectedItem = ''.obs;

  void setSelectedItem(String value) {
    selectedItem.value = value;
  }
}
