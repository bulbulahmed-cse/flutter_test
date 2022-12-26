import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../utils/dimension.dart';
import 'app_color.dart';

AppTheme(){
  return ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColor.Primary,
    ),
    primaryColor: AppColor.Primary,
    primaryColorDark: AppColor.Primary,
    primaryColorLight: AppColor.Primary,
    scaffoldBackgroundColor: AppColor.Background,
    dividerColor: AppColor.White,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: AppColor.White,
      titleTextStyle: TextStyle(color: AppColor.Primary,fontSize: 18.sm,fontWeight: Dimension.textBold),
      iconTheme: IconThemeData(
        color: Colors.black
      )
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      shadowColor: AppColor.Card_Shadow,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r)
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
            (states) {
          if (states.contains(MaterialState.selected)) {
            return AppColor.Primary; // the color when checkbox is selected;
          }
          return AppColor.White; //the color when checkbox is unselected;
        },
      ),
      side: const BorderSide(color: Colors.black),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.r)),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.Button_Color,
    ),
    iconTheme: const IconThemeData(
      color: AppColor.Icon_Color
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 16.sm,
            fontWeight: Dimension.textBold),
        headline2: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 14.sm,
            fontWeight: Dimension.textBold
        ),
        headline3: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 12.sm,
            fontWeight: Dimension.textBold
        ),
        headline4: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 10.sm,
            fontWeight: Dimension.textBold
        ),
        subtitle1: TextStyle(
            color: AppColor.Text_Color, fontSize: 14.sm,fontWeight: Dimension.textRegular),
        bodyText1: TextStyle(
            color: AppColor.Text_Color, fontSize: 14.sm,fontWeight: Dimension.textRegular,height: 1.3,),
        bodyText2: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 12.sm,fontWeight: Dimension.textRegular),
        headline6: TextStyle(
            color: AppColor.Text_Color,
            fontSize: 10.sm,fontWeight: Dimension.textRegular)),


  );
}