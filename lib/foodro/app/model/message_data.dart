class MessageData {
  String message = "";
  String image = "";
  DateTime? dateTime;

  bool isSender = false;
  List<String> images = [];

  MessageData(
      {required this.message,
      required this.image,
      required this.isSender,
       this.dateTime,
      required this.images});

  MessageData.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = json['message'];
    }
    if (json['isSender'] != null) {
      isSender = json['isSender'];
    }
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
    if (json['date_time'] != null) {
      dateTime = DateTime.parse(json['date_time']);
    }
  }


  String get time {
    final hour = dateTime!.hour > 12 ? dateTime!.hour - 12 : dateTime!.hour;
    final amPm = dateTime!.hour >= 12 ? 'PM' : 'AM';
    return '$hour:${dateTime!.minute.toString().padLeft(2, '0')} $amPm';
  }
}
