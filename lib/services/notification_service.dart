import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationService {
  // Create storage instance
  static const _storage = FlutterSecureStorage();

  // Keys for secure storage
  static const String _notificationEnabledKey = 'notifications_enabled';
  static const String _notificationDismissedKey = 'notification_dismissed';

  // Check if notifications are enabled
  static Future<bool> areNotificationsEnabled() async {
    final value = await _storage.read(key: _notificationEnabledKey);
    return value == 'true';
  }

  // Set notification enabled state
  static Future<void> setNotificationsEnabled(bool enabled) async {
    await _storage.write(
      key: _notificationEnabledKey,
      value: enabled.toString(),
    );
  }

  // Check if notification prompt has been dismissed
  static Future<bool> isNotificationDismissed() async {
    final value = await _storage.read(key: _notificationDismissedKey);
    return value == 'true';
  }

  // Mark notification prompt as dismissed
  static Future<void> setNotificationDismissed(bool dismissed) async {
    await _storage.write(
      key: _notificationDismissedKey,
      value: dismissed.toString(),
    );
  }

  // Should we show the notification prompt?
  static Future<bool> shouldShowNotificationPrompt() async {
    // Don't show if notifications are already enabled
    if (await areNotificationsEnabled()) {
      return false;
    }

    // Don't show if explicitly dismissed before
    if (await isNotificationDismissed()) {
      return false;
    }

    return true;
  }

  // Delete all notification preferences (for testing/logout)
  static Future<void> clearNotificationPreferences() async {
    await _storage.delete(key: _notificationEnabledKey);
    await _storage.delete(key: _notificationDismissedKey);
  }
}
