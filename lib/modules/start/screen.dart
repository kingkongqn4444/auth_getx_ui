import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img_bg'.assetPathPNG),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset(
          'ic_text_logo'.assetPathPNG,
          height: 40,
        ),
      ),
    );
  }
}
