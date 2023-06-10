import 'package:YoJob/models/me/vacancie_model.dart';
import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VacancyListTile extends StatelessWidget {
  const VacancyListTile({
    Key? key,
    required this.vacancyModel,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final VacancyModel vacancyModel;
  final VoidCallback onEdit;
  final VoidCallback onDelete;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    vacancyModel.vacancyName ?? '',
                    style: GoogleFonts.montserrat(
                      color: YoJobColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SpacingDimens.tinySpacer,
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          vacancyModel.vacancyCity ?? '',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Flexible(
                        child: Text(
                          vacancyModel.vacancyCategory ?? '',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SpacingDimens.tinySpacer,
                  Text(
                    vacancyModel.vacancyDescription ?? '',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: onEdit,
                  child: const Text('Edit'),
                ),
                PopupMenuItem(
                  onTap: onDelete,
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
