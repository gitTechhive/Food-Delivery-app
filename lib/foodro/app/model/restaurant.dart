import 'package:foodro/foodro/app/model/food_menu.dart';
import 'package:foodro/foodro/app/model/food_user_reviews.dart';
import 'package:foodro/foodro/app/model/restaurant_timing.dart';
import 'package:get/get.dart';

class FoodRestaurant {
  int? catId;
  String name = '';
  String image = '';
  String distance = '';
  String price = '';
  String distancePrice = '';
  double rating = 0.0;
  String reviews = '';
  String address = '';
  String description = '';
  RxBool isFavorite = false.obs;
  bool isDiscount = false;
  double latitude = 0.0;
  double longitude = 0.0;
  List<FoodMenu> forYouList = [];
  List<FoodMenu> menuList = [];
  List<FoodMenu> drinkList = [];
  List<RestaurantTiming> timingList = [];
  List<FoodUserReviews> userReviewsList = [];

  FoodRestaurant();

  FoodRestaurant.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];

    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['image'] != null) {
      image = json['image'];
    }
    if (json['distance'] != null) {
      distance = json['distance'];
    }
    if (json['price'] != null) {
      price = json['price'];
    }
    if (json['distance_price'] != null) {
      distancePrice = json['distance_price'];
    }
    if (json['rating'] != null) {
      rating = json['rating'];
    }
    if (json['reviews'] != null) {
      reviews = json['reviews'];
    }
    if (json['description'] != null) {
      description = json['description'];
    }
    if (json['address'] != null) {
      address = json['address'];
    }
    if (json['isFavorite'] != null) {
      isFavorite.value = json['isFavorite'];
    }
    if (json['isDiscount'] != null) {
      isDiscount = json['isDiscount'];
    }
    if (json['latitude'] != null) {
      latitude = json['latitude'];
    }
    if (json['longitude'] != null) {
      longitude = json['longitude'];
    }
    if (json['for_you'] != null) {
      forYouList = List<dynamic>.from(json['for_you'])
          .map((i) => FoodMenu.fromJson(i))
          .toList();
    }
    if (json['menu_list'] != null) {
      menuList = List<dynamic>.from(json['menu_list'])
          .map((i) => FoodMenu.fromJson(i))
          .toList();
    }
    if (json['drink_list'] != null) {
      drinkList = List<dynamic>.from(json['drink_list'])
          .map((i) => FoodMenu.fromJson(i))
          .toList();
    }
    if (json['timing'] != null) {
      timingList = List<dynamic>.from(json['timing'])
          .map((i) => RestaurantTiming.fromJson(i))
          .toList();
    }
    if (json['user_reviews'] != null) {
      userReviewsList = List<dynamic>.from(json['user_reviews'])
          .map((i) => FoodUserReviews.fromJson(i))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data['name'] != null) {
      data['name'] = name;
    }
    if (data['image'] != null) {
      data['image'] = image;
    }
    if (data['distance'] != null) {
      data['distance'] = distance;
    }
    if (data['price'] != null) {
      data['price'] = price;
    }
    if (data['rating'] != null) {
      data['rating'] = rating;
    }
    if (data['reviews'] != null) {
      data['reviews'] = reviews;
    }
    if (data['description'] != null) {
      data['description'] = description;
    }
    if (data['address'] != null) {
      data['address'] = address;
    }
    if (data['isFavorite'] != null) {
      data['isFavorite'] = isFavorite.value;
    }
    if (data['isDiscount'] != null) {
      data['isDiscount'] = isDiscount;
    }
    if (data['latitude'] != null) {
      data['latitude'] = isDiscount;
    }
    if (data['longitude'] != null) {
      data['longitude'] = longitude;
    }
    if (data['for_you'] != null) {
      data['for_you'] = forYouList.map((item) => item.toJson()).toList();
    }
    if (data['menu_list'] != null) {
      data['menu_list'] = menuList.map((item) => item.toJson()).toList();
    }
    if (data['drink_list'] != null) {
      data['drink_list'] = drinkList.map((item) => item.toJson()).toList();
    }
    if (data['timing'] != null) {
      data['timing'] = timingList.map((item) => item.toJson()).toList();
    }
    if (data['user_reviews'] != null) {
      data['user_reviews'] =
          userReviewsList.map((item) => item.toJson()).toList();
    }
    return data;
  }
}
