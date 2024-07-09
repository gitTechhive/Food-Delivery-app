class RestaurantTiming {
  String days = '';
  String time = '';

  RestaurantTiming.fromJson(Map<String, dynamic> json) {
    if (json['days'] != null) {
      days = json['days'];
    }
    if (json['time'] != null) {
      time = json['time'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data['days'] != null) {
      data['days'] = days;
    }
    if (data['time'] != null) {
      data['time'] = time;
    }

    return data;
  }
}
