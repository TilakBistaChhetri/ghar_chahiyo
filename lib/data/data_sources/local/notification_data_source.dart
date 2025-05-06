import '../../models/notification_models.dart';

abstract class NotificationLocalDataSource {
  Future<List<NotificationModel>> getLocalNotifications();
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  @override
  Future<List<NotificationModel>> getLocalNotifications() async {
    // Simulating a delay for local data fetching
    await Future.delayed(const Duration(seconds: 2));

    // Mock data
    return [
      NotificationModel(
        title: 'New Property Updated',
        message: 'Lorem Ipsum is simply dummy text of the printing.',
        time: '1hr ago',
        icon: 'new_releases',
      ),
      NotificationModel(
        title: 'Exclusive Offers Inside',
        message: 'Lorem Ipsum is simply dummy text of the printing.',
        time: '2hrs ago',
        icon: 'local_offer',
      ),
      NotificationModel(
        title: 'Property Review Request',
        message: 'Lorem Ipsum is simply dummy text of the printing.',
        time: '3hrs ago',
        icon: 'star',
      ),
    ];
  }
}
