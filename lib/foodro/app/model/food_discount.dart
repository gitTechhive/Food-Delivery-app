class FoodDiscount {
  String name = '';
  String description = '';
  String discount = '';
  String image = '';

  FoodDiscount(
      {required this.name,
      required this.description,
      required this.image,
      required this.discount});

  FoodDiscount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['discount'] = discount;

    return data;
  }
}
