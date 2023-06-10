abstract class UnauthPaths {
  static const String root = '/';
  static const String activation = '/activate';

  static const List<String> allRoutes = <String>[root, activation];
}

abstract class AuthPaths {
  static const String me = '/me';
  static const String companyEdition = '/me/companyEdition';
  static const String vacancyEdition = '/me/vacancyEdition';
}
