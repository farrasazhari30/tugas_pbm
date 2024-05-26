import 'food_menu.dart';

class CartItem {
  FoodMenu foodMenu;
  int quantity;

  CartItem({required this.foodMenu, this.quantity = 1});
}
