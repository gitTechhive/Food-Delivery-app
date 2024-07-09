class SpecialOffer {
  String image = "";
  String discount = "";
  String validity = "";

  SpecialOffer.fromJson(Map<String, dynamic> json) {
    if (json['image'] != null) {
      image = json['image'];
    }
    if (json['discount'] != null) {
      discount = json['discount'];
    }
    if (json['validity'] != null) {
      validity = json['validity'];
    }
  }
}
