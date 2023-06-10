import 'package:YoJob/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YoJobDropdown extends StatefulWidget {
  const YoJobDropdown({
    Key? key,
    required this.items,
    required this.controller,
    required this.hintText,
    this.shouldFill = true,
    this.borderRadius = 10,
    this.selectedValue,
    this.validator,
  }) : super(key: key);

  final List<String> items;
  final String? selectedValue;
  final String? Function(String?)? validator;
  final bool shouldFill;
  final double borderRadius;
  final TextEditingController controller;
  final String hintText;

  @override
  State<YoJobDropdown> createState() => _YoJobDropdownState();
}

class _YoJobDropdownState extends State<YoJobDropdown> {
  @override
  void initState() {
    if (widget.selectedValue != null) {
      widget.controller.text = widget.selectedValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor:
          widget.shouldFill ? YoJobColors.primaryColor : Colors.white,
      decoration: InputDecoration(
        filled: widget.shouldFill,
        fillColor: YoJobColors.primaryColor,
        errorStyle: GoogleFonts.montserrat(
          color: const Color.fromRGBO(150, 150, 150, 1),
          fontSize: 16,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: YoJobColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: YoJobColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
        ),
      ),
      validator: widget.validator,
      value: widget.selectedValue,
      isExpanded: true,
      hint: Text(
        widget.hintText,
        style: GoogleFonts.montserrat(
          color: widget.shouldFill
              ? Colors.white
              : const Color.fromRGBO(150, 150, 150, 1),
          fontSize: 16,
        ),
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      style: GoogleFonts.montserrat(
        color: widget.shouldFill ? Colors.white : Colors.black,
        fontSize: 16.0,
      ),
      onChanged: (String? newValue) {
        setState(
          () {
            widget.controller.text = newValue!;
          },
        );
      },
      items: widget.items.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Text(
                value,
                style: GoogleFonts.montserrat(
                  color: widget.shouldFill ? Colors.white : Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
