import '../../domain/entities/notification.dart';
import '../../domain/repositories/notification_repository.dart';
import '../data_sources/local/notification_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource localDataSource;

  NotificationRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Notification>> getNotifications() async {
    final notifications = await localDataSource.getLocalNotifications();
    return notifications.map((model) => model.toEntity()).toList();
  }
}
