import 'package:YoJob/utils/app_contants.dart';
import 'package:YoJob/utils/input_validator.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/me/company_edition_controller.dart';
import 'package:YoJob/widgets/yo_job_button.dart';
import 'package:YoJob/widgets/yo_job_dropdown.dart';
import 'package:YoJob/widgets/yo_job_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanyEdition extends GetWidget<CompanyEditionController> {
  const CompanyEdition({super.key});

  CompanyEditionController get c => controller;

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
                  SpacingDimens.xlargeSpacer,
                  Center(
                    child: Text(
                      'Welcome to YoJob!',
                      style: GoogleFonts.montserrat(
                        color: YoJobColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SpacingDimens.xlargeSpacer,
                  Center(
                    child: Text(
                      '  Tell us about \nyour company',
                      style: GoogleFonts.montserrat(
                        color: YoJobColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SpacingDimens.xxlargeSpacer,
                  Text(
                    'Name',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Your company name',
                    controller: c.companyNameController,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Contact email',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Enter your company contact email',
                    controller: c.companyContactEmailController,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                    validator: InputValidator.emailValidator,
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
                    selectedValue: c.industryNameController.text.isNotEmpty
                        ? c.industryNameController.text
                        : null,
                    controller: c.industryNameController,
                    shouldFill: false,
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Website link',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Paste your website link here',
                    controller: c.websiteLinkController,
                    validator: InputValidator.presenceValidator,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Employees count',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobDropdown(
                    hintText: 'Select number of Employees',
                    items: AppConstants.numberOfEmployees,
                    selectedValue: c.employeesCountController.text.isNotEmpty
                        ? c.employeesCountController.text
                        : AppConstants.numberOfEmployees.first,
                    controller: c.employeesCountController,
                    borderRadius: 5,
                    validator: InputValidator.presenceValidator,
                  ),
                  SpacingDimens.smallSpacer,
                  Text(
                    'Company description',
                    style: bodyTheme,
                  ),
                  SpacingDimens.smallSpacer,
                  YoJobTextField(
                    hintText: 'Paste your company description here',
                    shouldHaveMultiLines: true,
                    controller: c.companyDescriptionController,
                    validator: InputValidator.presenceValidator,
                    inputBorder: borderTheme,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  SpacingDimens.xlargeSpacer,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      YoJobButton(
                        onPressed: c.updateCompanyInfo,
                        buttonText: 'Save',
                        fontSize: 20.0,
                        isLoading: c.isLoading,
                      ),
                    ],
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
