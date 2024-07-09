class ChatData {
  String message = "";
  String image = "";
  String userName = "";
  String dateTime = "";
  int unreadMsgCount = 0;

  ChatData.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = json['message'];
    }
    if (json['image'] != null) {
      image = json['image'];
    }
    if (json['user_name'] != null) {
      userName = json['user_name'];
    }
    if (json['date_time'] != null) {
      dateTime = json['date_time'];
    }
    if (json['unread_msg_count'] != null) {
      unreadMsgCount = json['unread_msg_count'];
    }
  }
}
