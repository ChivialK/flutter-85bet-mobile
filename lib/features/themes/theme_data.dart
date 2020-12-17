import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/features/themes/font_size.dart';
import 'package:flutter_85bet_mobile/features/router/my_page_transition_builder.dart';

import 'theme_color_interface.dart';

class MyThemeData {
  final ThemeColorInterface interface;
  final Brightness brightness;

  const MyThemeData(this.interface, this.brightness);

  ThemeData getData() {
    return ThemeData(
      brightness: brightness,
      primaryColor: interface.defaultPrimaryColor,
      accentColor: interface.defaultAccentColor,
      backgroundColor: interface.defaultBackgroundColor,
      scaffoldBackgroundColor: interface.defaultBackgroundColor,
      dialogBackgroundColor: interface.dialogBgColor,
      // screen drawer color
      canvasColor: interface.sideMenuPrimaryColor,
      cardColor: interface.defaultCardColor,
      colorScheme: (brightness == Brightness.dark)
          ? ColorScheme.dark().copyWith(
              primary: interface.defaultAccentColor,
              secondary: interface.defaultWidgetColor)
          : ColorScheme.light().copyWith(
              primary: interface.defaultAccentColor,
              secondary: interface.defaultWidgetColor),
      //Route Animation
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: MyPageTransitionBuilder(),
        TargetPlatform.android: MyPageTransitionBuilder(),
      }),
      appBarTheme: AppBarTheme(color: interface.defaultAppbarColor),
      tabBarTheme: TabBarTheme(
          unselectedLabelColor: interface.defaultTabUnselectedColor,
          labelColor: interface.defaultAccentColor,
          labelStyle: TextStyle(fontSize: FontSize.NORMAL.value),
          labelPadding: const EdgeInsets.only(top: 4.0)),

      ///
      /// Icons Theme
      ///
      dividerColor: interface.defaultDividerColor,
      iconTheme: IconThemeData(color: interface.iconColor),
      primaryIconTheme: IconThemeData(color: interface.iconSubColor1),
      accentIconTheme: IconThemeData(color: interface.defaultAccentColor),

      ///
      /// Selector Theme
      ///
      unselectedWidgetColor: interface.defaultSelectableWidgetColor,
      toggleableActiveColor: interface.defaultAccentColor,

      ///
      /// Buttons Theme
      ///
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: interface.iconColor,
          backgroundColor: interface.iconBgColorTrans,
          elevation: 2.0),
      buttonTheme: ButtonThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          padding: const EdgeInsets.fromLTRB(4.0, 6.0, 4.0, 8.0),
          // set button minimum width, default is 88
          minWidth: 60,
          textTheme: ButtonTextTheme.primary,
          buttonColor: interface.buttonPrimaryColor,
          disabledColor: interface.buttonDisabledColor),

      ///
      /// Text Theme
      ///
      hintColor: interface.defaultHintColor,
      disabledColor: interface.defaultDisabledColor,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: interface.defaultTextColor,
              fontSize: FontSize.HEADER.value),
          headline6: TextStyle(
              color: interface.defaultTextColor,
              fontSize: FontSize.TITLE.value),
// input text color
          subtitle1: TextStyle(
              color: interface.defaultSubtitleColor,
              fontSize: FontSize.MESSAGE.value),
          subtitle2: TextStyle(
              color: interface.defaultHintColor,
              fontSize: FontSize.SUBTITLE.value),
          bodyText1: TextStyle(
              color: interface.defaultTextColor,
              fontSize: FontSize.SUBTITLE.value),
          bodyText2: TextStyle(
              color: interface.secondaryTextColor2,
              fontSize: FontSize.NORMAL.value),
          button: TextStyle(
              color: interface.buttonTextPrimaryColor,
              fontSize: FontSize.NORMAL.value),
          caption: TextStyle(
              color: interface.defaultMessageColor,
              fontSize: FontSize.NORMAL.value - 1),
          overline: TextStyle(
              color: interface.defaultIndicatorColor,
              fontSize: FontSize.NORMAL.value - 2)),

      ///
      /// Input-Field Theme
      ///
      indicatorColor: interface.defaultIndicatorColor,
      cursorColor: interface.iconColor,
      textSelectionHandleColor: interface.iconSubColor1,
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: true,
        // filled the field with color
        fillColor: interface.fieldInputBgColor,
        isDense: true,
        // used less vertical space
        labelStyle: TextStyle(
            color: interface.fieldInputHintColor,
            fontSize: FontSize.NORMAL.value),
        helperStyle: TextStyle(
            color: interface.defaultMessageColor,
            fontSize: FontSize.NORMAL.value),
        hintStyle: TextStyle(
            color: interface.defaultHintColor, fontSize: FontSize.NORMAL.value),
        errorStyle: TextStyle(
            color: interface.defaultErrorColor,
            fontSize: FontSize.NORMAL.value),
      ),

      ///
      /// Chip Theme
      ///
      chipTheme: ChipThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        deleteIconColor: interface.iconColor,
        disabledColor: interface.defaultDisabledColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        labelStyle: TextStyle(
            color: interface.defaultTextColor,
            fontSize: FontSize.SUBTITLE.value),
        padding: const EdgeInsets.all(4.0),
        secondaryLabelStyle: TextStyle(
            color: interface.defaultAccentColor,
            fontSize: FontSize.NORMAL.value - 2),
        selectedColor: interface.defaultAccentColor,
        secondarySelectedColor: interface.defaultIndicatorColor,
        shape: StadiumBorder(
            side: BorderSide(
                color: interface.defaultAccentColor,
                width: 2.0,
                style: BorderStyle.solid)),
      ),

      ///
      /// Slider Theme
      ///
      sliderTheme: SliderThemeData(
        trackHeight: 3.0,
        activeTrackColor: Color(0xff1976e0),
        inactiveTrackColor: Color(0x3d1976e0),
        disabledActiveTrackColor: Color(0x520f498a),
        disabledInactiveTrackColor: Color(0x1f0f498a),
        activeTickMarkColor: Color(0x8ad1e4fa),
        inactiveTickMarkColor: Color(0x8a1976e0),
        disabledActiveTickMarkColor: Color(0x1fd1e4fa),
        disabledInactiveTickMarkColor: Color(0x1f0f498a),
        thumbColor: Color(0xff1976e0),
        disabledThumbColor: Color(0x520f498a),
        thumbShape: RoundSliderThumbShape(),
        overlayColor: Color(0x291976e0),
        valueIndicatorColor: Color(0xff1976e0),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        showValueIndicator: ShowValueIndicator.onlyForDiscrete,
        valueIndicatorTextStyle: TextStyle(
          color: Color(0xffffffff),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
