import 'package:YoJob/utils/spacing_utils.dart';
import 'package:YoJob/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoJobButton extends StatelessWidget {
  const YoJobButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.fontSize,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          gradient: YoJobColors.yoJobThemeGradient,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: SpacingDimens.regular,
            horizontal: SpacingDimens.xlarge,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.montserrat(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
