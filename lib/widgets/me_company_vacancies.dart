import 'package:YoJob/managers/vacancies_manager.dart';
import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:YoJob/paths.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/widgets/vacancy_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeCompanyVacancies extends StatelessWidget {
  MeCompanyVacancies({Key? key}) : super(key: key);

  final VacanciesManager vacanciesManager = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (vacanciesManager.isLoading()) {
        return const CircularProgressIndicator(
          color: YoJobColors.primaryColor,
        );
      }

      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[],
          ),
          SpacingDimens.mediumSpacer,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              VacancyModel currentVacancyModel =
                  vacanciesManager.vacanciesList()[index];

              return VacancyListTile(
                vacancyModel: currentVacancyModel,
                onEdit: () {
                  vacanciesManager.selectedVacancy.value = currentVacancyModel;
                  Future.delayed(
                    const Duration(seconds: 1),
                    () => Get.toNamed(AuthPaths.vacancyEdition),
                  );
                },
                onDelete: () =>
                    vacanciesManager.deleteVacancy(currentVacancyModel),
              );
            },
            separatorBuilder: (_, __) => SpacingDimens.smallSpacer,
            itemCount: vacanciesManager.vacanciesList().length,
          ),
          SpacingDimens.xxlargeSpacer,
        ],
      );
    });
  }
}
