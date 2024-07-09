

class FoodDeliveryAddress {
  String address = '';
  String addType = '';
  bool isDefault = false;

  FoodDeliveryAddress(
      {required this.addType, required this.address, required this.isDefault});

  FoodDeliveryAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    addType = json['add_type'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    data['add_type'] = addType;
    data['isDefault'] = isDefault;

    return data;
  }
}
