class FoodNotification {
  String title = '';
  String message = '';
  String date = '';
  String time = '';
  String image = '';
  bool isNew = false;

  FoodNotification(
      {required this.title,
      required this.message,
      required this.date,
      required this.time,
      required this.image,
      required this.isNew});

  FoodNotification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    date = json['date'];
    isNew = json['isNew'];
    time = json['time'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    data['date'] = date;
    data['isNew'] = isNew;
    data['time'] = time;
    data['image'] = image;

    return data;
  }
}
