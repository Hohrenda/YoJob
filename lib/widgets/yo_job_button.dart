import 'package:YoJob/utils/spacing_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoJobButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;

  const YoJobButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            SpacingDimens.regular,
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
