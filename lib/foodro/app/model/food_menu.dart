import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FoodMenu {
  String name = '';
  String image = '';
  String price = '';
  String status = '';
  String paymentType = '';
  String distance = '';
  String description = '';
  bool isBestSeller = false;
  bool isDiscount = false;
  bool isNew = false;
  bool isItemSelected = false;
  RxInt qty = 0.obs;

  FoodMenu.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['image'] != null) {
      image = json['image'];
    }

    if (json['price'] != null) {
      price = json['price'];
    }
    if (json['status'] != null) {
      status = json['status'];
    }
    if (json['payment_type'] != null) {
      paymentType = json['payment_type'];
    }
    if (json['distance'] != null) {
      distance = json['distance'];
    }

    if (json['isBestSeller'] != null) {
      isBestSeller = json['isBestSeller'];
    }
    if (json['isDiscount'] != null) {
      isDiscount = json['isDiscount'];
    }
    if (json['isNew'] != null) {
      isDiscount = json['isNew'];
    }
    if (json['description'] != null) {
      description = json['description'];
    }
    if (json['qty'] != null) {
      int quantity = json['qty'];
      qty = RxInt(quantity);
    }
    isItemSelected = false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data['name'] != null) {
      data['name'] = name;
    }
    if (data['image'] != null) {
      data['image'] = image;
    }

    if (data['price'] != null) {
      data['price'] = price;
    }
    if (data['status'] != null) {
      data['status'] = status;
    }
    if (data['payment_type'] != null) {
      data['payment_type'] = paymentType;
    }
    if (data['distance'] != null) {
      data['distance'] = distance;
    }

    if (data['isBestSeller'] != null) {
      data['isBestSeller'] = isBestSeller;
    }
    if (data['isDiscount'] != null) {
      data['isDiscount'] = isDiscount;
    }
    if (data['isNew'] != null) {
      data['isNew'] = isDiscount;
    }
    if (data['description'] != null) {
      data['description'] = description;
    }
    if (data['qty'] != null) {
      data['qty'] = qty;
    }
    return data;
  }
}
