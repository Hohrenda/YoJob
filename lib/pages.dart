import 'package:YoJob/paths.dart';
import 'package:YoJob/views/authorization/activation.dart';
import 'package:YoJob/views/authorization/activation_controller.dart';
import 'package:YoJob/views/authorization/root.dart';
import 'package:YoJob/views/me/company_edition.dart';
import 'package:YoJob/views/me/company_edition_controller.dart';
import 'package:YoJob/views/me/me.dart';
import 'package:YoJob/views/me/me_controller.dart';
import 'package:YoJob/views/me/vacancy_edition.dart';
import 'package:YoJob/views/me/vacancy_edition_controller.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: UnauthPaths.root,
      page: () => const Root(),
      participatesInRootNavigator: true,
      children: <GetPage<dynamic>>[
        GetPage(
          name: UnauthPaths.activation,
          page: () => const Activation(),
          binding: BindingsBuilder<ActivationController>.put(
            () => ActivationController(),
          ),
        ),
        GetPage(
          name: AuthPaths.me,
          page: () => const Me(),
          binding: BindingsBuilder<MeController>.put(
            () => MeController(),
          ),
        ),
        GetPage(
          name: AuthPaths.companyEdition,
          page: () => const CompanyEdition(),
          binding: BindingsBuilder<CompanyEditionController>.put(
            () => CompanyEditionController(),
          ),
        ),
        GetPage(
          name: AuthPaths.vacancyEdition,
          page: () => const VacancyEdition(),
          binding: BindingsBuilder<VacancyEditionController>.put(
            () => VacancyEditionController(),
          ),
        ),
      ],
    ),
  ];
}
