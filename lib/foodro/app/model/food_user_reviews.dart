class FoodUserReviews {
  String profileImage = '';
  String name = '';
  String comment = '';
  int totalLikes = 0;
  String days = '';
  double ratting = 0.0;
  bool isLikeComment = false;

  FoodUserReviews.fromJson(Map<String, dynamic> json) {
    if (json['profile_image'] != null) {
      profileImage = json['profile_image'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['ratting'] != null) {
      ratting = json['ratting'];
    }
    if (json['comment'] != null) {
      comment = json['comment'];
    }
    if (json['total_likes'] != null) {
      totalLikes = json['total_likes'];
    }
    if (json['isLikeComment'] != null) {
      isLikeComment = json['isLikeComment'];
    }
    if (json['days'] != null) {
      days = json['days'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data['profile_image'] != null) {
      data['profile_image'] = profileImage;
    }
    if (data['name'] != null) {
      data['name'] = name;
    }
    if (data['ratting'] != null) {
      data['ratting'] = ratting;
    }
    if (data['comment'] != null) {
      data['comment'] = comment;
    }
    if (data['total_likes'] != null) {
      data['total_likes'] = totalLikes;
    }
    if (data['isLikeComment'] != null) {
      data['isLikeComment'] = isLikeComment;
    }

    if (data['days'] != null) {
      data['days'] = days;
    }

    return data;
  }
}
