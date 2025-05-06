import '../../domain/entities/notification.dart';

class NotificationModel {
  final String title;
  final String message;
  final String time;
  final String icon;

  NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
  });


  Notification toEntity() {
    return Notification(title: title, message: message, time: time, icon: icon);
  }

 
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      message: json['message'],
      time: json['time'],
      icon: json['icon'],
    );
  }
}
