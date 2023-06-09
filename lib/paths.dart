abstract class UnauthPaths {
  static const String root = '/';
  static const String register = '/register';

  static const List<String> allRoutes = <String>[root, register];
}

abstract class AuthPaths {
  static const String me = '/me';
}
