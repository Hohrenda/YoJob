import 'package:YoJob/paths.dart';
import 'package:YoJob/views/authorization/root_screen.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: UnauthPaths.root,
      page: () => const Root(),
      participatesInRootNavigator: true,
      children: <GetPage<dynamic>>[

      ],
    ),
  ];
}
