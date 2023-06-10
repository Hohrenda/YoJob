import 'package:YoJob/managers/vacancies_manager.dart';
import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:YoJob/paths.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/me/me_controller.dart';
import 'package:YoJob/widgets/vacancy_list_tile.dart';
import 'package:YoJob/widgets/yo_job_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeCompanyVacancies extends StatelessWidget {
  MeCompanyVacancies({Key? key}) : super(key: key);

  final VacanciesManager vacanciesManager = Get.find();
  final MeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    RxList<VacancyModel> vacancies = vacanciesManager
        .vacanciesList()
        .where(
          (vacancy) =>
              vacancy.vacancyCity!
                  .contains(controller.cityFilterController.text) &&
              vacancy.vacancyCategory!
                  .contains(controller.categoryFilterController.text),
        )
        .toList()
        .obs;

    return Obx(() {
      if (vacanciesManager.isLoading()) {
        return const CircularProgressIndicator(
          color: YoJobColors.primaryColor,
        );
      }

      if (vacanciesManager.shouldUpdate()) {
        vacancies = vacanciesManager
            .vacanciesList()
            .where(
              (vacancy) =>
                  vacancy.vacancyCity!
                      .contains(controller.cityFilterController.text) &&
                  vacancy.vacancyCategory!
                      .contains(controller.categoryFilterController.text),
            )
            .toList()
            .obs;
        vacanciesManager.shouldUpdate.value = false;
      }

      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: YoJobDropdown(
                  items: vacanciesManager.presentCities(),
                  controller: controller.cityFilterController,
                  hintText: 'City',
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Flexible(
                child: YoJobDropdown(
                  items: vacanciesManager.presentCategories(),
                  controller: controller.categoryFilterController,
                  hintText: 'Category',
                ),
              )
            ],
          ),
          SpacingDimens.mediumSpacer,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              VacancyModel currentVacancyModel = vacancies[index];

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
            itemCount: vacancies.length,
          ),
          SpacingDimens.xxlargeSpacer,
        ],
      );
    });
  }
}
