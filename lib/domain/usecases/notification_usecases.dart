import '../entities/notification.dart';
import '../repositories/notification_repository.dart';

abstract class NotificationUseCase {
  Future<List<Notification>> getNotifications();
}

class GetNotificationsUseCase implements NotificationUseCase {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<List<Notification>> getNotifications() async {
    final notifications = await repository.getNotifications();
    return notifications;
  }
}
