class AppConfig {
  static String get apiBaseUrl {
    return const bool.fromEnvironment('dart.vm.product')
        ? 'https://your-production-api.com'
        : 'http://10.0.2.2:3000';
  }
}
