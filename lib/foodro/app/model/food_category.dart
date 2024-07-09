import 'package:foodro/foodro/app/model/restaurant.dart';

class FoodCategory {
  int? id;
  String? name;
  String? image;
  List<FoodRestaurant> restaurantList = [];

  FoodCategory({required this.id, required this.name, required this.image});

  FoodCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['restaurant_list'] != null) {
      restaurantList = List<dynamic>.from(json['restaurant_list'])
          .map((i) => FoodRestaurant.fromJson(i))
          .toList();
    }


  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (data['restaurant_list'] != null) {
      data['restaurant_list'] =
          restaurantList.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
