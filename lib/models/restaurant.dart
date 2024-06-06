import 'package:collection/collection.dart';
import 'package:dine_direct/models/cart_item.dart';
import 'package:dine_direct/models/food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final restaurantProvider = ChangeNotifierProvider((ref) => Restaurant());

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Classic Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/images/burgers/cheese_burger.jpg',
      price: 10.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
        Addon(name: 'Avocado', price: 2.99),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description:
          'A delicious veggie patty with fresh lettuce, tomato, and a hint of onion and pickle.',
      imagePath: 'assets/images/burgers/vege_burger.jpg',
      price: 11.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Vegan cheese', price: 0.99),
        Addon(name: 'Grilled Mushrooms', price: 1.49),
        Addon(name: 'Hummus Spread', price: 1.99),
      ],
    ),
    Food(
      name: 'Blue Moon Burger',
      description:
          'A beef patty with blue cheese, caramelized onions, lettuce, and tomato.',
      imagePath: 'assets/images/burgers/bluemoon_burger.jpg',
      price: 12.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Sauteed mushrooms', price: 0.99),
        Addon(name: 'Fried Egg', price: 1.49),
        Addon(name: 'Spicy mayo', price: 0.99),
      ],
    ),
    Food(
      name: 'BBQ Burger',
      description:
          'A juicy beef patty with BBQ sauce, cheddar cheese, lettuce, and tomato.',
      imagePath: 'assets/images/burgers/bbq_burger.jpg',
      price: 13.49,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Grilled Onions', price: 0.99),
        Addon(name: 'Jalapenos', price: 1.49),
        Addon(name: 'Extra BBQ Sauce', price: 1.99),
      ],
    ),
    Food(
      name: 'Aloha Burger',
      description:
          'A beef patty with grilled pineapple, ham, lettuce, and a hint of teriyaki sauce.',
      imagePath: 'assets/images/burgers/aloha_burger.jpg',
      price: 13.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Teriyaki Glaze', price: 0.99),
        Addon(name: 'Extra Pineapple', price: 0.99),
        Addon(name: 'Bacon', price: 1.49),
      ],
    ),

    // salads
    Food(
      name: 'South West Chicken Salad',
      description: 'A spicy salad with corn, beans, and a tangy dressing.',
      imagePath: 'assets/images/salads/southwest_salad.jpg',
      price: 13.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Sour Cream', price: 0.99),
        Addon(name: 'Pico de Gallo', price: 1.49),
        Addon(name: 'Guacamole', price: 1.99),
      ],
    ),
    Food(
      name: 'Quinoa Salad',
      description: 'A healthy quinoa salad with fresh vegetables.',
      imagePath: 'assets/images/salads/quinoa_salad.jpg',
      price: 19.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Avocado', price: 0.99),
        Addon(name: 'Feta Cheese', price: 1.49),
        Addon(name: 'Grilled Chicken', price: 1.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description: 'A classic Greek salad with feta cheese and olives.',
      imagePath: 'assets/images/salads/greek_salad.jpg',
      price: 18.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Feta', price: 0.99),
        Addon(name: 'kalamata Olives', price: 1.49),
        Addon(name: 'Grilled Shrimp', price: 1.99),
      ],
    ),
    Food(
      name: 'Caesar Salad',
      description: 'A traditional Caesar salad with creamy dressing.',
      imagePath: 'assets/images/salads/caesar_salad.jpg',
      price: 13.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 0.99),
        Addon(name: 'Anchovies', price: 1.49),
        Addon(name: 'Extra Parmesan', price: 1.99),
      ],
    ),
    Food(
      name: 'Asian Sesame Salad',
      description: 'A fresh salad with sesame dressing and crispy wontons.',
      imagePath: 'assets/images/salads/asiansesame_salad.jpg',
      price: 14.49,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Mandarian Oranges', price: 0.99),
        Addon(name: 'Almond Slivers', price: 1.49),
        Addon(name: 'Extra Teriyaki Chicken', price: 1.99),
      ],
    ),

    //sides
    Food(
      name: 'Sweet Potato Fries',
      description: 'Crispy sweet potato fries with a touch of salt.',
      imagePath: 'assets/images/sides/sweet_potato_side.jpg',
      price: 11.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese Sauce', price: 0.99),
        Addon(name: 'Truffle oil', price: 1.49),
        Addon(name: 'Cajun Spice', price: 1.99),
      ],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Golden fried onion rings.',
      imagePath: 'assets/images/sides/onion_rings_side.jpg',
      price: 11.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Ranch Dip', price: 0.99),
        Addon(name: 'Spicy Mayo', price: 1.49),
        Addon(name: 'Parmesan Dust', price: 1.99),
      ],
    ),
    Food(
      name: 'Crispy Mac & Cheese Bites.',
      description:
          'Creamy macaroni and cheese, perfect for on-the-go snacking.',
      imagePath: 'assets/images/sides/mac_side.jpg',
      price: 12.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Bacon Bits', price: 0.99),
        Addon(name: 'Jalapeno Slices', price: 1.49),
        Addon(name: 'Sriracha Drizzle', price: 1.99),
      ],
    ),
    Food(
      name: 'Loaded Fries',
      description: 'Fries loaded with cheese, bacon, and green onions.',
      imagePath: 'assets/images/sides/loadedfries_side.jpg',
      price: 12.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Sour Cream', price: 0.99),
        Addon(name: 'Bacon Bits', price: 1.49),
        Addon(name: 'Green Onions', price: 0.99),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      description:
          'Toasted garlic bread slices, topped with melted butter and parsley.',
      imagePath: 'assets/images/sides/garlic_bread_side.jpg',
      price: 11.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Extra Garlic', price: 0.99),
        Addon(name: 'Mozzarella Cheese', price: 1.49),
        Addon(name: 'Marinara Dip', price: 1.99),
      ],
    ),

    //desserts
    Food(
      name: 'Cookie Dessert',
      description: 'A classic chocolate chip cookie, crispy and chewy.',
      imagePath: 'assets/images/desserts/cookie_dessert.jpg',
      price: 10.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Caramel Sauce', price: 0.99),
        Addon(name: 'Hot Fudge', price: 1.49),
        Addon(name: 'Chocolate Sprinkles', price: 1.99),
      ],
    ),
    Food(
      name: 'Doughnut Dessert',
      description: 'A sweet doughnut with a glazed topping.',
      imagePath: 'assets/images/desserts/doughnut_dessert.jpg',
      price: 11.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Caramel Sauce', price: 0.99),
        Addon(name: 'Vanilla Ice Cream', price: 1.49),
        Addon(name: 'Cinnamon Spice', price: 1.99),
      ],
    ),
    Food(
      name: 'Chocolate Brownie',
      description: 'Rich and fudgy chocolate brownie, with chunks of chocolate',
      imagePath: 'assets/images/desserts/brownies_dessert.jpg',
      price: 11.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 0.99),
        Addon(name: 'Hot Fudge', price: 1.49),
        Addon(name: 'Whipped Cream', price: 1.99),
      ],
    ),
    Food(
      name: 'Cake',
      description: 'A slice of delicious cake with creamy frosting.',
      imagePath: 'assets/images/desserts/cake_dessert.jpg',
      price: 12.49,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'raspberry Sauce', price: 0.99),
        Addon(name: 'Cream Cheese Icing', price: 1.49),
        Addon(name: 'Chocolate Sprinkles', price: 1.99),
      ],
    ),
    Food(
      name: 'Cupcake',
      description: 'A cupcake with rich and creamy icing.',
      imagePath: 'assets/images/desserts/cupcake_dessert.jpg',
      price: 11.79,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Strawberry Topping', price: 0.99),
        Addon(name: 'Blueberry Compote', price: 1.49),
        Addon(name: 'Chocolate Chips', price: 1.99),
      ],
    ),

    //drinks
    Food(
      name: 'Caramel Drink',
      description: 'A sweet caramel-flavored beverage perfect for a treat.',
      imagePath: 'assets/images/drinks/caramel_drink.jpg',
      price: 11.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Shot of Espresso', price: 0.99),
        Addon(name: 'Hazelnut Syrup', price: 0.49),
        Addon(name: 'Whipped Cream', price: 0.99),
      ],
    ),
    Food(
      name: 'Mojito',
      description: 'A refreshing mint and lime flavored drink.',
      imagePath: 'assets/images/drinks/mojito_drink.jpg',
      price: 11.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Mint', price: 0.49),
        Addon(name: 'Raspberry Puree', price: 0.99),
        Addon(name: 'Splash of Coconut Rum', price: 1.99),
      ],
    ),
    Food(
      name: 'Smoothie',
      description: 'A healthy fruit smoothie to refresh your day.',
      imagePath: 'assets/images/drinks/smoothie_drink.jpg',
      price: 12.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Protein Powder', price: 0.99),
        Addon(name: 'Almond Milk', price: 1.49),
        Addon(name: 'Chia Sedds', price: 1.99),
      ],
    ),
    Food(
      name: 'Iced Tearink',
      description: 'Chilled iced tea with a hint of lemon.',
      imagePath: 'assets/images/drinks/iced_tea_drink.jpg',
      price: 12.29,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Peach Flavor', price: 0.99),
        Addon(name: 'Leamon Slices', price: 1.49),
        Addon(name: 'Honey', price: 1.99),
      ],
    ),
    Food(
      name: 'Lemonade',
      description: 'A classic lemonade, refreshing and sweet.',
      imagePath: 'assets/images/drinks/lemonade_drink.jpg',
      price: 11.49,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Strawberry Flavor', price: 0.99),
        Addon(name: 'Mint Leaves', price: 1.49),
        Addon(name: 'Ginger Zest', price: 1.99),
      ],
    ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address (which user can change/update)
  String _deliveryAddress = 'Enter your address';

  //***** getters *****//
  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  //***** operations *****//

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

//get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //***** helpers *****//

  //generate receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln('Here is your receipt');
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('- - - - - - - - - -');

    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln('      Add-ons: ${_formatAddon(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt.writeln('- - - - - - - - - -');
    receipt.writeln();
    receipt.writeln('Total Items: ${getTotalItemCount()}');
    receipt.writeln('Total Price: ${_formatPrice(getTotalPrice())}');
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return '\$ ${price.toStringAsFixed(2)}';
  }

  //format list of addons into string summary
  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }
}
