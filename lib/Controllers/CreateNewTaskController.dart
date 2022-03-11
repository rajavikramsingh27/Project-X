import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreateNewTaskController extends GetxController {
  Rx<TextEditingController> txtDate = TextEditingController().obs;


  RxBool agree = false.obs;
  RxInt yesandno = 0.obs;

  reset() {
    yesandno.value = 0;
    agree.value;

  }

}
