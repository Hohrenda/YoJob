import 'package:YoJob/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoJobTextField extends StatelessWidget {
  const YoJobTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.enabled = true,
    this.shouldHaveMultiLines = false,
    this.height = 40.0,
    this.obscureText,
    this.validator,
    this.icon,
    this.inputBorder,
    this.contentPadding,
  }) : super(key: key);

  final bool? obscureText;
  final bool enabled;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double height;
  final Widget? icon;
  final InputBorder? inputBorder;
  final EdgeInsets? contentPadding;
  final bool shouldHaveMultiLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextFormField(
        keyboardType: shouldHaveMultiLines ? TextInputType.multiline : null,
        enabled: enabled,
        validator: validator,
        obscureText: obscureText ?? false,
        controller: controller,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.normal,
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 24, maxWidth: 34),
          errorStyle: const TextStyle(fontSize: 14.0, height: 0.8),
          enabledBorder: inputBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: YoJobColors.primaryColor,
                ),
              ),
          focusedBorder: inputBorder,
          contentPadding: contentPadding ?? const EdgeInsets.only(bottom: 8.0),
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            color: const Color.fromRGBO(150, 150, 150, 1),
            fontWeight: FontWeight.normal,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
