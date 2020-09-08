import 'package:flutter/material.dart';
import 'package:flutter_85bet_mobile/core/internal/font_size.dart';
import 'package:flutter_85bet_mobile/features/router/my_page_transition_builder.dart';

export 'font_size.dart';
export 'hex_color.dart';

final appTheme = Themes();

class Themes {
  static const isDarkTheme = false;
  static const defaultBackgroundColor = Color(0xffeaeaea);
  static const defaultLayerBackgroundColor = Color(0xffffffff);
  static const defaultPrimaryColor = Color(0xff38394b);
  static const defaultAccentColor = Color(0xff1a77df);
  static const defaultAppbarColor = Color(0xff38394b);
  static const defaultMarqueeBarColor = Color(0xf0797999);
  static const defaultMarqueeTextColor = Color(0xfff0f0f0);
  static const defaultWidgetColor = Color(0xfff5f5f5);
  static const defaultSelectableWidgetColor = Color(0xff1a77df);
  static const defaultWidgetBgColor = Color(0xff1a77df);
  static const defaultDisabledColor = Color(0xff989898);
  static const defaultErrorColor = Color(0xffe53935);
  static const defaultBorderColor = Color(0xff606084);
  static const defaultIndicatorColor = Color(0xff3f3f5a);
  static const defaultDividerColor = Color(0xff4a4a4a);
  static const defaultGridColor = Colors.white60;
  static const defaultGridTextColor = Color(0xff424242);
  static const defaultCardColor = Colors.white60;
  static const defaultCardTitleColor = Color(0xff2a60ba);

  static const defaultTextColor = Color(0xff383838);
  static const secondaryTextColor1 = Color(0xffffffff);
  static const secondaryTextColor2 = Color(0xff303030);
  static const defaultSubtitleColor = Color(0xff4285f4);
  static const defaultHintColor = Color(0xff545454);
  static const defaultHintSubColor = Color(0xffa8a8a8);
  static const defaultMessageColor = Color(0xff424242);
  static const defaultTabUnselectedColor = Color(0xffb5b5b5);

  static const drawerIconColor = Color(0xffffffff);
  static const drawerIconSubColor = Color(0xffffffff);
  static const sideMenuPrimaryColor = Color(0xffffffff);
  static const sideMenuSecondaryColor = Color(0xffffffff);
  static const sideMenuButtonColor = Color(0xffffffff);
  static const sideMenuButtonTextColor = Color(0xff383838);
  static const sideMenuHeaderTextColor = Color(0xffffffff);
  static const sideMenuIconColor = Color(0xffffffff);
  static const sideMenuIconBgColor = Color(0xff1a77df);
  static const sideMenuIconTextColor = Color(0xff383838);

  static const dialogBgColor = Color(0xffeaeaea);
  static const dialogBgColor0 = Color(0xff606266);
  static const dialogBgColor1 = Color(0xff2a2a2a);
  static const dialogBgTransparent = Color(0x66bcbcbc);
  static const dialogTextColor = Color(0xff383838);
  static const dialogTitleColor = Color(0xff1561b7);
  static const dialogTitleBgColor = Color(0xffffffff);
  static const dialogCloseIconColor = Color(0xff303030);

  static const iconColor = Color(0xffffffff);
  static const iconSubColor1 = Color(0xffffffff);
  static const iconSubColor2 = Color(0xff606060);
  static const iconSubColor3 = Color(0xff3a3a3a);
  static const iconColorGreen = Color(0xff40b92c);
  static const iconColorYellow = Color(0xffffdd3a);
  static const iconBgColorTrans = Color(0x40a4a4a4);
  static const iconTextColor = Color(0xff3a3a3a);

  // default color or selected
  static const buttonPrimaryColor = Color(0xff2a60ba);
  static const buttonTextPrimaryColor = Color(0xffffffff);
  // unselected button
  static const buttonSecondaryColor = Color(0xffd2d2d2);
  // sub color button (ex. readme)
  static const buttonSubColor = Color(0xff969696);
  static const buttonTextSubColor = Color(0xffc8c8c8);
  static const buttonDisabledColor = Color(0xff606060);
  static const buttonDisabledColorDark = Color(0xff888888);
  static const buttonDisabledTextColor = Color(0xffa0a0a0);
  static const buttonBorderColor = Color(0xffffffff);
  static const pagerButtonColor = Color(0xff828282);
  static const pagerButtonSelectedColor = Color(0xff3b3b3b);

  static const fieldInputColor = Color(0xff303030);
  static const fieldInputBgColor = Color(0xffe1e1e1);
  static const fieldReadOnlyBgColor = Color(0xffd3d3d3);
  static const fieldInputHintColor = Color(0xff969696);
  static const fieldPrefixBgColor = Color(0xffffffff);
  static const fieldPrefixColor = Color(0xff383838);
  static const fieldPrefixSubColor = Color(0xffffffff);
  static const fieldSuffixColor = Color(0xff2a60ba);
  static const fieldSuffixSubColor = Color(0xffffffff);

  static const fieldInputSubBgColor = Color(0xff686868);
  static const fieldReadOnlySubBgColor = Color(0xff3f3f3f);
  static const fieldInputSubColor = Color(0xffeaeaea);
  static const fieldInputHintSubColor = Color(0xffb0b0b0);
  static const fieldCursorSubColor = Color(0xff90caf9);

  static const double fieldHeight = 53.6;
  static const double fieldIconSize = 24.0;
  static const double prefixTextWidthFactor = 0.3;
  static const double prefixTextSpacing = 0.0;
  static const double prefixIconWidthFactor = 0.166;
  static const double suffixWidthFactor = 0.314;
  static const double horizontalInset = 32.0;
  static const double minusSize = 8.0;

  static const hintHighlight = Color(0xffff6975);
  static const hintHighlightDarkRed = Color(0xffe63f3f);
  static const hintHighlightRed = Color(0xffff0000);
  static const hintHighlightYellow = Color(0xffffdd3a);
  static const hintHighlightLightYellow = Color(0xffffe6b1);
  static const hintHighlightOrange = Color(0xffde9c57);
  static const hintHighlightOrangeStrong = Color(0xffff9e4c);
  static const hintHyperLink = Color(0xff23538d);
  static const hintDarkRed = Color(0xff752121);

  static const chartBorderColor = Color(0xff969696);
  static const chartPrimaryHeaderColor = Color(0xff2a60ba);
  static const chartPrimaryHeaderTextColor = Color(0xffffffff);
  static const chartSecondaryHeaderColor = Color(0xffa0a0a0);
  static const chartBgColor = Color(0xffeaeaea);

  static const navigationColor = Color(0xff848484);
  static const navigationColorFocus = Color(0xffd6d3ff);

  static const homeFavoriteColor = Color(0xffffffff);
  static const homeTabBgColor = Color(0xffffffff);
  static const homeTabDividerColor = Color(0xff1a77df);
  static const homeTabIconColor = Color(0xfff0f0f0);
  static const homeTabIconBgColor = Color(0xff1a77df);
  static const homeTabTextColor = Color(0xff1a77df);
  static const homeTabSelectedTextColor = Color(0xffffffff);
  static const homeBoxBgColor = Color(0xff515175);
  static const homeBoxHintBgColor = Color(0xff1a77df);
  static const homeBoxHintTextColor = Color(0xffffffff);
  static const homeBoxInfoTextColor = Color(0xffffffff);
  static const homeBoxDividerColor = Color(0xff606084);
  static const homeBoxIconColor = Color(0xffffffff);
  static const homeBoxIconTextColor = Color(0xffffffff);
  static const homeBoxButtonTextColor = Color(0xff383838);

  static const promoTabBgColor = Color(0xffffffff);
  static const promoTabIconColor = Color(0xffb5b5b5);
  static const promoTabTextColor = Color(0xffb5b5b5);
  static const promoTabSelectedBgColor = Color(0xff1a77df);
  static const promoTabSelectedIconColor = Color(0xffffffff);
  static const promoTabSelectedTextColor = Color(0xffffffff);

  static const memberIconColor = Color(0xff2a60ba);
  static const memberLinearColor1 = Color(0xff1f44ba);
  static const memberLinearColor2 = Color(0xff4285f4);
  static const memberLinearColor3 = Color(0xff2a60ba);

  static const moreDialogColor = Color(0xffc5c5c5);
  static const moreGridColor = Color(0xfff0f0f0);

  static const balanceCardBackground = Color(0xfff5f5f5);
  static const balanceCardTitleColor = Color(0xff515175);
  static const balanceCardTextColor = Color(0xff2a60ba);
  static const balanceActionTextColor = Color(0xffff9e4c);
  static const balanceAction2TextColor = Color(0xffe63f3f);
  static const balanceActionDisableTextColor = Color(0xffb7b7b7);
  static const balanceRefreshColor = Color(0xff484848);

  static const walletCardBgColor = Color(0xff4285f4);
  static const walletCardIconBgColor = Color(0xffeeeeee);
  static const walletBoxBackgroundColor = Color.fromRGBO(42, 96, 186, 0.1);
  static const walletBoxBorderColor = Color(0xff2a60ba);
  static const walletBoxButtonColor = Color(0xff09347b);
  static const walletRadioColor = Color(0xff484848);
  static const walletCreditTitleColor = Color(0xff2a60ba);
  static const walletCreditColor = Color(0xff2a60ba);

  static const vipCardBackgroundColor = Color(0xffd2d2d2);
  static const vipTitleBackgroundColor = Color(0xff4285f4);
  static const vipTitleBackgroundSubColor = Color(0xfff5f5f5);
  static const vipIconBackgroundColor = Color(0xffffffff);
  static const vipIconColor = Color(0xff4285f4);
  static const vipIconTextColor = Color(0xffffffff);
  static const vipTitleColor = Color(0xff2a60ba);
  static const vipTextColor = Color(0xff424242);
  static const vipLinearBgColor1 = Color(0xffffffff);
  static const vipLinearBgColor2 = Color(0xfff5f5f5);
  static const vipProgressColor = Color(0xffa9a9a9);
  static const vipProgressCircleColor = Color(0xff2a60ba);
  static const vipProgressBorderColor = Color(0xff2a60ba);

  static const storeDialogBackground = Color(0xfff5f5f5);
  static const storeDialogSpanText = Color(0xff424242);
  static const storeHighlightTextColor = Color(0xffff6975);

  static const layerShadowDecorRound = BoxDecoration(
    color: defaultLayerBackgroundColor,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 2.15,
        blurRadius: 3.0,
        offset: Offset(3, 3), // changes position of shadow
      ),
    ],
  );

  static const layerShadowDecorRoundTop = BoxDecoration(
    color: defaultLayerBackgroundColor,
    borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 2.15,
        blurRadius: 3.0,
        offset: Offset(3, 3), // changes position of shadow
      ),
    ],
  );

  static const layerShadowDecorRoundBottom = BoxDecoration(
    color: defaultLayerBackgroundColor,
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 2.15,
        blurRadius: 3.0,
        offset: Offset(3, 3), // changes position of shadow
      ),
    ],
  );

  static const gridItemShadowDecor = BoxDecoration(
    color: defaultLayerBackgroundColor,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black12,
        spreadRadius: 1.15,
        blurRadius: 2.0,
        offset: Offset(2, 2), // changes position of shadow
      ),
    ],
  );

  static const roundIconShadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black26,
      spreadRadius: 1.15,
      blurRadius: 2.0,
      offset: Offset(2, 2), // changes position of shadow
    ),
  ];

  final defaultTheme = ThemeData.dark().copyWith(
    primaryColor: defaultPrimaryColor,
    accentColor: defaultAccentColor,
    backgroundColor: defaultBackgroundColor,
    dialogBackgroundColor: dialogBgColor,
    cardColor: defaultCardColor,
    // screen drawer color
    canvasColor: sideMenuPrimaryColor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: defaultAccentColor,
      secondary: defaultWidgetColor,
    ),
    // Route Animation
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: MyPageTransitionBuilder(),
      TargetPlatform.android: MyPageTransitionBuilder(),
    }),
    /* Widgets Theme */
    scaffoldBackgroundColor: defaultBackgroundColor,
    appBarTheme: AppBarTheme(color: defaultAppbarColor),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Themes.defaultTabUnselectedColor,
      labelColor: Themes.defaultAccentColor,
      labelStyle: TextStyle(fontSize: FontSize.NORMAL.value),
      labelPadding: const EdgeInsets.only(top: 4.0),
    ),
    /* Icons Theme */
    dividerColor: defaultDividerColor,
    iconTheme: IconThemeData(color: iconColor),
    primaryIconTheme: IconThemeData(color: iconSubColor1),
    accentIconTheme: IconThemeData(color: defaultAccentColor),
    /* Selector Theme */
    unselectedWidgetColor: defaultSelectableWidgetColor,
    toggleableActiveColor: defaultAccentColor,
    /* Buttons Theme */
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: iconColor,
      backgroundColor: iconBgColorTrans,
      elevation: 2.0,
    ),
    buttonTheme: ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
      padding: EdgeInsets.fromLTRB(4.0, 6.0, 4.0, 8.0),
      // set button minimum width, default is 88
      minWidth: 60,
      textTheme: ButtonTextTheme.primary,
      buttonColor: buttonPrimaryColor,
      disabledColor: buttonDisabledColor,
    ),
    /* Text Theme */
    hintColor: defaultHintColor,
    disabledColor: defaultDisabledColor,
    textTheme: TextTheme(
      headline5:
          TextStyle(color: defaultTextColor, fontSize: FontSize.TITLE.value),
      headline6:
          TextStyle(color: defaultTextColor, fontSize: FontSize.TITLE.value),
      // input text color
      subtitle1: TextStyle(
          color: defaultSubtitleColor, fontSize: FontSize.MESSAGE.value),
      subtitle2:
          TextStyle(color: defaultHintColor, fontSize: FontSize.SUBTITLE.value),
      bodyText1:
          TextStyle(color: defaultTextColor, fontSize: FontSize.SUBTITLE.value),
      bodyText2: TextStyle(
          color: secondaryTextColor2, fontSize: FontSize.NORMAL.value),
      button: TextStyle(
          color: buttonTextPrimaryColor, fontSize: FontSize.NORMAL.value),
      caption: TextStyle(
          color: defaultMessageColor, fontSize: FontSize.NORMAL.value - 1),
      overline: TextStyle(
          color: defaultIndicatorColor, fontSize: FontSize.NORMAL.value - 2),
    ),
    /* Input-Field Theme */
    indicatorColor: defaultIndicatorColor,
    cursorColor: iconColor,
    textSelectionHandleColor: iconSubColor1,
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      filled: true, // filled the field with color
      fillColor: fieldInputBgColor,
      isDense: true, // used less vertical space
      labelStyle: TextStyle(
        color: fieldInputHintColor,
        fontSize: FontSize.NORMAL.value,
      ),
      helperStyle: TextStyle(
        color: defaultMessageColor,
        fontSize: FontSize.NORMAL.value,
      ),
      hintStyle: TextStyle(
        color: defaultHintColor,
        fontSize: FontSize.NORMAL.value,
      ),
      errorStyle: TextStyle(
        color: defaultErrorColor,
        fontSize: FontSize.NORMAL.value,
      ),
    ),
    /* Chip Theme */
    chipTheme: ChipThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      deleteIconColor: iconColor,
      disabledColor: defaultDisabledColor,
      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
      labelStyle: TextStyle(
        color: defaultTextColor,
        fontSize: FontSize.SUBTITLE.value,
      ),
      padding: EdgeInsets.all(4.0),
      secondaryLabelStyle: TextStyle(
        color: defaultAccentColor,
        fontSize: FontSize.NORMAL.value - 2,
      ),
      selectedColor: defaultAccentColor,
      secondarySelectedColor: defaultIndicatorColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: defaultAccentColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),
    ),
    /* Slider Theme */
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
    /* Switch Button Theme */
//    toggleButtonsTheme: ToggleButtonsThemeData(
//      this.textStyle, //文本样式
//      this.constraints,//定义button尺寸
//      this.color,//文本和Icon的颜色
//      this.selectedColor,//选中文本和Icon的颜色
//      this.disabledColor,//禁用文本和Icon的颜色
//      this.fillColor,//选中button填充颜色
//      this.focusColor,//按钮具有输入焦点时用于填充按钮的颜色。
//      this.highlightColor,//高亮颜色
//      this.hoverColor,// 指针悬停在它上面时的颜色
//      this.splashColor,// 水波纹颜色
//      this.borderColor,//边框颜色
//      this.selectedBorderColor,//选中边框颜色
//      this.disabledBorderColor,//禁用边框颜色
//      this.borderRadius,//边框半径
//      this.borderWidth,//边框宽度
//    ),
  );
}

///Example of changing the replace app theme color
//new Theme(
//  data: Theme.of(context).copyWith(accentColor: Colors.yellow),
//  child: Text('copyWith method'),
//);

///Example of child widget uses theme color
//new Container(
//  color: Theme.of(context).accentColor,
//  child: new Text(
//    'Text with a background color',
//    style: Theme.of(context).textTheme.title,
//  ),
//);

///ThemeData color usage
/// Ref: https://juejin.im/post/5d751714f265da03ad14765c
//factory ThemeData({
//Brightness brightness, // 应用整体主题的亮度。用于按钮之类的小部件，以确定在不使用主色或强调色时选择什么颜色。
//MaterialColor primarySwatch,// 定义一个单一的颜色以及十个色度的色块。
//Color primaryColor, // 应用进程主要部分的背景颜色(toolbars、tab bars 等)
//Brightness primaryColorBrightness, // primaryColor的亮度。用于确定文本的颜色和放置在主颜色之上的图标(例如工具栏文本)。
//Color primaryColorLight, // primaryColor的浅色版
//Color primaryColorDark, // primaryColor的深色版
//Color accentColor, // 小部件的前景色(旋钮、文本、覆盖边缘效果等)。
//Brightness accentColorBrightness, // accentColor的亮度。
//Color canvasColor, //  MaterialType.canvas 的默认颜色
//Color scaffoldBackgroundColor, // Scaffold的默认颜色。典型Material应用进程或应用进程内页面的背景颜色。
//Color bottomAppBarColor, // BottomAppBar的默认颜色
//Color cardColor, // Card的颜色
//Color dividerColor, // Divider和PopupMenuDivider的颜色，也用于ListTile之间、DataTable的行之间等。
//Color highlightColor, // 选中在泼墨动画期间使用的突出显示颜色，或用于指示菜单中的项。
//Color splashColor,  // 墨水飞溅的颜色。InkWell
//InteractiveInkFeatureFactory splashFactory, // 定义由InkWell和InkResponse反应产生的墨溅的外观。
//Color selectedRowColor, // 用于突出显示选定行的颜色。
//Color unselectedWidgetColor, // 用于处于非活动(但已启用)状态的小部件的颜色。例如，未选中的复选框。通常与accentColor形成对比。也看到disabledColor。
//Color disabledColor, // 禁用状态下部件的颜色，无论其当前状态如何。例如，一个禁用的复选框(可以选中或未选中)。
//Color buttonColor, // RaisedButton按钮中使用的Material 的默认填充颜色。
//ButtonThemeData buttonTheme, // 定义按钮部件的默认配置，如RaisedButton和FlatButton。
//Color secondaryHeaderColor, // 选定行时PaginatedDataTable标题的颜色。
//Color textSelectionColor, // 文本框中文本选择的颜色，如TextField
//Color cursorColor, // 文本框中光标的颜色，如TextField
//Color textSelectionHandleColor,  // 用于调整当前选定的文本部分的句柄的颜色。
//Color backgroundColor, // 与主色形成对比的颜色，例如用作进度条的剩余部分。
//Color dialogBackgroundColor, // Dialog 元素的背景颜色
//Color indicatorColor, // 选项卡中选定的选项卡指示器的颜色。
//Color hintColor, // 用于提示文本或占位符文本的颜色，例如在TextField中。
//Color errorColor, // 用于输入验证错误的颜色，例如在TextField中
//Color toggleableActiveColor, // 用于突出显示Switch、Radio和Checkbox等可切换小部件的活动状态的颜色。
//String fontFamily, // 文本字体
//TextTheme textTheme, // 文本的颜色与卡片和画布的颜色形成对比。
//TextTheme primaryTextTheme, // 与primaryColor形成对比的文本主题
//TextTheme accentTextTheme, // 与accentColor形成对比的文本主题。
//InputDecorationTheme inputDecorationTheme, // 基于这个主题的 InputDecorator、TextField和TextFormField的默认InputDecoration值。
//IconThemeData iconTheme, // 与卡片和画布颜色形成对比的图标主题
//IconThemeData primaryIconTheme, // 与primaryColor形成对比的图标主题
//IconThemeData accentIconTheme, // 与accentColor形成对比的图标主题。
//SliderThemeData sliderTheme,  // 用于呈现Slider的颜色和形状
//TabBarTheme tabBarTheme, // 用于自定义选项卡栏指示器的大小、形状和颜色的主题。
//CardTheme cardTheme, // Card的颜色和样式
//ChipThemeData chipTheme, // Chip的颜色和样式
//TargetPlatform platform,
//MaterialTapTargetSize materialTapTargetSize, // 配置某些Material部件的命中测试大小
//PageTransitionsTheme pageTransitionsTheme,
//AppBarTheme appBarTheme, // 用于自定义Appbar的颜色、高度、亮度、iconTheme和textTheme的主题。
//BottomAppBarTheme bottomAppBarTheme, // 自定义BottomAppBar的形状、高度和颜色的主题。
//ColorScheme colorScheme, // 拥有13种颜色，可用于配置大多数组件的颜色。
//DialogTheme dialogTheme, // 自定义Dialog的主题形状
//Typography typography, // 用于配置TextTheme、primaryTextTheme和accentTextTheme的颜色和几何TextTheme值。
//CupertinoThemeData cupertinoOverrideTheme
//})
