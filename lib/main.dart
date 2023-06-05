import 'package:YoJob/firebase_options.dart';
import 'package:YoJob/pages.dart';
import 'package:YoJob/paths.dart';
import 'package:YoJob/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Services.init();

  runApp(
    GetMaterialApp(
      title: 'YoJob',
      initialRoute: UnauthPaths.root,
      getPages: Pages.pages,
      builder: (_, Widget? widget) => _AppSetup(
        child: widget!,
      ),
    ),
  );
}

class _AppSetup extends StatelessWidget {
  const _AppSetup({Key? key, required this.child}) : super(key: key);

  final Widget child;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return child;
  }
}