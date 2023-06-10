import 'package:YoJob/paths.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:YoJob/views/me/me_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MeCompanyInfo extends StatelessWidget {
  MeCompanyInfo({Key? key}) : super(key: key);

  final MeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('lib/assets/link_icon.svg'),
                      SpacingDimens.tinySpacer,
                      Text(
                        controller.companyInfo?.websiteLink ?? '',
                        style: GoogleFonts.montserrat(
                          color: YoJobColors.secondaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SpacingDimens.tinySpacer,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('lib/assets/building_icon.svg'),
                      SpacingDimens.tinySpacer,
                      Flexible(
                        child: Text(
                          controller.companyInfo?.industryName ?? '',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SpacingDimens.tinySpacer,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset('lib/assets/employees_icon.svg'),
                      SpacingDimens.tinySpacer,
                      Text(
                        controller.companyInfo?.employeesCount ?? '',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SpacingDimens.xsmallSpacer,
            InkWell(
              onTap: () => Get.toNamed(AuthPaths.companyEdition),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('lib/assets/pencil_icon.svg'),
              ),
            ),
          ],
        ),
        SpacingDimens.smallSpacer,
        Text(
          controller.companyInfo?.companyDescription ?? '',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
