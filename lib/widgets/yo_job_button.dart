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
    this.isLoading = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onPressed,
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
            child: !isLoading
                ? Text(
                    buttonText,
                    style: GoogleFonts.montserrat(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
