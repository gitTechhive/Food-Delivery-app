class FoodTransaction {
  String name = '';
  String image = '';
  String date = '';
  String time = '';
  String price = '';
  bool isTopUp = false;

  FoodTransaction.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['image'] != null) {
      image = json['image'];
    }

    if (json['date'] != null) {
      date = json['date'];
    }
    if (json['time'] != null) {
      time = json['time'];
    }
    if (json['price'] != null) {
      price = json['price'];
    }
    if (json['isTopUp'] != null) {
      isTopUp = json['isTopUp'];
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

    if (data['date'] != null) {
      data['date'] = date;
    }
    if (data['price'] != null) {
      data['price'] = price;
    }
    if (data['isTopUp'] != null) {
      data['isTopUp'] = isTopUp;
    }
    return data;
  }
}
