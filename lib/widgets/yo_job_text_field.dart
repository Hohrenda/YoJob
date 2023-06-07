import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoJobTextField extends StatelessWidget {
  final bool? obscureText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double width;
  final double height;

  const YoJobTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.width = 314.0,
    this.height = 40.0,
    this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        obscureText: obscureText ?? false,
        controller: controller,
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.normal, fontSize: 24.0),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 14.0,height: 0.8),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: const EdgeInsets.only(bottom: 8.0),
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
              color: const Color.fromRGBO(150, 150, 150, 1),
              fontWeight: FontWeight.normal,
              fontSize: 24.0),
        ),
      ),
    );
  }
}