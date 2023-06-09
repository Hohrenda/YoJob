import 'package:YoJob/views/me/me_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Me extends GetWidget<MeController> {
  const Me({super.key});

  MeController get c => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 66.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 36.0,
              ),
              onPressed: c.logout,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(255, 120, 63, 1),
        titleTextStyle: GoogleFonts.montserrat(
          color: Colors.black,
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
