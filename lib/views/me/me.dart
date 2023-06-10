import 'package:YoJob/paths.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/widgets/me_company_info.dart';
import 'package:YoJob/widgets/me_company_vacancies.dart';
import 'package:YoJob/views/me/me_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Me extends GetWidget<MeController> {
  const Me({super.key});

  MeController get c => controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 66.0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: const Icon(
                  Icons.logout_outlined,
                  color: YoJobColors.primaryColor,
                  size: 36.0,
                ),
                onPressed: c.logout,
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        floatingActionButton: c.selectedTab() == 2
            ? FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AuthPaths.vacancyEdition);
                },
                backgroundColor: YoJobColors.primaryColor,
                child: const Icon(
                  Icons.add,
                  size: SpacingDimens.medium,
                  color: Colors.white,
                ),
              )
            : null,
        body: c.isLoading()
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                  ),
                  child: CircularProgressIndicator(
                    color: YoJobColors.primaryColor,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingDimens.regular,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SpacingDimens.largeSpacer,
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: YoJobColors.hintColor,
                        child: SvgPicture.asset(
                          'lib/assets/company_icon.svg',
                          color: Colors.black,
                        ),
                      ),
                      SpacingDimens.largeSpacer,
                      Center(
                        child: Text(
                          c.companyInfo?.companyName ?? '',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SpacingDimens.tinySpacer,
                      Center(
                        child: Text(
                          c.companyInfo?.companyContactEmail ?? '',
                          style: GoogleFonts.montserrat(
                            color: YoJobColors.hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SpacingDimens.mediumSpacer,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              c.selectedTab.value = 1;
                            },
                            child: Text(
                              'About',
                              style: GoogleFonts.montserrat(
                                color: YoJobColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                decoration: c.selectedTab() == 1
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              c.selectedTab.value = 2;
                            },
                            child: Text(
                              'Vacancies',
                              style: GoogleFonts.montserrat(
                                color: YoJobColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                decoration: c.selectedTab() == 2
                                    ? TextDecoration.underline
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SpacingDimens.regularSpacer,
                      if (c.selectedTab() == 1) MeCompanyInfo(),
                      if (c.selectedTab() == 2) MeCompanyVacancies(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
