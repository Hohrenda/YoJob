import 'package:YoJob/utils/app_contants.dart';
import 'package:YoJob/utils/input_validator.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/me/vacancy_edition_controller.dart';
import 'package:YoJob/widgets/yo_job_dropdown.dart';
import 'package:YoJob/widgets/yo_job_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VacancyEdition extends GetWidget<VacancyEditionController> {
  const VacancyEdition({super.key});

  VacancyEditionController get c => controller;

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTheme = GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    InputBorder borderTheme = OutlineInputBorder(
      borderSide: const BorderSide(
        color: YoJobColors.primaryColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(
        10,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 8.0),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: YoJobColors.primaryColor,
            size: 32.0,
          ),
          onPressed: c.onBack,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.saveVacancy,
        backgroundColor: YoJobColors.primaryColor,
        child: const Icon(
          Icons.check,
          size: SpacingDimens.medium,
          color: Colors.white,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpacingDimens.regular,
            ),
            child: Form(
              key: c.formKey,
              autovalidateMode: c.autoValidateMode(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SpacingDimens.largeSpacer,
                  Text(
                    'Job Name',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Write the job name here',
                    controller: c.jobNameController,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'City',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Enter the company main city',
                    controller: c.jobCityController,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Industry',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobDropdown(
                    hintText: 'Category...',
                    items: AppConstants.jobCategories,
                    selectedValue: c.jobCategoryController.text.isNotEmpty
                        ? c.jobCategoryController.text
                        : null,
                    controller: c.jobCategoryController,
                    shouldFill: false,
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Job Description',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Paste the job description here',
                    controller: c.jobDescriptionController,
                    validator: InputValidator.presenceValidator,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  SpacingDimens.xxlargeSpacer,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
