import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/theme/app_theme.dart';
import 'package:get/get.dart';

import '../theme/app_color.dart';
import '../utils/dimension.dart';



void SuccessMessage({required String message,Function? then}){
  Flushbar(
    messageText: Text(message, style: Get.textTheme.bodyText1!.copyWith(color: AppColor.White,fontWeight: Dimension.textMedium),),
    icon: const Icon(Icons.check_circle,color: AppColor.White,),
    backgroundColor: AppColor.Green,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(Get.context!).then((value) {
    if(then!=null) {
      then();
    }
  });
}
void ErrorMessage({required var message,Function? then}){
  Flushbar(
    messageText: Text(message, style: Get.textTheme.bodyText1!.copyWith(color: AppColor.White,fontWeight: Dimension.textMedium),),
    icon: const Icon(Icons.cancel,color: AppColor.White,),
    backgroundColor: AppColor.Red,
    duration: const Duration(seconds: 2),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(Get.context!).then((value) {
    if(then!=null) {
      then();
    }
  });
}